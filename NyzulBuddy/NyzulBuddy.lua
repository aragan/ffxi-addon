_addon.name = 'NyzulBuddy'
_addon.author = 'Uwu/Darkdoom'
_addon.version = '2.0.9.2020'
_addon.command = 'nb'
_addon.commands = {'start', 'stop', 'help'}
_addon.language = 'english'

packets = require('packets')
config = require('config')
texts = require('texts')
-- create default settings file for textbox

default_settings = {}
default_settings.pos = {}
default_settings.pos.x = 144
default_settings.pos.y = 144
default_settings.text = {}
default_settings.text.font = 'Segoe UI'
default_settings.text.size = 12
default_settings.text.alpha = 255
default_settings.text.red = 246
default_settings.text.green = 131
default_settings.text.blue = 188
default_settings.bg = {}
default_settings.bg.alpha = 175
default_settings.bg.red = 052
default_settings.bg.green = 109
default_settings.bg.blue = 166
settings = config.load('data\\settings.xml',default_settings)

--lamps table

tLamps = {
	[0x2D4] = {},
	[0x2D5] = {},
	[0x2D6] = {},
	[0x2D7] = {},
	[0x2D8] = {},
	[0x2D2] = {},
	[0x2D3] = {},
}

clock = os.clock()
text_box = texts.new(settings)

running = true

--Run packet injection/force update from server on NPC

function Update()

	local indexes = {
		["Lamp1"] = 0x2D4, 
		["Lamp2"] = 0x2D5,  
		["Lamp3"] = 0x2D6,  
		["Lamp4"] = 0x2D7, 
		["Lamp5"] = 0x2D8, 
		["RoT1"] = 0x2D2, 
		["Rot2"] = 0x2D3,
	}

	for k,v in pairs(indexes) do
		local p = packets.new('outgoing', 0x016, {
			["Target Index"] = v
		})
		packets.inject(p)

	end

end
  
  --Handles commands


function nb_command(...)

	local arg = {...}

	if #arg > 3 then

		windower.add_to_chat(167, 'Invalid command. //nb help for valid options.')

	elseif #arg == 1 and arg[1]:lower() == 'start' then

		if running == false then

			running = true
			windower.add_to_chat(200, 'NyzulBuddy starting')


		else

			windower.add_to_chat(200, 'NyzulBuddy is already running.')

		end

	elseif #arg == 1 and arg[1]:lower() == 'stop' then

		if running == true then

			running = false
			windower.add_to_chat(200, 'NyzulBuddy stopping')

		else

			windower.add_to_chat(200, 'NyzulBuddy is not running.')

		end

	elseif #arg == 1 and arg[1]:lower() == 'help' then

		windower.add_to_chat(200, 'Available Options:')
		windower.add_to_chat(200, '  //nb start - turns on NyzulBuddy and starts sending lamp packets')
		windower.add_to_chat(200, '  //nb stop - turns off NyzulBuddy')	
		windower.add_to_chat(200, '  //nb help - displays this text')

	end

end

windower.register_event('addon command', nb_command(...))
--Register and parse incoming 0x0E for relevant data

windower.register_event("incoming chunk", function(id, data)
	
	if id == 0x0E  then

        local packet     = packets.parse('incoming', data)
		local mob_index  = packet["Index"]
		local indexes = {
			["Lamp1"] = 0x2D4, 
			["Lamp2"] = 0x2D5,  
			["Lamp3"] = 0x2D6,  
			["Lamp4"] = 0x2D7, 
			["Lamp5"] = 0x2D8, 
			["RoT1"] = 0x2D2, 
			["RoT2"] = 0x2D3
		}

			if mob_index == indexes["Lamp1"] then
			mob = windower.ffxi.get_mob_by_index(mob_index)
			tLamps[0x2D4] = mob
			
			elseif mob_index == indexes["Lamp2"] then
			mob = windower.ffxi.get_mob_by_index(mob_index)
			tLamps[0x2D5] = mob
			
			elseif mob_index == indexes["Lamp3"] then
			mob = windower.ffxi.get_mob_by_index(mob_index)
			tLamps[0x2D6] = mob 
			
			elseif mob_index == indexes["Lamp4"] then
			mob = windower.ffxi.get_mob_by_index(mob_index)
			tLamps[0x2D7] = mob

			elseif mob_index == indexes["Lamp5"] then
			mob = windower.ffxi.get_mob_by_index(mob_index)
			tLamps[0x2D8] = mob

			elseif mob_index == indexes["RoT1"] then
			mob = windower.ffxi.get_mob_by_index(mob_index)
			tLamps[0x2D2] = mob

			elseif mob_index == indexes["RoT2"] then
			mob = windower.ffxi.get_mob_by_index(mob_index)
			tLamps[0x2D3] = mob
				
		 end

	end

end)

function Display()

	if tLamps[0x2D4].id ~= nil then
	
		distance = math.sqrt(tLamps[0x2D4].distance)
		distance2 = math.sqrt(tLamps[0x2D5].distance)
		distance3 = math.sqrt(tLamps[0x2D6].distance)
		distance4 = math.sqrt(tLamps[0x2D7].distance)
		distance5 = math.sqrt(tLamps[0x2D8].distance)
		distance6 = math.sqrt(tLamps[0x2D2].distance)
		distance7 = math.sqrt(tLamps[0x2D3].distance)

		new_text =
		   tLamps[0x2D4].name .. " ID: [" .. (tLamps[0x2D4].index) .. "] exists; Distance: " .. math.ceil(distance) .. " yalms. \n" 
		.. tLamps[0x2D5].name .. " ID:  [" .. (tLamps[0x2D5].index) .. "] exists; Distance: " .. math.ceil(distance2) .. " yalms. \n" 
		.. tLamps[0x2D6].name .. " ID:  [" .. (tLamps[0x2D6].index) .. "] exists; Distance: " .. math.ceil(distance3) .. " yalms. \n" 
		.. tLamps[0x2D7].name .. " ID:  [" .. (tLamps[0x2D7].index) .. "] exists; Distance: " .. math.ceil(distance4) .. " yalms. \n" 
		.. tLamps[0x2D8].name .. " ID:  [" .. (tLamps[0x2D8].index) .. "] exists; Distance: " .. math.ceil(distance5) .. " yalms. \n" 		
		.. tLamps[0x2D2].name .. " *EVEN FLOOR* ID:  [" .. (tLamps[0x2D2].index) .. "] exists; Distance: " .. math.ceil(distance6) .. " yalms. \n" 		
		.. tLamps[0x2D3].name .. " *ODD FLOOR* ID:  [" .. (tLamps[0x2D3].index) .. "] exists; Distance: " .. math.ceil(distance7) .. " yalms. \n" 	

		text_box:text(new_text)
		text_box:visible(true)

	end

end

 windower.register_event('prerender', function()
		
	if running == true and os.clock() - clock > 1 then

		Update()
		Display()
		clock = os.clock()

	end
		
end)

  