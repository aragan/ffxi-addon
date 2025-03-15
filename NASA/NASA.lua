_addon.name = 'NASA'--'NotAnotherSparksAddon'
_addon.author = 'Ivaar'
_addon.version = '0.0.0.5'
_addon.commands = {'nasa'}

require('luau')
require('pack')
bit = require('bit')

local max_powders = 80*99
local move_powders = true
local stop_accolades = 0
local verbose = 1 -- 0 = minimal messages on command/finish, 1 = more messages, 2 debug messages

local state = 0  -- 0 = idle, 1 = waiting for menu, 2 = in a blocked menu, 3 = observed menu exit packet, wating for release
local sparks = windower.ffxi.get_info().logged_in and windower.packets.last_incoming(0x110):unpack('I', 0x04+1)
local last_attempt = os.time()

local zones = {
    [230] = {sparks = 'Rolandienne',     unity = 'Urbiolaine'},
    [235] = {sparks = 'Isakoth',         unity = 'Igsli'},
    [241] = {sparks = 'Fhelm Jobeizat',  unity = 'Teldro-Kesdrodo'},
    [256] = {sparks = 'Eternal Flame',   unity = 'Nunaarl Bthtrogg'},
}

local item_tab = {[5945]=true,[12385]=true}

local function add_to_chat(message, level)
    if level > verbose then return end
    windower.add_to_chat(207, '%s: %s':format(_addon.name, message))
end

local function space_available(bag_id)
    local bag = windower.ffxi.get_bag_info(bag_id)
    return bag.enabled and (bag.max - bag.count) or 0
end

local function put_away_items(items)
    local inventory = {}
    local count = 0
    for bag_id = 5, 7 do
        inventory[bag_id] = space_available(bag_id)
    end
    for index, item in ipairs(windower.ffxi.get_items(0)) do
        if items[item.id] and item.status == 0 then
            for bag_id = 5, 7 do
                if inventory[bag_id] > 0 then
                    count = count + item.count
                    inventory[bag_id] = inventory[bag_id] - 1
                    windower.ffxi.put_item(bag_id, index, item.count)
                    break
                end
            end
        end
    end
    return count
end

local function retrieve_items(items)
    local inventory = space_available(0)
    local count = 0
    for bag_id = 5, 7 do
        for index, item in ipairs(windower.ffxi.get_items(bag_id)) do
            if items[item.id] and item.status == 0 then
                if inventory == 0 then return count end
                count = count + item.count
                inventory = inventory - 1
                windower.ffxi.get_item(bag_id, index, item.count)
            end
        end
    end
    return count
end

local sparks_available = function(data, addr1, addr2)
    local sparks_total = data:unpack('i', addr1)
    local sparks_limit = data:unpack('i', addr2)

    return math.min(sparks_total, sparks_limit)
end

local get_option_index = {}

get_option_index.sparks = function(data, update)
    local limit = sparks_available+(update and {update, 0x04+1, 0x18+1} or {data, 0x0C+1, 0x1C+1})

    if limit() < 2755 then
        sparks_exhausted = true
        add_to_chat('\31\204finished\30\1 insufficient sparks!', 0)
    elseif space_available(0) <= (update and 1 or 0) then
        add_to_chat('\31\204finished\30\1 inventory full', 0)
    else
        return 0x290009, 1
    end
    return 0x40000000, 0
end

get_option_index.unity = function(data, update)
    local accolades = data:unpack('i', 0x10+1)
    if not update then
        add_to_chat('Menu intercepted...', 2)
        return 0x00A, 1
    end
    local option = windower.packets.last_outgoing(0x05B):unpack('b13', 0x08+1)
    if option == 0x184 then
        accolades = update:unpack('i', 0x0C+1)
    end
    if option == 0x00A or option == 0x184 then
        accolades_limit = update:unpack('i', 0x10+1)
    end
    local spendable = math.min(accolades - stop_accolades, accolades_limit)
    local count = math.floor(spendable / 10)
    if accolades >= 10 and count >= 1 then
        count = math.min(count, max_powders, space_available(0) * 99, 7920)
        if count >= 1 then
            if option == 0x00A then
                add_to_chat('requesting powders...', 2)
                return 0x183, 1
            end
            if option == 0x183 then
                move_items = spendable - (count*10) - 10 > stop_accolades
                add_to_chat('purchasing %d powders':format(count), 2)
                return 0x2000 * count + 0x184, 1
            end
        end
    end
    add_to_chat('\31\204finished\30\1 Accolades: (%d) Limit: (%d)':format(accolades, accolades_limit), 0)
    accolades_limit = nil
    return 0x40000000, 0
