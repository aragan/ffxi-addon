function jse_command(cmd, args)
	
end
function jse_can_ws()
	return true
end

function jse_pre_ws_checks()
	return true
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
			if T{23,24,25,26,27}:contains(spell) then --DIa handling
				windower.send_command('abf stop');
				coroutine.sleep(1)
				log(res.spells[spell].name..' on target > Light Shot')
				do_command("input /ja 'light shot' <t>")
				windower.send_command('abf start');
			end
		end
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
