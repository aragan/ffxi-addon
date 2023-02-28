config = require('config')
texts = require('texts')

defaults = {}
defaults.pos = {}
defaults.pos.x = 300
defaults.pos.y = 475
defaults.text = {}
defaults.text.font = 'Arial'
defaults.text.size = 8
defaults.flags = {}
defaults.flags.bold = true
defaults.flags.draggable = true
defaults.bg = {}
defaults.bg.alpha = 128

settings = config.load(defaults)
gui = texts.new(settings)

listGUI = texts.new(settings)
settings = config.load()

function clear_gui()
	listGUI:text("")
	listGUI:visible(false)
end

function draw_gui(mob)
	if mob == nil then return end

	local guiStr = "[" .. mob.name .. "] " .. mob.hpp .. "%\n\n"

	if mob.move_history ~= nil then
		guiStr = guiStr .. "[ Move History]"
		
		for i = mob.move_history.first, mob.move_history.last do			
			local item = mob.move_history.items[i]
			if item ~= nil then

				local secsAgo = os.time() - item.start

				guiStr = guiStr .. "\n(-" .. secsAgo .. "s) "

				if item.casting == true then
					guiStr = guiStr .. "!! CASTING !! - " .. item.name
				elseif item.interrupted == true then
					guiStr = guiStr .. "Interrupted - " .. item.name
				else				
					guiStr = guiStr .. item.name
				end
			end
		end
	end

	listGUI:text(guiStr)
	listGUI:visible(true)
end