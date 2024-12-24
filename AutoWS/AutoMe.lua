_addon.name = 'AutoMe'
_addon.author = 'Helmaru'
_addon.version = '2.2.0'
_addon.commands = {'ame','AME',}

res = require('resources')
require 'aws_sets'
require('tables')

local player = windower.ffxi.get_player()


local ws_mode = ''
local ws_mode_am3 = ''
local ws_mode_tp = 0
local aws_buffer = 0
local aws_aftermath = false
local aws_autora = ""
local aws_abyssea = true
local aws_abyssea_count = 1
local aws_abyssea_nows = true
local aws_chain = nil
local aws_last_target = 0
local aws_am3_counter = os.time()-300000
local aws_job = {}
local aws_break = nil

local aws_ranged = T{
'leaden salute'
, 'last stand'
} 

windower.register_event('addon command', function(cmd, ...)
	local args = string.lower(table.concat({...},' '))
	
	aws_chain = nil	
	--log(args)
	if string.lower(cmd) == "off" then
		ws_mode = ''
		ws_mode_tp = 0
		log(' MODE OFF')
		return
	elseif string.lower(cmd) == "break" then
		aws_break = args
		log(' BREAK MODE TO ['..tostring(args)..']')
	elseif string.lower(cmd) == "autora" then
		if args == "on" then
			aws_autora = ";wait 4;autora start"
		end
		if args == "off" then
			aws_autora = ""
		end
		log(' AUTORA MODE TO ['..tostring(aws_autora)..']')
	elseif string.lower(cmd) == "ws" then
		ws_mode = string.sub(args,6,string.len(args))
		ws_mode_tp = tonumber(string.sub(args,0, 4))
		log(' MODE SET TO ['..ws_mode..'] AT TP ['..ws_mode_tp..']')
		aws_aftermath = false
		return
	elseif string.lower(cmd) == "am3" then
		aws_aftermath = true
		ws_mode_am3 = args
		
		log(' AM3 @ 3000 TP SET TO ['..tostring(ws_mode_am3)..']')
	elseif string.lower(cmd) == "aby" then
		if args == "on" then
			aws_abyssea = true
		end
		if args == "off" then
			aws_abyssea = false
		end
		log(' ABYSSEA MODE TO ['..tostring(aws_abyssea)..']')
	elseif string.lower(cmd) == "failsafe" then
		aws_abyssea_nows = false 
		log(' ABYSSEA FAILSAFE')
	elseif string.lower(cmd) == "abycount" then
		aws_aftermath = false
		aws_abyssea = true
		aws_abyssea_count = (args % table.getn(aws_aby_ws))+1 -- FIX THIS
		set_abyssea_weap(aws_abyssea_count)
		log(' ABYSSEA COUNT TO ['..tostring(aws_abyssea_count)..']')
	elseif string.lower(cmd) == "chain" then
		if args and aws_chains[args] then
			log(' CHAIN SET TO ['..tostring(args)..']')
			aws_chain = aws_chains[args]
			log(dump(aws_chain))
			set_chain_ws(1)
		else
			log(' CHAIN NOT FOUND ['..tostring(args)..']')
		end
	else
		log(' AWS USAGE: //aws ws 1000 Savage Blade')
		log(' AWS USAGE: //aws am3 Ukko\' Fury')
	end
	
end)


function hasbuff(buff)
	local player = windower.ffxi.get_player()
	for nameCount = 1, #player.buffs do
		--print(player.buffs[nameCount])
		if player.buffs[nameCount] == buff then
			return true
		end
	end
	--print("END")
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

function hasbuff(buff)
	return buffCount(buff) > 0
end

function buffCount(buff)
	local player = windower.ffxi.get_player()
	local count = 0
	for nameCount = 1, #player.buffs do
		--print(player.buffs[nameCount])
		if player.buffs[nameCount] == buff then
			count = count +1
		end
	end
	return count
end


function do_abyssea_ws()
	if aws_abyssea_nows then
		log(' MOB DOING STUFF')
	else
		windower.send_command("input /ws '"..aws_aby_ws[aws_abyssea_count][2].."' <t>;");
	end
end

function set_abyssea_weap(count)
	log(' EQUIPPING : ['..aws_aby_ws[tonumber(count)][1]..'] WS SET TO ['..aws_aby_ws[tonumber(count)][2]..']')
	windower.send_command('input /equip main "'..aws_aby_ws[tonumber(count)][1]..'"');
	ws_mode = aws_aby_ws[tonumber(count)][2]
	ws_mode_tp = 1000
end

function set_chain_ws(count)
	ws_mode = aws_chain[tonumber(count)]
	aws_chain_count = count
	ws_mode_tp = 1000
	log(' WS SET TO ['..tostring(ws_mode)..']')
end

function aws_adapt_target(target)
	if aws_last_target ~= target.id then
		log(' TARGET CHANGED')
		aws_last_target = target.id
		if aws_chain then
			set_chain_ws(1)
		end
		turn()
	end
end

