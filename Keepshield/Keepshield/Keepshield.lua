_addon.name = 'Keepshield'
_addon.author = 'Shiraj'
_addon.commands = {'shield'}
_addon.version = '1.2.2'

require('luau')
res = require('resources')

nextPing = os.clock()
enabled = true

windower.register_event('addon command', function (command,...)
	command = command and command:lower() or 'help'
	local args = T{...}
	if command == 'on' then
		enabled = true
		log('Keepshield turned on')
	elseif command == 'off' then
		enabled = false
		log('Keepshield turned off')
	elseif command == 'toggle' then
		enabled = not enabled
		log('Enabled set to: '..(enabled and 'true' or 'false'))
		local cmd = args[1]  
	elseif command == 'help' then
		enabled = false
		log('Command: "on"  turns the addon on.')
		log('Command: "off"  turns the addon off.')
		log('Command: "toggle"  switches the addon between on and off depending on the current status.')
	else
		log('Error: Unknown command')
	end
end)

windower.register_event('prerender',function()
    if os.clock()-nextPing > 0.2 then
    local player = windower.ffxi.get_player()
    local get_items = windower.ffxi.get_items()
	if enabled then
        if get_items.equipment.body == 0 and player.status ~= 'Event' then
           windower.chat.input('//gs c update;')
        end
        if get_items.equipment.main == 0 and player.status ~= 'Event' then
           windower.chat.input('//gs c update;')
        end
        if get_items.equipment.legs == 0 and player.status ~= 'Event' then
           windower.chat.input('//gs c update;')
        end
        if get_items.equipment.hands == 0 and player.status ~= 'Event' then
           windower.chat.input('//gs c update;')
        end
        if get_items.equipment.feet == 0 and player.status ~= 'Event' then
           windower.chat.input('//gs c update;')
        end
        if get_items.equipment.head == 0 and player.status ~= 'Event' then
           windower.chat.input('//gs c update;')
        end
        nextPing = os.clock()
	end	
    end
end)

windower.register_event('zone change',function(id)
	local info = windower.ffxi.get_info()
	if S{50,53,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,256,257,280,281}:contains(info.zone) and enabled then
		enabled = false
		log('In town, Keepshield turned off')
	else 
		enabled = true
		log('Out of town, Keepshield turned on')
	end	
end )
