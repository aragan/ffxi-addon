_addon.author = 'Ivaar'
_addon.name = 'steps'
_addon.version = '0.0.0.3'

require('luau')
require('pack')
texts = require('texts')

default = {}
default.display = {}
default.display.text= {}
default.display.text.size= 12
default.display.text.font = 'Consolas'
default.display.pos = {}
default.display.pos.x = 0
default.display.pos.y = 0

settings = config.load(default)
step_display = texts.new('',settings.display,settings)

lasttime = os.clock()

step_tracker = {}

death_messages = {[6]=true,[20]=true,[113]=true,[406]=true,[605]=true,[646]=true}

steps = {
    [519] = {id=386, message='Lethargic Daze'},
    [520] = {id=391, message='Sluggish Daze'},
    [521] = {id=396, message='Weakened Daze'},
    [591] = {id=448, message='Bewildered Daze'},
}

function initialize()
    local player = windower.ffxi.get_player() or {}
    ext_step_dur = 'DNC' == player.main_job and player.job_points.dnc.step_duration or 0
    player_id = player.id
end

windower.register_event('load','login','job change', initialize)

function display_box(target)
    local t = {}

    -- should I sort daze effects by duration remaining?
    --local temp = L(step_tracker[target])
    --table.sort(temp, function(a,b) return a.ts > b.ts end)

    for k, v in pairs(step_tracker[target]) do
        t[#t+1] = '%-16sLv.%d: %.0f':format(v.message, v.step, v.ts-os.clock())
    end

    return table.concat(t, '\n')
end

windower.register_event('prerender', function()
    local clock = os.clock()

    if clock - lasttime > 0.1 then lasttime = clock else return end

    local target = windower.ffxi.get_mob_by_target('t')

    if target and step_tracker[target.id] then
        step_display:text(display_box(target.id))
        step_display:show()
    else
        step_display:hide()
    end
end)

windower.register_event('incoming chunk', function(id, data)
    if id == 0x28 then
        local actor,targets,category,param = data:unpack('Ib10b4b16', 6)
        local target = data:unpack('b32', 19, 7)
        local effect_level = data:unpack('b17', 27, 6)
        local effect = steps[data:unpack('b10', 29, 7)]

        if category == 14 and effect then
            step_tracker[target] = step_tracker[target] or {}

            local tracked = step_tracker[target][effect.id]
            local dur = tracked and tracked.ts-os.clock() or 0
            local ext = actor == player_id and ext_step_dur or 0
            dur = dur > 0 and math.min(dur+30+ext, 120) or 60+ext

            step_tracker[target][effect.id] = {id=param, message=effect.message, step=effect_level, ts=os.clock()+dur}
        end
    elseif id == 0x29 then
        local target, effect = data:unpack('IH', 9)
        local message = data:unpack('H', 25)

        if step_tracker[target] == nil then return end

        if message == 206 then
            step_tracker[target][effect] = nil
        elseif death_messages[message] then
            step_tracker[target] = nil
        end
    end
end)

function reset()
    step_tracker = {}
end

windower.register_event('zone change','logout', reset)
