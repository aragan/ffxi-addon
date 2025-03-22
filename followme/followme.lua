_addon.name = 'FollowMe'
_addon.author = 'Ivaar'
_addon.command = 'fm'

require('luau')
require('pack')
require('config')

default = {
    actions = true,
    nolockon = true,
    assist = {
        name = '',
        pursue = true,
        attack = false,
        enabled = false,
        distance = L{0,2},
    },
    follow = {
        name = '',
        enabled = true,
        distance = L{3,5},
    },
}

settings = config.load(default)

broadcasting = true
leader_zone = 0
pos = {}

local player_name = (windower.ffxi.get_mob_by_target('me') or {}).name
local zone_id = windower.ffxi.get_info().zone
local last_attempt = os.clock()
local last_coords = {}
local engaged

windower.register_event('incoming chunk',function(id, data, modified, is_injected, is_blocked)
    if id == 0x0A then
        zone_id = data:unpack('H', 49)
        pos = {}
    end
end)

windower.register_event('outgoing chunk',function(id, data, modified, is_injected, is_blocked)
    if id == 0x5C then
        pos = {}
    elseif id == 0x05E then
        if broadcasting and data:unpack('I', 0x04+1) ~= 1903324538 then
            windower.send_ipc_message('zone %d %s ':format(zone_id, player_name) .. table.concat(last_coords, ' '))
        end
        zone_line = nil
    end
end)

windower.register_event('ipc message', function(message)
    message = message:split(' ')

    if message[1] == 'set' then
        if message[2] == 'actions' then
            settings.actions = message[3] == 'on'
            last_coords = {}
            pos = {}
        elseif message[2] == 'report' then
            log(message:concat(' ', 3))
        elseif message[3]:ucfirst() == player_name or message[3] == 'all' then
            local silent = message[3] == 'all'
            message:remove(3)
            message:remove(1)
            adjust_setting(message, silent)
        end
        return
    end

    if not settings.actions then return end

    local sender_name = message:remove(3)
    local sender_zone = tonumber(message:remove(2))
    if sender_zone ~= zone_id then return end

    if message[1] == 'pos' and settings.follow.enabled and sender_name == settings.follow.name  then
        leader_zone = sender_zone
        table.remove(message, 1)
        table.insert(pos, message)
    elseif message[1] == 'engage' and settings.assist.enabled and sender_name == settings.assist.name then
        battle_target = tonumber(message[2])
    elseif message[1] == 'zone' and settings.follow.enabled and sender_name == settings.follow.name then
        table.remove(message, 1)
        zone_line = message
    end
end)

local function get_distance(a, b)
    return math.sqrt((a[1]-b[1])^2 + (a[3]-b[3])^2)
end

local function get_distance_3d(a, b)
    return math.sqrt((a[1]-b[1])^2 + (a[2]-b[2])^2 + (a[3]-b[3])^2)
end

local function run_to_point(a, b)
    if nolockon and windower.ffxi.get_player().target_locked then
        windower.send_command('input /lockon')
    end

    if not b then
        windower.ffxi.run(a[4])
        return
    end

    local x, y = a[1]-b[1], a[3]-b[3]
    local r = -math.atan2(y,x)
    local v = windower.ffxi.get_player().autorun

    if not v or not running or running ~= r then
        windower.ffxi.run(r)
        windower.ffxi.turn(r)
        running = r
    end
end

local function is_claimed(claim_id)
    for _, member in pairs(windower.ffxi.get_party()) do
        if type(member) == 'table' and member.mob and claim_id == member.mob.id then
            return true
        end
    end
    return false
end

function valid_target(target)
    if not target or
        target.hpp == 0 or
        not target.valid_target or
        target.spawn_type ~= 16 or
        target.charmed or
        (target.status ~= 0 and target.status ~= 1) or
        (not is_claimed(target.claim_id) and target.claim_id ~= 0) or
        windower.ffxi.get_map_data() ~= windower.ffxi.get_map_data(target.index) then

        return false
    end
    return true
end

local states = S{0,1,5,85}

