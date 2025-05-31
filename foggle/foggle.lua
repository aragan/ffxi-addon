_addon.name = 'foggle'
_addon.author = 'Lili'
_addon.version = '0.0.1'
_addon.command = 'foggle'

require('logger')

local player

local followed = false

windower.register_event('login', 'load', function()
    if not windower.ffxi.get_info().logged_in then
        player = false
    end
    
    local p = windower.ffxi.get_player() or {}
    player = p.name
    followed = false
end)

windower.register_event('zone change', 'logout', function()
    followed = false
end)

windower.register_event('addon command', function(...)
    if not player then
        return
    end
    
    local msg
    
    if not followed then
        msg = 'please follow %s':format(player)
        followed = true
    else
        msg = 'please stop'
        followed = false
    end
    
    windower.send_ipc_message(msg)
end)

windower.register_event('ipc message', function(str)
    if not player then
        return
    end
    
    local action = str:match('^please (.*)')
    
    if action == 'stop' then
        windower.ffxi.run(false)
        return
    elseif action:startswith('follow') then
        local target = str:match("(%w*)$")
    
        if windower.ffxi.get_mob_by_name(target) then
            windower.chat.input("/follow %s":format(target))
        end
    end
end)