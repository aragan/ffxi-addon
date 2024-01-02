local dnc_vars = T{
	enabled = true
	,step_duration = {}
	,combo_points = 0
	,climactic_chain = false
}

function jse_command(cmd, args)
	if string.lower(cmd) == "dnc" then
		dnc_vars.enabled = not dnc_vars.enabled
		log('DNC CP MODE: '..tostring(dnc_vars.enabled))
		return true
	end
	return false
end

function jse_can_ws()
	if not dnc_vars.enabled then return true end
	log('can_ws with '.. comboPoints())
	
	local flurish3 = windower.ffxi.get_ability_recasts()[226]
	if flurish3 == 0 then
		log('Climactic ready!')
		if comboPoints() < 6 then
			if windower.ffxi.get_ability_recasts()[236] == 0 then
				do_step()
			end
		end
		if comboPoints() >= 6 then
			do_command("input /ja 'Climactic Flourish' <me>");
			return true
		else
			log('nothing ready > retry!')
			return false
		end	
	end
	
	if dnc_hasbuff(443) --climactic
		or dnc_hasbuff(375) --building
		then
		log('climatic or bulding buffed!')
		return true
	elseif comboPoints() < 3 then
		log('comboPoints() < 3')
		if dnc_hasbuff(442) --presto
			or windower.ffxi.get_ability_recasts()[236] == 0 --presto ready
			then
			do_step()
			return false
		else
			return true
		end
	elseif windower.ffxi.get_ability_recasts()[222] == 0 then --flourish2
		do_command("input /ja 'Building Flourish' <me>");
		return false
	end

	return true
end

function jse_pre_ws_checks()
	if not dnc_vars.enabled then return true end
	local player = windower.ffxi.get_player()
	local flourish2 = windower.ffxi.get_ability_recasts()[222]
	if dnc_hasbuff(443) and comboPoints() > 0 and player.vitals.tp < 1000 and flourish2 == 0 then --climactic 
		if windower.ffxi.get_ability_recasts()[223] == 0 then
			do_command("input /ja 'No Foot Rise' <me>");
		end
		do_command("input /ja 'Reverse Flourish' <me>");
	end
end

function comboPoints()
	if dnc_hasbuff(507) then
		return 99
	else
		return dnc_vars.combo_points
	end
end

function do_step()
	log('do_step')
	--log(dump(dnc_vars.step_duration))
	local player = windower.ffxi.get_player()
	local target = windower.ffxi.get_mob_by_index(player.target_index or 0)
	--log(target.id)
	if not dnc_hasbuff(442) then --Presto
		if windower.ffxi.get_ability_recasts()[236] == 0 then
			do_command("input /ja 'Presto' <me>");
		end
	end
	if not dnc_vars.step_duration[target.id] or not dnc_vars.step_duration[target.id]['Box Step'] or dnc_vars.step_duration[target.id]['Box Step'].tier < 10 then
		do_command("input /ja 'Box Step' <t>");
		return
	elseif not dnc_vars.step_duration[target.id]['Quick Step'] or dnc_vars.step_duration[target.id]['Quick Step'].tier < 10 then
		do_command("input /ja 'Quick Step' <t>");
		return
	elseif not dnc_vars.step_duration[target.id]['Feather Step'] or dnc_vars.step_duration[target.id]['Feather Step'].tier < 10 then
		do_command("input /ja 'Feather Step' <t>");
		return
	end
	return
end


function log(o)
   windower.add_to_chat(8,'[AutoWS] '..o)
end


windower.register_event('incoming chunk', function(id, data)
    if id == 0x028 then
        inc_action(windower.packets.parse_action(data))
    end
end)



function inc_action(act)
	if act.category == 14 then
		for i, v in pairs(act.targets) do
			if T{519,520,521,591}:contains(act.targets[i].actions[1].message) then
				local effect = act.param
				local target = act.targets[i].id
				local tier = act.targets[i].actions[1].param
				
				--log(effect)
				--log(target)
				--log(tier)
			   
				if not dnc_vars.step_duration[target] then 
				dnc_vars.step_duration[target] = {} 
				end
				
				local name = res.job_abilities[effect].en
				if tier == 1 or not dnc_vars.step_duration[target][name] then
					dnc_vars.step_duration[target][name] = {tier = tier, timer = os.clock() + 60}
				elseif dnc_vars.step_duration[target][name].timer - os.clock() >= 90 then
					dnc_vars.step_duration[target][name] = {tier = tier, timer = os.clock() + 120}
				else
					dnc_vars.step_duration[target][name] = {tier = tier, timer = dnc_vars.step_duration[target][name].timer + 30}
				end

				--log(dump(dnc_vars.step_duration))

			end
		end
	end
end


windower.register_event('lose buff', function(buff_id)
	if (buff_id == 381) then
		dnc_vars.combo_points = 0
	end
	if (buff_id == 382) then
		dnc_vars.combo_points = 0
	end
	if (buff_id == 383) then
		dnc_vars.combo_points = 0
	end
	if (buff_id == 384) then
		dnc_vars.combo_points = 0
	end
	if (buff_id == 385) then
		dnc_vars.combo_points = 0
	end
	if (buff_id == 588) then
		dnc_vars.combo_points = 0
	end
end)

windower.register_event('gain buff', function(buff_id)
	if (buff_id == 381) then
		log('Gain 1 Step')
		dnc_vars.combo_points = 1
	end
	if (buff_id == 382) then
		log('Gain 2 Step')
		dnc_vars.combo_points = 2
	end
	if (buff_id == 383) then
		log('Gain 3 Step')
		dnc_vars.combo_points = 3
	end
	if (buff_id == 384) then
		log('Gain 4 Step')
		dnc_vars.combo_points = 4
	end
	if (buff_id == 385) then
		log('Gain 5 Step')
		dnc_vars.combo_points = 5
	end
	if (buff_id == 588) then
		log('Gain 6 Step')
		dnc_vars.combo_points = 6
	end
end)

function dnc_hasbuff(buff)
	local player = windower.ffxi.get_player()
	--log(dump(player.buffs))
	for nameCount = 1, #player.buffs do
		if player.buffs[nameCount] == buff then
			return true
		end
	end
	--log(buff..' NOT FOUND')
	return false
end

function silent_check_amnesia()
	if hasbuff(16) or hasbuff(261) then --amnesia / ipairement
		return true
	else
		return false	
	end
end
function is_impaired()
	if hasbuff(28) or hasbuff(7) or hasbuff(19) or hasbuff(193) or hasbuff(10) then
		return true
	else
		return false
	end	
end

function do_command(cmd)
	if isCasting then return end
	if not silent_check_amnesia() and not is_impaired() then
		log(cmd)
		windower.send_command(cmd)
		coroutine.sleep(2)
	else
		--log( ' ****** ['..cmd..' CANCELED - Amnesia/Impaired] ******')
	end
end

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