function do_loop()
    local player = windower.ffxi.get_mob_by_target('me')

    if not player or not states:contains(player.status) then return end

    local coords = {player.x,player.z,player.y,player.heading}

    if coords[1] == 0 and coords[3] == 0 then return end

    if broadcasting and player.status ~= 1 and (coords[3] ~= last_coords[3] or coords[1] ~= last_coords[1]) then
        last_coords = coords
        windower.send_ipc_message('pos %d %s ':format(zone_id, player_name) .. table.concat(coords, ' '))
    end

    if broadcasting and player.status == 1 then
        local target_index = (windower.ffxi.get_mob_by_target('t') or {}).index

        if target_index and target_index ~= last_target then
            last_target = target_index
            windower.send_ipc_message('engage %d %s %d':format(zone_id, player_name, target_index))
        end
    elseif last_target then
        last_target = nil
        last_coords = {}
        windower.send_ipc_message('engage %d %s':format(zone_id, player_name))
    end

    if settings.assist.enabled and battle_target then
        pos = {}
        local target = windower.ffxi.get_mob_by_index(battle_target)
        local target_coords = {target.x,target.z,target.y}
        local dist = get_distance_3d(target_coords, coords)

        if settings.assist.pursue then
            if dist - player.model_size > target.model_size + settings.assist.distance:max() then
                run_to_point(target_coords, coords)
            elseif dist - player.model_size < target.model_size + settings.assist.distance:min() then
            --elseif dist - player.model_size < settings.assist.distance:min() then
                run_to_point(coords, target_coords)
            else--if running then
                windower.ffxi.run(false)
                windower.ffxi.turn(-math.atan2(target_coords[3]-coords[3], target_coords[1]-coords[1]))
            end
        end

        if settings.assist.attack and (not engaged or engaged ~= target.index or player.status == 0) then
            if last_attempt + 2 < os.clock() and valid_target(target) and dist < 29 then else return end
            engaged = target.index
            last_attempt = os.clock()
            if player.status == 1 then
                windower.packets.inject_outgoing(0x1A, 'IIHHd2':pack(0xE1A, target.id, target.index, 0x0F, 0, 0))
            elseif player.status == 0 then
                windower.packets.inject_outgoing(0x1A, 'IIHHd2':pack(0xE1A, target.id, target.index, 0x02, 0, 0))
            end
        end
    elseif settings.assist.enabled and engaged then
        local target = windower.ffxi.get_mob_by_index(engaged)

        if player.status == 0 then
            engaged = nil
        elseif player.status == 1 and valid_target(target) and last_attempt + 2 < os.clock() then
            last_attempt = os.clock()
            windower.packets.inject_outgoing(0x1A, 'IIHHd2':pack(0xE1A, player.id, player.index, 0x04, 0, 0))
        end

    elseif pos[1] or settings.follow.enabled or running then

        while pos[1] and get_distance(pos[1], coords) < 0.9 do
            table.remove(pos, 1)
        end

        local dist = pos[1] and get_distance(pos[1], coords)

        if dist and dist < 30 then
            run_to_point(pos[1], coords)
        elseif not pos[1] and zone_line then
            run_to_point(zone_line)
        elseif zone_id == leader_zone and running then
            if windower.ffxi.get_player().autorun then
                windower.ffxi.run(false)
                running = false
            end
        end
    end
end

do_loop:loop(0.1)

function addon_message(str, silent)
    if not silent then
        windower.send_ipc_message('set report ' .. str)
    end
    log(str)
end

function adjust_setting(arg, silent)
    local setting = arg[1]

    if not arg[2] then
        settings[setting].enabled = not settings[setting].enabled
        addon_message('%s %s %s.':format(player_name, setting, settings[setting].enabled and 'enabled' or 'disabled'), silent)
    elseif arg[2] == 'on' then
        settings[setting].enabled = true
        addon_message('%s %s enabled.':format(player_name, setting), silent)
    elseif arg[2] == 'off' then
        settings[setting].enabled = false
        addon_message('%s %s disabled.':format(player_name, setting), silent)
    --[[elseif tonumber(arg[2]) then
        local min = tonumber(arg[2])
        local max = tonumber(arg[3])

        if min and max then
            settings[setting].distance = L{min, max}
        end]]
    elseif arg[2] ~= player_name then
        settings[setting].name = (tostring(arg[2]) or ''):ucfirst()
        addon_message('%s %sing %s.':format(player_name, setting, settings[setting].name), silent)
    end
    settings:save()
end

windower.register_event('addon command', function(...)
    arg = L(arg):map(string.lower)

    if not arg[1] then
        notice([[
fm <on|off> - global ipc
fm <follow|assist> [name|all] [on|off|target] - name to send ipc command]])
    elseif arg[1] == 'eval' then
        assert(loadstring(table.concat(arg, ' ',2)))()
    elseif arg[1] == 'follow' or arg[1] == 'assist' then
        if arg[2] and not tonumber(arg[2]) then
            arg[#arg] = (windower.ffxi.get_mob_by_target(arg[#arg]) or {name=arg[#arg]}).name
        end
        if not arg[3] then
            adjust_setting(arg)
        elseif arg[2]:ucfirst() == player_name then
            arg:remove(2)
            adjust_setting(arg)
        else
            arg:insert(1, 'set')
            windower.send_ipc_message(arg:concat(' '))
        end
    elseif arg[1] == 'off' or arg[1] == 'on' then
        settings.actions = arg[1] == 'on'
        last_coords = {}
        windower.send_ipc_message('set actions %s':format(arg[1]))
        addon_message('Actions %s.':format(settings.actions and 'enabled' or 'disabled'))
    else
        local targ = windower.ffxi.get_mob_by_target(arg[1]) or windower.ffxi.get_mob_by_name(arg[1]:ucfirst())
        settings.follow.name = targ and targ.name or arg[1]:ucfirst()
        last_coords = {}
        settings.actions = true
        pos = {}
        windower.send_ipc_message('set follow all on')
        windower.send_ipc_message('set actions %s':format('on'))
        windower.send_ipc_message('set follow all %s':format(settings.follow.name))
    end
end)
