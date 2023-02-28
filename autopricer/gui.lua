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

function UpdateGUI(itemPrices)
	if itemPrices == nil then
		gui:text("")
		gui:visible(false)
		return
	end

	local guiStr = "[Item prices]"

	if itemPrices.count > 0 then
		for i = itemPrices.first, itemPrices.last do
			guiStr = guiStr .. "\n" .. itemPrices.items[i].info 
		end
	end

	gui:text(guiStr)
	gui:visible(true)
end