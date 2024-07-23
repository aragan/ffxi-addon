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
    * Neither the name of DNC-HUD nor the
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

_addon.name = 'DNC-HUD'
_addon.author = 'Kwech'
_addon.version = '1.6'
_addon.command = 'dnc'

-- 1.4 first rewrite
-- 1.5 dark background added
-- 1.6 fan image added, F2 timer

texts = require('texts')
timer2 = texts.new("")
timer3 = texts.new("")
texts.size(timer2, 24)
texts.size(timer3, 24)

local time_start = 0

local previous = 0
local previous2 = 0

local iPosition_x = 750
local iPosition_y = 250

--for future size commands
--FOR THE USER: You can set these using the number listed in comment

local sizeMod = .75           --.75 for small, 1 for medium, 1.5 for large
local sizeOffset = 0          --0 for small, 2 for medium, 4 for large


local fanDanceToggle = false
local fanDanceShow = false

--normal
local bgOffset = {30, 22, 30, 18, 45, 18} 
local largeRoseOffset = {35, 20, 35, 20, 55, 20}
local smallRoseOffset = {30, 70, 30, 85, 50, 125}
local fmOffset = {0, 45, 0, 45, 0, 45}
local timerOffset = {55, 35, 80, 45, 130, 55}
local timer2Offset = {25, 95, 30, 120, 60, 185}
local saberOffset = {50, -60, 50, -80, 70, -120}

texts.visible(timer2, false)
texts.pos(timer2, iPosition_x + timer2Offset[1+sizeOffset], iPosition_y + timer2Offset[2+sizeOffset])
texts.bg_alpha(timer2, 0)

texts.visible(timer3, false)
texts.pos(timer3, iPosition_x + timerOffset[1+sizeOffset], iPosition_y + timerOffset[2+sizeOffset])
texts.bg_alpha(timer3, 0)

local vFM1 = 0
local vFM2 = 0
local vFM3 = 0
local vFM4 = 0
local vFM5 = 0
local vFM6 = 0

local vFan = 0
local vSaber = 0

local temp = 0
local temp2 = 0

local mins = 0
local secs = 0
local secs2 = 0

