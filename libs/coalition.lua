_addon.command = 'coal'

require('luau')
bit = require('bit')
packets = require('packets')

local maps = {}
maps.coalition = require('missions/coalition-assignments')
--maps.adoulin_missions = require('missions/missions-adoulin')

local missions = {completed={},current={}}

function to_set(data)
    return {data:unpack('q64':rep(#data/4))}
end

function to_list(data)
    local t = {}
    for x = 0, 8*#data-1 do
        if data:unpack('q', math.floor(x/8)+1, x%8+1) then
            t[#t+1] = x
        end
    end
    return t
end

function shift_assignments(data)
    return data:sub(1,2) .. data:sub(9,10) ..
           data:sub(3,4) .. data:sub(7,8) ..
           data:sub(5,6) .. data:sub(11)
end

windower.register_event('incoming chunk', function(id, data, modified, injected, blocked)
    if id == 0x056 then
        local p = packets.parse('incoming', data)
        local Type = bit.band(p.Type, 0xFFFF)
        if Type == 0x0100 then
            missions.current.coalition = p['Quest Flags']
        elseif Type == 0x0108 then
            missions.completed.coalition = p['Quest Flags']
        elseif Type == 0x00F0 then
            missions.current.adoulin = p['Quest Flags']
        elseif Type == 0x00F8 then
            missions.completed_adoulin = p['Quest Flags']
        end
    end
end)

windower.register_event('addon command', function(...)
    if arg[1] == 'eval' then
        assert(loadstring(table.concat(arg, ' ',2)))()
    else
        if not missions.completed.coalition then
            windower.add_to_chat(167, 'You must change areas before using this addon')
            return
        end
        local red = 167
        local green = 204
        local blue = 207
        local yellow = 159
        local complete_count,current_count = 0,0
        local current_coalition = to_set(shift_assignments(missions.current.coalition))
        local completed_coalition = to_set(shift_assignments(missions.completed.coalition))
        windower.add_to_chat(blue, 'Inactive\31\204 Completed\31\167 Current\31\159 Completed + Current')
        for id = 0, #maps.coalition do
            if #maps.coalition[id] > 8 then
                local complete = completed_coalition[id+1]
                local current = current_coalition[id+1]
                if complete then
                    complete_count = complete_count + 1
                end
                if current then
                    current_count = current_count + 1
                end
                local color = complete and current and yellow or complete and green or current and red or blue
                windower.add_to_chat(color, maps.coalition[id]:sub(2))
            end
        end
        windower.add_to_chat(blue,'%d/95 Complete and %d Current assignments':format(complete_count, current_count))
    end
end)
