local drg_try_angon = false

function jse_can_ws()
	return not drg_try_angon
end
function jse_command(cmd, args)
	
end

function jse_pre_ws_checks()
	return not drg_try_angon
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
	 if act.category == 4 then
        for i, v in pairs(act.targets) do
            local spell = act.param
				--log(dump(act))
			if T{23,24,25,26,27}:contains(spell) then --DIa handling
				if windower.ffxi.get_ability_recasts()[165] == 0 and can_do_it() and not drg_try_angon then
					drg_try_angon = true
					windower.send_command('abf stop');
					do_angon()
				else
					log(res.spells[spell].name..' Angon on cooldown :(')
				end
			end
		end
	end
end

function do_angon()
	do_command("input /p Trying Angon on [<t>]")
	log('Trying Angon!')
	do_command("input /ja 'Angon' <t>")

	if drg_try_angon and windower.ffxi.get_ability_recasts()[165] == 0 and can_do_it() then
		coroutine.schedule(do_angon, 1)
	else
		drg_try_angon = false
		do_command("input /p Angon is applied to [<t>]")
		windower.send_command('abf start');
	end
end

function can_do_it()
	local player = windower.ffxi.get_player() or nil
	if player ~= nil
	and player.status ~= 'Event'
	and player.status == 1
	then
		return true
	end
	return false
end

windower.register_event('action',function (act)
	local self = windower.ffxi.get_player()
	if self.id == act.actor_id and act.category == 3 then
		local target_action_id = act.targets[1].actions[1]["param"];
		--log(act.category)
		if target_action_id == 170 then
			drg_try_angon = false
		end
	end
end)
function getActionName(actionid)
	--log("getActionName "..actiontype.." "..actionid.." "..target_action_param)
	if res.ability_recasts[actionid] then
		return res.ability_recasts[actionid].en
	else
		return nil
	end
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