function do_it()
	--log('do_it()')
	local player = windower.ffxi.get_player() 
	if player == nil then 
		coroutine.schedule(do_it, 1)
		return 
	end
	local target = windower.ffxi.get_mob_by_target('t')
	if target == nil then 
		coroutine.schedule(do_it, 1)
		return 
	end
		
	if ws_mode ~= ''
	and ws_mode_tp ~= 0 
	and player.status ~= 'Event'
	then
		local player = windower.ffxi.get_player()

		if player.status == 1 and player.vitals.hp > 0 then
			local target = windower.ffxi.get_mob_by_target('t')
			aws_adapt_target(target)	
			jse_pre_ws_checks()
			if player.vitals.tp >= ws_mode_tp and 
				(not needsAM() or player.vitals.tp >= 3000) --am3
			then --2k 500 from Weap, 250 from Earring
				
				local me = windower.ffxi.get_mob_by_target('me')
				local maxDistance = me.model_size + target.model_size + 3.7
				 
				if (math.sqrt(target.distance) < maxDistance or aws_ranged:contains(ws_mode)) and not silent_check_amnesia() and not is_impaired() then
					--log(' USING : '..ws_mode)
					if aws_abyssea then
						if aws_abyssea_nows then
							log(' MOB DOING STUFF')
						else
							windower.send_command("input /ws '"..aws_aby_ws[aws_abyssea_count][2].."' <t>;");
						end
					elseif aws_chain then
						windower.send_command("input /ws '"..aws_chain[aws_chain_count].."' <t>;");
					else
						if jse_can_ws() then	
							if needsAM() then
								log(ws_mode_am3)
								windower.send_command('input /ws '..ws_mode_am3..''..aws_autora);
								aws_am3_counter = os.time()
							else
								log(ws_mode)
								--	if target.hpp < 10 then
								windower.send_command('input /ws '..ws_mode..''..aws_autora);
								--	end
							end
						end
					end
				else
					--log( ' ****** ['..ws_mode..' CANCELED - Amnesia/Impaired or Too Far] ******')
				end
			end
		end
	end
	coroutine.schedule(do_it, 1)
end

function needsAM()
	local diff = os.difftime(os.time(), aws_am3_counter) 
	--log(' DIFF : '..diff)
	return aws_aftermath and (not hasbuff(272) or diff > 170) 
end


windower.register_event('action',function (act)
	if not aws_abyssea and not aws_break == nil then return end

	if act == nil then return end
	local actor = windower.ffxi.get_mob_by_id(act.actor_id)	
	if actor == nil then return end
	local self = windower.ffxi.get_player()
	local targets = act.targets
	local primarytarget = windower.ffxi.get_mob_by_id(targets[1].id)
	local playertarget = nil
	
	if self.target_index then
		playertarget = windower.ffxi.get_mob_by_index(self.target_index)
	else
		return
	end
	
	target_action_id = act.targets[1].actions[1]["param"];
	target_action_time = os.clock()
	target_action_param = act["param"]
	actor_name = actor.name
	target_action_type = act.category
	
	if self.id ~= act.actor_id then 
		
		if playertarget.id ~= act.actor_id then return end -- not interesiting
		if act.category == 1 and not aws_abyssea_nows then return end -- dont wanna see autoattacks
		if act.category == 1 and aws_abyssea_nows then -- After next autoattack round we can trigger again
			--log(' MOB DONE!')
			aws_abyssea_nows = false 
		end
		if act.category == 7 or act.category == 8 then 
			--log(' MOB REDIING!')
			aws_abyssea_nows = true 
		end
		if act.category == 11 then -- too quick after WS, does not trigger yet ENABLE FOR BABA YAGA
			--log(' MOB DONE! SLEEP 1')
			--coroutine.sleep(1)
			--aws_abyssea_nows = false 
			coroutine.schedule(function()
				log(' MOB DONE!')
				aws_abyssea_nows = false 
			end, 3)
		end
		--log('  NAME: ['..actor_name..'] TYPE: ['..target_action_type..'] PARAM: ['..target_action_param..'] ID: ['..target_action_id..'] ')
	else 
		-- self actions
		if act.category ~= 7 then return end -- not WS 
		--log('  NAME: ['..actor_name..'] TYPE: ['..target_action_type..'] PARAM: ['..target_action_param..'] ID: ['..target_action_id..']  WS: ['..getActionName(target_action_type, target_action_id)..'] ')

		if getActionName(target_action_type, target_action_id) == aws_aby_ws[tonumber(aws_abyssea_count)][2] then
			aws_abyssea_count = (aws_abyssea_count % table.getn(aws_aby_ws))+1
			--log(' NEW aws_abyssea_count : ['..aws_abyssea_count..']')
			set_abyssea_weap(aws_abyssea_count)
		end
		if aws_chain and getActionName(target_action_type, target_action_id) == aws_chain[tonumber(aws_chain_count)] then
			aws_chain_count = (aws_chain_count % table.getn(aws_chain))+1
			log(' NEW WS CHAIN COUNT : ['..aws_chain_count..']')
			set_chain_ws(aws_chain_count)
		end
		if aws_break and getActionName(target_action_type, target_action_id) == 'Armor Break' then
			log(' BREAK WS DONE ')
			windower.send_command('gs c wp '..aws_break);
			aws_break = nil
		end
	end
end)

function getActionName(actiontype, actionid)
	--log("getActionName "..actiontype.." "..actionid.." "..target_action_param)
	if actiontype == 7 and res.weapon_skills[actionid] then
		return res.weapon_skills[actionid].en
	else
		return nil
	end
end


function turn()
	local target = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().target_index or 0)
	local self_vector = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().index or 0)
	local angle = (math.atan2((target.y - self_vector.y), (target.x - self_vector.x))*180/math.pi)*-1
	windower.ffxi.turn((angle):radian())
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
function log(o)
   windower.add_to_chat(8,'[AutoWS] '..o)
end

local aws_job, err = loadfile(windower.addon_path..player.main_job..'.lua')
if aws_job == nil then
	log('loading DEFAULT')
	log(err)
	require('DEFAULT')
else
	log('loading '..player.main_job)
	require(player.main_job)
end

do_it()

