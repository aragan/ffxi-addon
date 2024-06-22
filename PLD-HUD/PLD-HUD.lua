--[[
Copyright © 2022, Kwech of Bahamut
All rights reserved.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of PLD-HUD nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Kwech BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

_addon.name = 'PLD-HUD'
_addon.author = 'Kwech'
_addon.version = '1.2'
_addon.command = 'pld'

-- .5 dev
--1.0 full function, out to test
--1.1 timer to reprisal

texts = require('texts')
timer1 = texts.new("")
timer2 = texts.new("")
timer3 = texts.new("")
reprisalTimer = texts.new("")

texts.size(timer1, 24)
texts.size(timer2, 24)
texts.size(timer3, 24)
texts.size(reprisalTimer, 16)
texts.color(reprisalTimer, 255, 0, 0)

local time_start = 0

local prev = {0, 0, 0, 0}

local iPosition_x = 720
local iPosition_y = 160

--for future size commands
--FOR THE USER: You can set these using the number listed in comment

local sizeMod = .5           --.5 for small, .75 for large
local sizeOffset = 0          --0 for small, 2 for large

--normal
local majestyOffset = {0, 0, 0, 0} 
local crusadeOffset = {48, 45, 75, 70}
local reprisalOffset = {105, 55, 155, 85}
local phalanxOffset = {135, 135, 190, 190}
local rampartOffset = {185, 10, 270, 20}
local palisadeOffset = {185, 43, 270, 70}
local sentinelOffset = {185, 75, 270, 120}
local timer1Offset = {220, 8, 340, 25}
local timer2Offset = {220, 40, 340, 75}
local timer3Offset = {220, 70, 340, 125}
local rTimerOffset = {115, 95, 340, 125}

texts.visible(timer1, false)
texts.pos(timer1, iPosition_x + timer1Offset[1+sizeOffset], iPosition_y + timer1Offset[2+sizeOffset])
texts.bg_alpha(timer1, 0)

texts.visible(timer2, false)
texts.pos(timer2, iPosition_x + timer2Offset[1+sizeOffset], iPosition_y + timer2Offset[2+sizeOffset])
texts.bg_alpha(timer2, 0)

texts.visible(timer3, false)
texts.pos(timer3, iPosition_x + timer3Offset[1+sizeOffset], iPosition_y + timer3Offset[2+sizeOffset])
texts.bg_alpha(timer3, 0)

texts.visible(reprisalTimer, false)
texts.pos(reprisalTimer, iPosition_x + rTimerOffset[1+sizeOffset], iPosition_y + rTimerOffset[2+sizeOffset])
texts.bg_alpha(reprisalTimer, 0)

--PLD
local vMajesty = 100
local vReprisal = 100
local vCrusade = 100
local vPhalanx = 100

local vSentinel = 100
local vRampart = 100
local vPalisade = 100


local tRecast = {0, 0, 0, 0}

local recastM = {0, 0, 0, 0}
local recastS = {0, 0, 0, 0}

windower.register_event('load', function()


	--Majesty
	windower.prim.create('majesty')
	windower.prim.set_color('majesty', vMajesty, vMajesty, vMajesty, vMajesty)
	windower.prim.set_fit_to_texture('majesty', false)
	windower.prim.set_texture('majesty', windower.addon_path .. 'assets/Majesty.png')
	windower.prim.set_repeat('majesty',1,1)
    windower.prim.set_visibility('majesty',true)
	windower.prim.set_position('majesty', iPosition_x + majestyOffset[1+sizeOffset], iPosition_y + majestyOffset[2+sizeOffset])
	windower.prim.set_size('majesty', 354*sizeMod, 331*sizeMod)
	
	--Crusade
	windower.prim.create('crusade')
	windower.prim.set_color('crusade', vCrusade, vCrusade, vCrusade, vCrusade)
	windower.prim.set_fit_to_texture('crusade', false)
	windower.prim.set_texture('crusade', windower.addon_path .. 'assets/crusade.png')
	windower.prim.set_repeat('crusade',1,1)
    windower.prim.set_visibility('crusade',true)
	windower.prim.set_position('crusade', iPosition_x + crusadeOffset[1+sizeOffset], iPosition_y + crusadeOffset[2+sizeOffset])
	windower.prim.set_size('crusade', 115*sizeMod, 171*sizeMod)
	
	--Reprisal
	windower.prim.create('reprisal')
	windower.prim.set_color('reprisal', vReprisal, vReprisal, vReprisal, vReprisal)
	windower.prim.set_fit_to_texture('reprisal', false)
	windower.prim.set_texture('reprisal', windower.addon_path .. 'assets/reprisal.png')
	windower.prim.set_repeat('reprisal',1,1)
    windower.prim.set_visibility('reprisal',true)
	windower.prim.set_position('reprisal', iPosition_x + reprisalOffset[1+sizeOffset], iPosition_y + reprisalOffset[2+sizeOffset])
	windower.prim.set_size('reprisal', 116*sizeMod, 138*sizeMod)

	--Phalanx
	windower.prim.create('phalanx')
	windower.prim.set_color('phalanx', vPhalanx, vPhalanx, vPhalanx, vPhalanx)
	windower.prim.set_fit_to_texture('phalanx', false)
	windower.prim.set_texture('phalanx', windower.addon_path .. 'assets/phalanx.png')
	windower.prim.set_repeat('phalanx',1,1)
    windower.prim.set_visibility('phalanx',true)
	windower.prim.set_position('phalanx', iPosition_x + phalanxOffset[1+sizeOffset], iPosition_y + phalanxOffset[2+sizeOffset])
	windower.prim.set_size('phalanx', 95*sizeMod, 80*sizeMod)
	
--Dim when on cd
	
	--Palisade
	windower.prim.create('palisade')	
	windower.prim.set_color('palisade', 255, 255, 255, 255)
	windower.prim.set_fit_to_texture('palisade', false)
	windower.prim.set_texture('palisade', windower.addon_path .. 'assets/palisade.png')
	windower.prim.set_repeat('palisade',1,1)
    windower.prim.set_visibility('palisade',true)
	windower.prim.set_position('palisade', iPosition_x + palisadeOffset[1+sizeOffset], iPosition_y + palisadeOffset[2+sizeOffset])
	windower.prim.set_size('palisade', 207*sizeMod, 60*sizeMod)
	
	--Rampart
	windower.prim.create('rampart')	
	windower.prim.set_color('rampart', 255, 255, 255, 255)
	windower.prim.set_fit_to_texture('rampart', false)
	windower.prim.set_texture('rampart', windower.addon_path .. 'assets/rampart.png')
	windower.prim.set_repeat('rampart',1,1)
    windower.prim.set_visibility('rampart',true)
	windower.prim.set_position('rampart', iPosition_x + rampartOffset[1+sizeOffset], iPosition_y + rampartOffset[2+sizeOffset])
	windower.prim.set_size('rampart', 207*sizeMod, 60*sizeMod)
	
	--Sentinel
	windower.prim.create('sentinel')	
	windower.prim.set_color('sentinel', 255, 255, 255, 255)
	windower.prim.set_fit_to_texture('sentinel', false)
	windower.prim.set_texture('sentinel', windower.addon_path .. 'assets/sentinel.png')
	windower.prim.set_repeat('sentinel',1,1)
    windower.prim.set_visibility('sentinel',true)
	windower.prim.set_position('sentinel', iPosition_x + sentinelOffset[1+sizeOffset], iPosition_y + sentinelOffset[2+sizeOffset])
	windower.prim.set_size('sentinel', 207*sizeMod, 60*sizeMod)
end);

windower.register_event('prerender', function()

    if os.time() > time_start then
        time_start = os.time()		
        ability_hud() 
    end
	
end)

windower.register_event('addon command', function(command, ...)
	command = command and command:lower() or 'help'
	local args = ...	
	
	--This code will eventually let you change size and save that setting
	--[[if command == 'size' or command == 's' then
		if args == 1 then
			print(command)
			print(args)
		end
	end]]--

end)

function ability_hud ()
	recasts = windower.ffxi.get_ability_recasts()
	spellRecasts = windower.ffxi.get_spell_recasts()
	
	-------------------------------------------------------------Rampart
	tRecast[0] = recasts[77] --rampart
	
	if ((tRecast[0] ~= 0 and prev[0] == 0)) then
		windower.prim.set_color('rampart', 100, 100, 100, 100)
		texts.visible(timer1, true)
		prev[0] = 1
	end
	
	if (tRecast[0] == 0 and prev[0] ~= 0) then
		windower.prim.set_color('rampart', 255, 255, 255, 255)
		texts.visible(timer1, false)
		prev[0] = 0
	end
	
	recastM[0] = math.floor(tRecast[0] / 60)
	recastS[0] = math.floor(tRecast[0] % 60)
	
	if (recastM[0] > 0) then
		if (recastS[0] > 9) then
			texts.text(timer1, tostring(recastM[0]) .. ":" .. tostring(recastS[0]))
		else
			texts.text(timer1, tostring(recastM[0]) .. ":0" .. tostring(recastS[0]))
		end
	else
		if (recastS[0] > 9) then
			texts.text(timer1, "  :" .. tostring(recastS[0]))
		else
			texts.text(timer1, "  :0" .. tostring(recastS[0]))
		end
	end
	------------------------------------------------------------Palisade
	tRecast[1] = recasts[42] --palisade
	
	if ((tRecast[1] ~= 0 and prev[1] == 0)) then
		windower.prim.set_color('palisade', 100, 100, 100, 100)
		texts.visible(timer2, true)
		prev[1] = 1
	end
	
	if (tRecast[1] == 0 and prev[1] ~= 0) then
		windower.prim.set_color('palisade', 255, 255, 255, 255)
		texts.visible(timer2, false)
		prev[1] = 0
	end
	
	recastM[1] = math.floor(tRecast[1] / 60)
	recastS[1] = math.floor(tRecast[1] % 60)
	
	if (recastM[1] > 0) then
		if (recastS[1] > 9) then
			texts.text(timer2, tostring(recastM[1]) .. ":" .. tostring(recastS[1]))
		else
			texts.text(timer2, tostring(recastM[1]) .. ":0" .. tostring(recastS[1]))
		end
	else
		if (recastS[1] > 9) then
			texts.text(timer2, "  :" .. tostring(recastS[1]))
		else
			texts.text(timer2, "  :0" .. tostring(recastS[1]))
		end
	end
	-----------------------------------------------------------Sentinel
	tRecast[2] = recasts[75] --sentinel
	
	if ((tRecast[2] ~= 0 and prev[2] == 0)) then
		windower.prim.set_color('sentinel', 100, 100, 100, 100)
		texts.visible(timer3, true)
		prev[2] = 1
	end
	
	if (tRecast[2] == 0 and prev[2] ~= 0) then
		windower.prim.set_color('sentinel', 255, 255, 255, 255)
		texts.visible(timer3, false)
		prev[2] = 0
	end
	
	recastM[2] = math.floor(tRecast[2] / 60)
	recastS[2] = math.floor(tRecast[2] % 60)
	
	if (recastM[2] > 0) then
		if (recastS[2] > 9) then
			texts.text(timer3, tostring(recastM[2]) .. ":" .. tostring(recastS[2]))
		else
			texts.text(timer3, tostring(recastM[2]) .. ":0" .. tostring(recastS[2]))
		end
	else
		if (recastS[2] > 9) then
			texts.text(timer3, "  :" .. tostring(recastS[2]))
		else
			texts.text(timer3, "  :0" .. tostring(recastS[2]))
		end
	end
	-----------------------------------------------------------Reprisal Spell Recast
	tRecast[3] = spellRecasts[97]
	
	recastM[3] = math.floor((tRecast[3] / 60)/60)
	recastS[3] = math.floor((tRecast[3] / 60)%60)
	
	if (recastM[3] > 0) then
		if (recastS[3] > 9) then
			texts.text(reprisalTimer, tostring(recastM[3]) .. ":" .. tostring(recastS[3]))
		else
			texts.text(reprisalTimer, tostring(recastM[3]) .. ":0" .. tostring(recastS[3]))
		end
	else
		if (recastS[3] > 9) then
			texts.text(reprisalTimer, "  :" .. tostring(recastS[3]))
		else
			texts.text(reprisalTimer, "  :0" .. tostring(recastS[3]))
		end
	end
	
	if (tRecast[3] == 0) then
		texts.text(reprisalTimer, "rdy!")
	end

end

windower.register_event('lose buff', function(buff_id)
	--Majesty
	if (buff_id == 621) then
		vMajesty = 100
		windower.prim.set_color('majesty', vMajesty, vMajesty, vMajesty, vMajesty)
	end
	--Crusade
	if (buff_id == 289) then
		vCrusade = 100
		windower.prim.set_color('crusade', vCrusade, vCrusade, vCrusade, vCrusade)
	end
	--Reprisal
	if (buff_id == 403) then
		vReprisal = 100
		windower.prim.set_color('reprisal', vReprisal, vReprisal, vReprisal, vReprisal)
		texts.visible(reprisalTimer, true)
	end
	--Phalanx
	if (buff_id == 116) then
		vPhalanx = 100
		windower.prim.set_color('phalanx', vPhalanx, vPhalanx, vPhalanx, vPhalanx)
	end
	ability_hud ()
end)

windower.register_event('gain buff', function(buff_id)
	--Majesty
	if (buff_id == 621) then
		vMajesty = 255
		windower.prim.set_color('majesty', vMajesty, vMajesty, vMajesty, vMajesty)
	end
	--Crusade
	if (buff_id == 289) then
		vCrusade = 255
		windower.prim.set_color('crusade', vCrusade, vCrusade, vCrusade, vCrusade)
	end
	--Reprisal
	if (buff_id == 403) then
		vReprisal = 255
		windower.prim.set_color('reprisal', vReprisal, vReprisal, vReprisal, vReprisal)
		texts.visible(reprisalTimer, false)
	end
	--Phalanx
	if (buff_id == 116) then
		vPhalanx = 255
		windower.prim.set_color('phalanx', vPhalanx, vPhalanx, vPhalanx, vPhalanx)
	end
	ability_hud ()
end)

function delete()
	windower.prim.delete('majesty')	
	windower.prim.delete('crusade')
	windower.prim.delete('reprisal')
	windower.prim.delete('phalanx')
	windower.prim.delete('sentinel')
end

windower.register_event('unload',function()
	delete()
end)

windower.register_event('logout',function()
	windower.send_command('lua u PLD-HUD')
end)

windower.register_event('job change',function(main_job_id)
	if (main_job_id ~= 7) then
		windower.send_command('lua u PLD-HUD')
	end
end)