windower.register_event('load', function()

	--Saber Dance or Dagger
	windower.prim.create('dagger')
	windower.prim.set_color('dagger', vSaber, vSaber, vSaber, vSaber)
	windower.prim.set_fit_to_texture('dagger', false)
	windower.prim.set_texture('dagger', windower.addon_path .. 'assets/dagger.png')
	windower.prim.set_repeat('dagger',1,1)
    windower.prim.set_visibility('dagger',true)
	windower.prim.set_position('dagger', iPosition_x + saberOffset[1+sizeOffset], iPosition_y + saberOffset[2+sizeOffset])
	windower.prim.set_size('dagger', 120*sizeMod, 300*sizeMod)
	
	--Fan Image
	windower.prim.create('fan')
	windower.prim.set_color('fan', 0, 0, 0, 0)
	windower.prim.set_fit_to_texture('fan', false)
	windower.prim.set_texture('fan', windower.addon_path .. 'assets/FAN.png')
	windower.prim.set_repeat('fan',1,1)
    windower.prim.set_visibility('fan',true)
	windower.prim.set_position('fan', iPosition_x + largeRoseOffset[1+sizeOffset] + 25, iPosition_y + largeRoseOffset[2+sizeOffset] - 15)
	windower.prim.set_size('fan', 200*sizeMod, 200*sizeMod)
	
	--dark bg
	windower.prim.create('darkbg')
	windower.prim.set_color('darkbg', 255, 255, 255, 255)
	windower.prim.set_fit_to_texture('darkbg', false)
	windower.prim.set_texture('darkbg', windower.addon_path .. 'assets/darkbg.png')
	windower.prim.set_repeat('darkbg',1,1)
    windower.prim.set_visibility('darkbg',true)
	windower.prim.set_position('darkbg', iPosition_x + bgOffset[1+sizeOffset], iPosition_y + bgOffset[2+sizeOffset])
	windower.prim.set_size('darkbg', 155*sizeMod, 170*sizeMod)
	
	--Flourishes III or Large Rose
	windower.prim.create('flourishes3')	
	windower.prim.set_color('flourishes3', 255, 255, 255, 255)
	windower.prim.set_fit_to_texture('flourishes3', false)
	windower.prim.set_texture('flourishes3', windower.addon_path .. 'assets/rosehead.png')
	windower.prim.set_repeat('flourishes3',1,1)
    windower.prim.set_visibility('flourishes3',true)
	windower.prim.set_position('flourishes3', iPosition_x + largeRoseOffset[1+sizeOffset], iPosition_y + largeRoseOffset[2+sizeOffset])
	windower.prim.set_size('flourishes3', 150*sizeMod, 150*sizeMod)
	
	--Fan Dance for Large Rose
	windower.prim.create('blueRose')
	windower.prim.set_color('blueRose', 0, 0, 0, 0)
	windower.prim.set_fit_to_texture('blueRose', false)
	windower.prim.set_texture('blueRose', windower.addon_path .. 'assets/bluerose.png')
	windower.prim.set_repeat('blueRose',1,1)
    windower.prim.set_visibility('blueRose',true)
	windower.prim.set_position('blueRose', iPosition_x + largeRoseOffset[1+sizeOffset], iPosition_y + largeRoseOffset[2+sizeOffset])
	windower.prim.set_size('blueRose', 150*sizeMod, 150*sizeMod)

	--Flourishes II or Small Rose
	windower.prim.create('flourishes2')
	windower.prim.set_color('flourishes2', 255, 255, 255, 255)
	windower.prim.set_fit_to_texture('flourishes2', false)
	windower.prim.set_texture('flourishes2', windower.addon_path .. 'assets/rosehead2.png')
	windower.prim.set_repeat('flourishes2',1,1)
    windower.prim.set_visibility('flourishes2',true)
	windower.prim.set_position('flourishes2', iPosition_x + smallRoseOffset[1+sizeOffset], iPosition_y + smallRoseOffset[2+sizeOffset])
	windower.prim.set_size('flourishes2', 100*sizeMod, 100*sizeMod)
	
	--Fan Dance for Small Rose
	windower.prim.create('blueRoseHead')
	windower.prim.set_color('blueRoseHead', 0, 0, 0, 0)
	windower.prim.set_fit_to_texture('blueRoseHead', false)
	windower.prim.set_texture('blueRoseHead', windower.addon_path .. 'assets/bluerosehead.png')
	windower.prim.set_repeat('blueRoseHead',1,1)
    windower.prim.set_visibility('blueRoseHead',true)
	windower.prim.set_position('blueRoseHead', iPosition_x + smallRoseOffset[1+sizeOffset], iPosition_y + smallRoseOffset[2+sizeOffset])
	windower.prim.set_size('blueRoseHead', 100*sizeMod, 100*sizeMod)

	--FMs 1
	windower.prim.create('FM1')	
	windower.prim.set_color('FM1', vFM1, vFM1, vFM1, vFM1)
	windower.prim.set_fit_to_texture('FM1', false)
	windower.prim.set_texture('FM1', windower.addon_path .. 'assets/FM1.png')
	windower.prim.set_repeat('FM1',1,1)
    windower.prim.set_visibility('FM1',true)
	windower.prim.set_position('FM1', iPosition_x + fmOffset[1+sizeOffset], iPosition_y + fmOffset[2+sizeOffset])
	windower.prim.set_size('FM1', 60*sizeMod, 70*sizeMod)

	--FMs 2
	windower.prim.create('FM2')	
	windower.prim.set_color('FM2', vFM2, vFM2, vFM2, vFM2)
	windower.prim.set_fit_to_texture('FM2', false)
	windower.prim.set_texture('FM2', windower.addon_path .. 'assets/FM2.png')
	windower.prim.set_repeat('FM2',1,1)
    windower.prim.set_visibility('FM2',true)
	windower.prim.set_position('FM2', iPosition_x + fmOffset[1+sizeOffset], iPosition_y + fmOffset[2+sizeOffset])
	windower.prim.set_size('FM2', 60*sizeMod, 70*sizeMod)
	
	--FMs 3
	windower.prim.create('FM3')	
	windower.prim.set_color('FM3', vFM3, vFM3, vFM3, vFM3)
	windower.prim.set_fit_to_texture('FM3', false)
	windower.prim.set_texture('FM3', windower.addon_path .. 'assets/FM3.png')
	windower.prim.set_repeat('FM3',1,1)
    windower.prim.set_visibility('FM3',true)
	windower.prim.set_position('FM3', iPosition_x + fmOffset[1+sizeOffset], iPosition_y + fmOffset[2+sizeOffset])
	windower.prim.set_size('FM3', 60*sizeMod, 70*sizeMod)
	
	--FMs 4
	windower.prim.create('FM4')	
	windower.prim.set_color('FM4', vFM4, vFM4, vFM4, vFM4)	
	windower.prim.set_fit_to_texture('FM4', false)
	windower.prim.set_texture('FM4', windower.addon_path .. 'assets/FM4.png')
	windower.prim.set_repeat('FM4',1,1)
    windower.prim.set_visibility('FM4',true)
	windower.prim.set_position('FM4', iPosition_x + fmOffset[1+sizeOffset], iPosition_y + fmOffset[2+sizeOffset])
	windower.prim.set_size('FM4', 60*sizeMod, 70*sizeMod)
	
	--FMs 5
	windower.prim.create('FM5')	
	windower.prim.set_color('FM5', vFM5, vFM5, vFM5, vFM5)	
	windower.prim.set_fit_to_texture('FM5', false)
	windower.prim.set_texture('FM5', windower.addon_path .. 'assets/FM5.png')
	windower.prim.set_repeat('FM5',1,1)
    windower.prim.set_visibility('FM5',true)
	windower.prim.set_position('FM5', iPosition_x + fmOffset[1+sizeOffset], iPosition_y + fmOffset[2+sizeOffset])
	windower.prim.set_size('FM5', 60*sizeMod, 70*sizeMod)
	
	--FMs 5+
	windower.prim.create('FM6')	
	windower.prim.set_color('FM6', vFM6, vFM6, vFM6, vFM6)	
	windower.prim.set_fit_to_texture('FM6', false)
	windower.prim.set_texture('FM6', windower.addon_path .. 'assets/FM6.png')
	windower.prim.set_repeat('FM6',1,1)
    windower.prim.set_visibility('FM6',true)
	windower.prim.set_position('FM6', iPosition_x + fmOffset[1+sizeOffset], iPosition_y + fmOffset[2+sizeOffset])
	windower.prim.set_size('FM6', 70*sizeMod, 70*sizeMod)
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
	temp = recasts[226]
	temp2 = recasts[222]
	
	if ((temp ~= 0 and previous == 0) or fanDanceShow) then
		if(fanDanceToggle) then
			windower.prim.set_color('blueRose', 100, 100, 100, 100)
			windower.prim.set_color('fan', 100, 100, 100, 100)
		else
			windower.prim.set_color('flourishes3', 100, 100, 100, 100)
		end
		texts.visible(timer3, true)
		previous = 1
	end
	
	if (temp == 0 and previous ~= 0) then
		if(fanDanceToggle) then
			windower.prim.set_color('blueRose', 255, 255, 255, 255)
			windower.prim.set_color('fan', 255, 255, 255, 255)
		else
			windower.prim.set_color('flourishes3', 255, 255, 255, 255)
		end
		texts.visible(timer3, false)
		previous = 0
	end
	
	if ((temp2 ~= 0 and previous2 == 0) or fanDanceShow) then
		if(fanDanceToggle) then
			windower.prim.set_color('blueRoseHead', 100, 100, 100, 100)
		else
			windower.prim.set_color('flourishes2', 100, 100, 100, 100)
		end
		texts.visible(timer2, true)
		previous2 = 1		
		fanDanceShow = false
	end
	
	if (temp2 == 0 and previous2 ~= 0) then
		if(fanDanceToggle) then
			windower.prim.set_color('blueRoseHead', 255, 255, 255, 255)
		else
			windower.prim.set_color('flourishes2', 255, 255, 255, 255)
		end
		texts.visible(timer2, false)
		previous2 = 0
	end
	
	mins = math.floor(temp / 60)
	secs = math.floor(temp % 60)
	
	secs2 = math.floor(temp2 % 60)

	if (mins == 1) then
		if (secs > 9) then
			texts.text(timer3, "1:" .. tostring(secs))
		else
			texts.text(timer3, "1:0" .. tostring(secs))
		end
	else
		if (secs > 9) then
			texts.text(timer3, " :" .. tostring(secs))
		else
			texts.text(timer3, " :0" .. tostring(secs))
		end
	end
	
	if (secs2 > 9) then
			texts.text(timer2, " :" .. tostring(secs2))
		else
			texts.text(timer2, " :0" .. tostring(secs2))
	end
	
end

windower.register_event('lose buff', function(buff_id)
	if (buff_id == 381) then
		vFM1 = 0
		windower.prim.set_color('FM1', vFM1, vFM1, vFM1, vFM1)
	end
	if (buff_id == 382) then
		vFM2 = 0
		windower.prim.set_color('FM2', vFM2, vFM2, vFM2, vFM2)
	end
	if (buff_id == 383) then
		vFM3 = 0
		windower.prim.set_color('FM3', vFM3, vFM3, vFM3, vFM3)
	end
	if (buff_id == 384) then
		vFM4 = 0
		windower.prim.set_color('FM4', vFM4, vFM4, vFM4, vFM4)
	end
	if (buff_id == 385) then
		vFM5 = 0
		windower.prim.set_color('FM5', vFM5, vFM5, vFM5, vFM5)
	end
	if (buff_id == 588) then
		vFM6 = 0
		windower.prim.set_color('FM6', vFM6, vFM6, vFM6, vFM6)
	end
	if (buff_id == 410) then
		vSaber = 0
		windower.prim.set_color('dagger', vSaber, vSaber, vSaber, vSaber)
	end
	if (buff_id == 411) then
		fanDanceShow = true
		vFan = 0
		windower.prim.set_color('FanDance', vFan, vFan, vFan, vFan)
		fanDanceToggle = false
		ability_hud ()
		windower.prim.set_color('blueRoseHead', 0, 0, 0, 0)
		windower.prim.set_color('blueRose', 0, 0, 0, 0)
		windower.prim.set_color('fan', 0, 0, 0, 0)
	end
end)

windower.register_event('gain buff', function(buff_id)
	if (buff_id == 381) then
		vFM1 = 255
		windower.prim.set_color('FM1', vFM1, vFM1, vFM1, vFM1)
	end
	if (buff_id == 382) then
		vFM2 = 255
		windower.prim.set_color('FM2', vFM2, vFM2, vFM2, vFM2)
	end
	if (buff_id == 383) then
		vFM3 = 255
		windower.prim.set_color('FM3', vFM3, vFM3, vFM3, vFM3)
	end
	if (buff_id == 384) then
		vFM4 = 255
		windower.prim.set_color('FM4', vFM4, vFM4, vFM4, vFM4)
	end
	if (buff_id == 385) then
		vFM5 = 255
		windower.prim.set_color('FM5', vFM5, vFM5, vFM5, vFM5)
	end
	if (buff_id == 588) then
		vFM6 = 255
		windower.prim.set_color('FM6', vFM6, vFM6, vFM6, vFM6)
	end
	--print(buff_id)
	if (buff_id == 410) then
		vSaber = 255
		windower.prim.set_color('dagger', vSaber, vSaber, vSaber, vSaber)
	end
	if (buff_id == 411) then
		fanDanceShow = true
		vFan = 255
		windower.prim.set_color('FanDance', vFan, vFan, vFan, vFan)
		fanDanceToggle = true
		ability_hud ()
		windower.prim.set_color('flourishes2', 0, 0, 0, 0)
		windower.prim.set_color('flourishes3', 0, 0, 0, 0)
	end
end)

function delete()
	windower.prim.delete('flourishes3')	
	windower.prim.delete('flourishes2')
	windower.prim.delete('FM1')
	windower.prim.delete('FM2')
	windower.prim.delete('FM3')
	windower.prim.delete('FM4')
	windower.prim.delete('FM5')
	windower.prim.delete('FM6')
	windower.prim.delete('FanDance')
	windower.prim.delete('dagger')
	windower.prim.delete('blueRose')
	windower.prim.delete('blueRoseHead')
	windower.prim.delete('fan')
end

windower.register_event('unload',function()
	delete()
end)

windower.register_event('logout',function()
	windower.send_command('lua u DNC-hud')
end)

windower.register_event('job change',function(main_job_id)
	if (main_job_id ~= 19) then
		windower.send_command('lua u DNC-hud')
	end
end)