end

zones[230][995]  = get_option_index.sparks
zones[230][3529] = get_option_index.unity
zones[235][26]   = get_option_index.sparks
zones[235][598]  = get_option_index.unity
zones[241][850]  = get_option_index.sparks
zones[241][879]  = get_option_index.unity
zones[256][5081] = get_option_index.sparks
zones[256][5149] = get_option_index.unity

local function get_distance(a, b)
    return math.sqrt((a.x-b.x)^2 + (a.y-b.y)^2)
end

local function find_npc(name)
    local npc = windower.ffxi.get_mob_by_name(name)
    local self = windower.ffxi.get_mob_by_target('me')

    if npc and get_distance(self, npc) < 6 and npc.valid_target and npc.is_npc and bit.band(npc.spawn_type, 0xDF) == 2 then
        return npc
    end
end

local function interact_npc(npc)
    last_attempt = os.time()
    add_to_chat('Initiating NPC Interaction: %s':format(npc.name), 0)
    windower.packets.inject_outgoing(0x1A, 'I2H2d2':pack(0, npc.id, npc.index, 0, 0, 0))
    state = 1
end

local function inject_option(npc_id, npc_index, zone_id, menu_id, option_index, bool)
    windower.packets.inject_outgoing(0x5B, 'I3H4':pack(0, npc_id, option_index, npc_index, bool, zone_id, menu_id))
    state = 2
end

local function check_event(data, update)
    local zone_id, menu_id = data:unpack('H2', 0x2A+1)
    if zones[zone_id] and zones[zone_id][menu_id] then
        if update and update == last_update then
            return false
        end
        last_update = update
        local option_index, bool = zones[zone_id][menu_id](data, update)
        if option_index then
            inject_option(data:unpack('I', 0x04+1), data:unpack('H', 0x28+1), zone_id, menu_id, option_index, bool)
            return true
        end
    end
    return false
end

windower.register_event('incoming chunk', function(id, data, modified, injected, blocked)
    if id == 0x110 then
        sparks = data:unpack('I', 0x04+1)
    elseif id == 0x034 and state == 1 then
        if os.time()-last_attempt < 3 then
            return check_event(data)
        end
    elseif id == 0x05C and state == 2 then
        check_event(windower.packets.last_incoming(0x34), data)
    elseif id == 0x052 and state == 3 then
        state = 0
    elseif id == 0x01D and move_items then
        if move_powders then
            local count = put_away_items(item_tab)
            add_to_chat('putting away %d items!':format(count), 1)
        end
        move_items = false
    end
end)

windower.register_event('outgoing chunk', function(id, data, modified, injected, blocked)
    if id == 0x05B and state ~= 0 and (data:byte(15) == 0 or not injected)  then
        state = 3
    end
end)

windower.register_event('addon command', function(command, arg)
    local zone_id = windower.ffxi.get_info().zone
    local player = windower.ffxi.get_player()
    if not player or not zones[zone_id] then
        return
    elseif state == 1 and player.status == 0 and os.time()-last_attempt > 3 then
        state = 0
    end
    if command == 'stop_accolades' or command == 'accolades' then
        stop_accolades = tonumber(arg) or stop_accolades
        add_to_chat('will stop at %d accolades.':format(stop_accolades), 0)
    elseif player.status ~= 0 or state ~= 0 then
        notice('busy state: %d, status: %d':format(state, player.status))
    else
        local target
        if zones[zone_id].unity and (command == 'powder' or sparks_exhausted or sparks and sparks < 2755) then
            max_powders = tonumber(arg) or max_powders
            target = find_npc(zones[zone_id].unity)
        elseif zones[zone_id].sparks then
            target = find_npc(zones[zone_id].sparks)
        end
        if target then
            interact_npc(target)
        elseif move_powders then
            local count = retrieve_items(item_tab)
            add_to_chat('retrieving %d items!':format(count), 1)
        end
    end
end)

windower.register_event('zone change','login', function()
    sparks_exhausted = false
end)
