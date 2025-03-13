_addon.name = 'SCH-hud'
_addon.author = 'NeoNRAGE'
_addon.version = '1.0.1'

texts = require('texts')
timer3 = texts.new("")
stratcount = texts.new("")
local time_start = 0

local iPosition_x = 750
local iPosition_y = 300

texts.visible(timer3, false)
texts.pos(timer3, iPosition_x + 93, iPosition_y + 38)
texts.bg_alpha(timer3, 0)
texts.size(timer3, 26)
texts.font(timer3, 'Arial')
texts.color(timer3, 255, 255, 255)
texts.bold(timer3, true)
texts.stroke_alpha(timer3, 255)
texts.stroke_width(timer3, 1.5)
texts.stroke_color(timer3, 0, 0, 0)

texts.visible(stratcount, true)
texts.pos(stratcount, iPosition_x + 43, iPosition_y + 30)
texts.bg_alpha(stratcount, 0)
texts.size(stratcount, 35)
texts.font(stratcount, 'Arial')
texts.color(stratcount, 0, 0, 0)
texts.bold(stratcount, true)
texts.stroke_alpha(stratcount, 255)
texts.stroke_width(stratcount, 1.5)
texts.stroke_color(stratcount, 255, 255, 255)
texts.alpha(stratcount, 50)

local vGD = 0
local vGDA = 0
local vGL = 0
local vGLA = 0

local secs = 0
local recasttemp = 0

windower.register_event('load', function() 
	--Dark Arts
	windower.prim.create('grimoire-d')	
	windower.prim.set_color('grimoire-d', vGD, vGD, vGD, vGD)	
	windower.prim.set_fit_to_texture('grimoire-d', false)
	windower.prim.set_texture('grimoire-d', windower.addon_path .. 'assets/grimoire-d.png')
	windower.prim.set_repeat('grimoire-d',1,1)
    windower.prim.set_visibility('grimoire-d',true)
	windower.prim.set_position('grimoire-d', iPosition_x, iPosition_y)
	windower.prim.set_size('grimoire-d', 170, 120)	

	--Addendum Black
	windower.prim.create('grimoire-da')	
	windower.prim.set_color('grimoire-da', vGDA, vGDA, vGDA, vGDA)	
	windower.prim.set_fit_to_texture('grimoire-da', false)
	windower.prim.set_texture('grimoire-da', windower.addon_path .. 'assets/grimoire-da.png')
	windower.prim.set_repeat('grimoire-da',1,1)
    windower.prim.set_visibility('grimoire-da',true)
	windower.prim.set_position('grimoire-da', iPosition_x, iPosition_y)
	windower.prim.set_size('grimoire-da', 170, 120)	
	
	--Light Arts
	windower.prim.create('grimoire-l')	
	windower.prim.set_color('grimoire-l', vGL, vGL, vGL, vGL)	
	windower.prim.set_fit_to_texture('grimoire-l', false)
	windower.prim.set_texture('grimoire-l', windower.addon_path .. 'assets/grimoire-l.png')
	windower.prim.set_repeat('grimoire-l',1,1)
    windower.prim.set_visibility('grimoire-l',true)
	windower.prim.set_position('grimoire-l', iPosition_x, iPosition_y)
	windower.prim.set_size('grimoire-l', 170, 120)	

	--Addendum White
	windower.prim.create('grimoire-la')	
	windower.prim.set_color('grimoire-la', vGLA, vGLA, vGLA, vGLA)	
	windower.prim.set_fit_to_texture('grimoire-la', false)
	windower.prim.set_texture('grimoire-la', windower.addon_path .. 'assets/grimoire-la.png')
	windower.prim.set_repeat('grimoire-la',1,1)
    windower.prim.set_visibility('grimoire-la',true)
	windower.prim.set_position('grimoire-la', iPosition_x, iPosition_y)
	windower.prim.set_size('grimoire-la', 170, 120)	
	
	texts.alpha(stratcount, 50)
end)

