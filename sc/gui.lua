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

function UpdateGUI(chainSc, chainMb)
	local guiStr = "[SC/MB]"
	local fontColour = "\\cs(0, 255, 0)"

	if chainSc ~= nil then
		local timeRemainingSc = chainSc.expiry - os.time()

		if timeRemainingSc < 0 then
			timeRemainingSc = 0
		end		

		guiStr = guiStr .. "\n" .. fontColour .. "[SC][" .. timeRemainingSc .. "] " .. chainSc.description
	end

	if chainMb ~= nil then
		local timeRemainingMb = chainMb.expiry - os.time()

		if timeRemainingMb < 0 then
			timeRemainingMb = 0
		end		

		guiStr = guiStr .. "\n" .. fontColour .. "[MB][" .. timeRemainingMb .. "] " .. chainMb.description
	end

	gui:text(guiStr)
	gui:visible(true)
end