windower.register_event('prerender', function()

    if os.time() > time_start then
        time_start = os.time()		
        ability_hud() 
    end
	
end)

function ability_hud ()
			--Get number of SCH Job Points
			sch_jp = windower.ffxi.get_player().job_points.sch.jp_spent
			--Get recast on Stratagems
			local recast = math.floor(windower.ffxi.get_ability_recasts()[231])

			if BuffActive(359) then --Dark Arts
				vGD = 255
				vGDA = 0
				vGL = 0
				vGLA = 0
				texts.alpha(stratcount, 255)
				texts.stroke_alpha(stratcount, 255)
			elseif BuffActive(358) then --Light Arts
				vGD = 0
				vGDA = 0
				vGL = 255
				vGLA = 0
				texts.alpha(stratcount, 255)
				texts.stroke_alpha(stratcount, 255)
			elseif BuffActive(401) then --Addendum White
				vGD = 0
				vGDA = 0
				vGL = 0
				vGLA = 255
				texts.alpha(stratcount, 255)
				texts.stroke_alpha(stratcount, 255)
			elseif BuffActive(402) then --Addendum Black
				vGD = 0
				vGDA = 255
				vGL = 0
				vGLA = 0
				texts.alpha(stratcount, 255)
				texts.stroke_alpha(stratcount, 255)				
			else --No Arts Active
				vGD = 0
				vGDA = 0
				vGL = 100
				vGLA = 0
				texts.alpha(stratcount, 50)
				texts.stroke_alpha(stratcount, 100)
			end


			if sch_jp > 549 then
				if recast == 0 then
					texts.text(stratcount, "5")
				elseif recast < 33 then
					texts.text(stratcount, "4")
				elseif recast < 66 then
					texts.text(stratcount, "3")
				elseif recast < 99 then
					texts.text(stratcount, "2")
				elseif recast < 132 then
					texts.text(stratcount, "1")	
				else
					texts.text(stratcount, "0")
				end	
				recasttemp = recast % 33
			else
				if recast == 0 then
					texts.text(stratcount, "5")
				elseif recast < 48 then
					texts.text(stratcount, "4")
				elseif recast < 96 then
					texts.text(stratcount, "3")
				elseif recast < 144 then
					texts.text(stratcount, "2")
				elseif recast < 192 then
					texts.text(stratcount, "1")					
				else
					texts.text(stratcount, "0")
				end
				recasttemp = recast % 48
				
			end

		
		windower.prim.set_color('grimoire-d', vGD, vGD, vGD, vGD)	
		windower.prim.set_color('grimoire-da', vGDA, vGDA, vGDA, vGDA)	
		windower.prim.set_color('grimoire-l', vGL, vGL, vGL, vGL)
		windower.prim.set_color('grimoire-la', vGLA, vGLA, vGLA, vGLA)

		--secs = recasttemp % 60
		secs = math.floor(recasttemp % 60 + 0.5)
	
		if (recast ~= 0) then
			texts.visible(timer3, true)
			if (secs > 9) then
				texts.text(timer3, "" .. tostring(secs))
			else
				texts.text(timer3, "0" .. tostring(secs))
			end
		else
			texts.visible(timer3, false)
		end

end

function BuffActive(buffnum)
	for k,v in pairs(windower.ffxi.get_player().buffs) do
		if v == buffnum then
			return true
		end
	end
	return false
end

function delete()
	windower.prim.delete('grimoire-d')
	windower.prim.delete('grimoire-da')
	windower.prim.delete('grimoire-l')
	windower.prim.delete('grimoire-la')	
end

windower.register_event('unload',function()
	delete()
end)

windower.register_event('logout',function()
	windower.send_command('lua u sch-hud')
end)

windower.register_event('job change',function(main_job_id)
	if (main_job_id ~= 20) then
		print(main_job_id)
		windower.send_command('lua u sch-hud')
	end
end)