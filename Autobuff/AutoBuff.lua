_addon.name = 'AutoBUFF'
_addon.author = 'Helmaru'
_addon.version = '2.2.0'
_addon.commands = {'abf','ABF',}

require('tables')
packets = require('packets')
res = require('resources')

local abf_active = true
local abf_buffer = 0
local abf_mode = "dps"
local abf_runes = {}
local abf_engage = true
local abf_autorune = false
local isCasting = false
local sp_one = false
local sp_two = false
local player = windower.ffxi.get_player()
local pet = nil

local abb = T{
	bosses = T{
		aminon = false
	}
}

function getPet() 
	if player and player.index then
		local player_index = windower.ffxi.get_mob_by_index(player.index) or nil
		if player_index and player_index.pet_index then
			local pet_index = player_index.pet_index
			pet = windower.ffxi.get_mob_by_index(pet_index) or nil
		else
			pet = nil
		end
	else
		pet = nil
	end
end

windower.register_event('addon command', function(cmd, ...)
	local args = {...}
	--log(dump({...}))
	if string.lower(cmd) == "tank" then
		abf_mode = "tank"
		log(' MODE TANK')
	elseif string.lower(cmd) == "dps" then
		abf_mode = "dps" 
		log(' MODE DPS')
	elseif string.lower(cmd) == "deb" then
		do_debuff({...})
	elseif string.lower(cmd) == "2hr" then
		sp_one = true
		sp_two = true
		log(' 2HR MODE '..dump(sp_one))
	elseif string.lower(cmd) == "engage" then
		if abf_engage then
			abf_engage = false
		else
			abf_engage = true
		end
		log(' ENGAGE MODE '..tostring(abf_engage))
	elseif string.lower(cmd) == "rune" then
		abf_autorune = true
		abf_runes = {}
		for _,entry in pairs({...}) do
			abf_runes[entry] = abf_runes[entry] and abf_runes[entry]+1 or 1
        end
    	log(' RUNE MODE '..dump(abf_runes))
	elseif string.lower(cmd) == "start" then
		abf_active = true
		--log(' Starting')
	elseif string.lower(cmd) == "stop" then
		abf_active = false
		--log(' Stopping')
	elseif string.lower(cmd) == "boss" then
		--log(dump(abb.bosses))
		if args[1] ~= nil and table_set(abb.bosses, args[1], true) then
			log(dump(abb.bosses))
			log(' BOSS MODE '..args[1])
		else
			log(' BOSS ['..args[1]..'] NOT FOUND')
		end
		
	else
		log(' USAGE: //abf [on|off]')
	end
	
end)

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
	if not should_do_it() then return end
	if not silent_check_amnesia() and not is_impaired() then
		log(cmd)
		windower.send_command(cmd)
		coroutine.sleep(4)
	else
		--log( ' ****** ['..cmd..' CANCELED - Amnesia/Impaired] ******')
	end
end
function do_cast(cmd)
	if not should_do_it() then return end
	if moving then return end
	if hasbuff(6) then
		windower.send_command('input /item "Remedy" <me>')     
        --log( ' ****** ['..cmd..' CANCELED - Using Remedy] ******')
		return
	end
	if is_impaired() then
        --log( ' ****** ['..cmd..' CANCELED - impaired] ******')
		return
	end
	log(cmd)
	windower.send_command(cmd)
	coroutine.sleep(4)
end

function should_do_it()
	player = windower.ffxi.get_player() or nil
	if player ~= nil
	and player.status ~= 'Event'
	and (player.status == 1 or not abf_engage)
	and abf_active 
	and not isCasting
	then
		return true
	end
	return false
end
function is_tank()
	return abf_mode == "tank"
end
function is_dps()
	return abf_mode == "dps"
end

function is_aminon()
	return abb.bosses.aminon
end
function table_contains(tbl, x)
    for _, v in pairs(tbl) do
        if v == x then 
            return true
        end
    end
    return false
end

function table_set(tbl, x, val)
    for _, v in pairs(tbl) do
		--log(dump(_))
        if _ == x then 
			tbl[_] = val
            return true
        end
    end
    return false
end

function do_it()
	--log('do_it()')
	player = windower.ffxi.get_player() or nil
	getPet()
	--if true then return end
	if player ~= nil
	and player.status ~= 'Event'
	and (player.status == 1 or not abf_engage)
	and abf_active
	then
	
		if player.sub_job == 'SCH' or player.main_job == 'SCH' then
			if player.sub_job == 'SCH' then
				if is_aminon() then
					if not hasbuff(37) and windower.ffxi.get_spell_recasts()[54]== 0 and getVitals('mp') > 29  then
						do_cast("input /ma 'Stoneskin' <me>")
					end
					if windower.ffxi.get_ability_recasts()[228]== 0 and not hasbuff(358) then
						do_command("input /ja 'Light Arts' <me>")
					end
					if not hasbuff(401) and hasbuff(358) then
						do_command("input /ja 'Addendum: White' <me>")
					end
					
				end
			end
			
		end
		--BLU
		if player.main_job == 'BLU' then
			if player.main_job == 'BLU' then
				local bSpells = windower.ffxi.get_mjob_data().spells 
				if is_tank() then
					if table_contains(bSpells, 547) and not hasbuff(93) and windower.ffxi.get_spell_recasts()[547]== 0 and getVitals('mp') > 11 then
						do_cast("input /ma 'Cocoon' <me>")
					end
					if table_contains(bSpells, 685) and not hasbuff(116) and windower.ffxi.get_spell_recasts()[685]== 0 and getVitals('mp') > 50 then
					
						do_cast("input /ma 'Barrier Tusk' <me>")
					end
				end
				if table_contains(bSpells, 573) and windower.ffxi.get_spell_recasts()[573]== 0 and getVitals('mp') > 100 then
					do_cast("input /ma 'Feather Tickle' <t>")
				end
				if table_contains(bSpells, 684) and windower.ffxi.get_spell_recasts()[684]== 0 and getVitals('mp') > 100 then
					do_cast("input /ma 'Reaving Wind' <t>")
				end
				if table_contains(bSpells, 710) and not hasbuff(33) and windower.ffxi.get_spell_recasts()[710]== 0 and getVitals('mp') > 100 then
					do_cast("input /ma 'Erratic Flutter' <me>")
				end
				if table_contains(bSpells, 700) and not hasbuff(91) and windower.ffxi.get_spell_recasts()[700]== 0 and getVitals('mp') > 40 then
					do_cast("input /ma 'Nat. Meditation' <me>")
				end
				
			end
		end
		-- WAR 
		if player.sub_job == 'WAR' or player.main_job == 'WAR' then
			-- SUB AND MAIN
			if windower.ffxi.get_ability_recasts()[1] == 0 then
				do_command('input /ja Berserk <me>')
			end
			if windower.ffxi.get_ability_recasts()[2]== 0  then
				do_command('input /ja Warcry <me>')
			end
			if windower.ffxi.get_ability_recasts()[4]== 0  then
				do_command('input /ja Aggressor <me>')
			end
			-- MAIN JOB
			if player.main_job == 'WAR' then
				--ENRAGE
				if sp_one and windower.ffxi.get_ability_recasts()[0] == 0 then
					do_command("input /ja 'Mighty Strikes' <me>")
				else
					sp_one = false
					sp_two = false
				end
				
				if windower.ffxi.get_ability_recasts()[11]== 0 and not hasbuff(68) then --only when no warcry
					do_command("input /ja 'Blood Rage' <me>")
				end
				if windower.ffxi.get_ability_recasts()[9]== 0  then
					do_command("input /ja Restraint <me>")
				end
				if windower.ffxi.get_ability_recasts()[8]== 0  then
					do_command("input /ja Retaliation <me>")
				end
			end
		end
		-- MNK 
		if player.main_job == 'MNK' then
			if windower.ffxi.get_ability_recasts()[21] == 0 and not hasbuff(461) then --not when impetus is up
				do_command('input /ja Footwork <me>')
			end
			if windower.ffxi.get_ability_recasts()[31] == 0 and not hasbuff(406) then --not when footwork is up
				do_command('input /ja Impetus <me>')
			end
			
			if windower.ffxi.get_ability_recasts()[13] == 0 then
				do_command('input /ja Focus <me>')
			end
			if windower.ffxi.get_ability_recasts()[14] == 0 then
				do_command('input /ja Dodge <me>')
			end
			
		end
		--SAM
		if player.sub_job == 'SAM' or player.main_job == 'SAM' then
			if not hasbuff(353) and windower.ffxi.get_ability_recasts()[138]== 0  then
				do_command('input /ja Hasso <me>')
			end
			if windower.ffxi.get_ability_recasts()[134]== 0  then
				do_command('input /ja Meditate <me>')
			end
			if windower.ffxi.get_ability_recasts()[140]== 0 and (hasbuff(272) or player.main_job == 'SAM') then --only with am3
				do_command('input /ja Sekkanoki <me>')
			end
		
			if player.main_job == 'SAM' then
				if windower.ffxi.get_ability_recasts()[141]== 0  then
					do_command('input /ja Sengikori <me>')
				end
			end
		end
		--DNC
		if player.sub_job == 'DNC' or player.main_job == 'DNC' then
			if not is_tank() and not hasbuff(370) and not hasbuff(216) and windower.ffxi.get_ability_recasts()[216]== 0 and getVitals('tp') > 350 then
				do_command("input /ja 'Haste Samba' <me>")
			end
			
			if player.main_job == 'DNC' then
				if is_tank() then
					if windower.ffxi.get_ability_recasts()[224]== 0  then
						do_command("input /ja 'Fan Dance' <me>")
					end
				else 
					if windower.ffxi.get_ability_recasts()[219]== 0  then
						do_command("input /ja 'Saber Dance' <me>")
					end
				end
			end
		end
		--COR
		if player.main_job == 'COR' then
			if is_aminon() then
				if windower.ffxi.get_ability_recasts()[199]== 0  then
					do_command("input /ja 'Ice Shot' <t>")
				end
			end
		end
		--DRK
		if player.sub_job == 'DRK' or player.main_job == 'DRK' then
		
			if is_aminon() then
				if windower.ffxi.get_spell_recasts()[275]== 0  then
					do_cast("input /ma 'Absorb-TP' <t>")
				end
			end
		
			if player.main_job == 'DRK' then
				--ENRAGE
				if sp_two and windower.ffxi.get_ability_recasts()[0] == 0 then
					do_command("input /ja 'Blood Weapon' <me>")
				else
					sp_two = false
				end
				if sp_one and windower.ffxi.get_ability_recasts()[254] == 0 then
					do_command("input /ja 'Soul Enslavement' <me>")
				else
					sp_one = false
				end
				--ENRAGE END
				if windower.ffxi.get_ability_recasts()[44]== 0  then
					do_command("input /ja 'Scarlet Delirium' <me>")
				end
				
				if not hasbuff(288) and not hasbuff(51) and not hasbuff(497) and getVitals('mp') > 36 then
					do_cast("input /ma 'Endark II' <me>")
				end
				
			end
			if is_tank() then
				--Cancel dangerous buffs
				if hasbuff(64) then do_command('cancel last resort') end
			end
			if is_tank() then
				--Cancel dangerous buffs
				if hasbuff(63) then do_command('cancel souleater') end
			end
			if windower.ffxi.get_ability_recasts()[87]== 0 then
				cmd_string = "input /ja 'Last Resort' <me>"
				if is_tank() then
					cmd_string = cmd_string..";wait 4;cancel last resort"
				end
				do_command(cmd_string)
			end
			if is_tank() and windower.ffxi.get_ability_recasts()[85]== 0 then
				cmd_string = "input /ja 'Souleater' <me>"
				if is_tank() then
					cmd_string = cmd_string..";wait 4;cancel last souleater"
				end
			end
			
			
			--if is_tank() and windower.ffxi.get_spell_recasts()[252]== 0  then
			--	do_cast("input /ma 'Stun' <t>")
			--end
			
			
			--if not hasbuff(121) and getVitals('mp') > 33 then
			--	--do_cast("input /ma 'Absorb-VIT' <t>")
			--end
			--if not hasbuff(119) and getVitals('mp') > 33 then
			--	--do_cast("input /ma 'Absorb-STR' <t>")
			--end
			--if windower.ffxi.get_ability_recasts()[90]== 0  then
			--	do_command("input /ja 'Diabolic Eye' <me>")
			--	return
			--end
		end
		--NIN
		if player.sub_job == 'NIN' or player.main_job == 'NIN' then
		
			if player.main_job == 'NIN' then
				if windower.ffxi.get_ability_recasts()[146]== 0 and is_tank() then
					do_command("input /ja 'Yonin' <me>")
				end
				if windower.ffxi.get_ability_recasts()[147]== 0 and is_dps()  then
					do_command("input /ja 'Innin' <me>")
				end
			end
		end
		--RDM
		if player.main_job == 'RDM' then
			if player.main_job == 'RDM' then
				if not hasbuff(432) and windower.ffxi.get_spell_recasts()[895]== 0 and getVitals('mp') > 36  then
					do_cast("input /ma 'Temper II' <me>")
				end
			end
		end
		--RUN
		if player.sub_job == 'RUN' or player.main_job == 'RUN' then
	
			if not hasbuff(532) and windower.ffxi.get_ability_recasts()[24]== 0  then
				do_command("input /ja 'Swordplay' <me>")
			end
						
			if is_tank() then
				if is_aminon() and not hasbuff(37) and windower.ffxi.get_spell_recasts()[54]== 0 and getVitals('mp') > 29  then
					do_cast("input /ma 'Stoneskin' <me>")
				end
				if not hasbuff(531) and windower.ffxi.get_ability_recasts()[113]== 0  then
					do_command("input /ja 'Valiance' <me>")
				end
				if not hasbuff(535) and windower.ffxi.get_ability_recasts()[23]== 0  then
					do_command("input /ja 'Vallation' <me>")
				end
			end
			
			if player.main_job == 'RUN' then
				if not hasbuff(432) and windower.ffxi.get_spell_recasts()[493]== 0 and getVitals('mp') > 36  then
					do_cast("input /ma 'Temper' <me>")
				end
				if is_tank() and not hasbuff(289) and windower.ffxi.get_spell_recasts()[476]== 0  then
					do_cast("input /ma 'Crusade' <me>")
				end
				if is_tank() and windower.ffxi.get_spell_recasts()[112]== 0 and getVitals('mp') > 23 then
					do_cast("input /ma 'Flash' <t>")
				end
				if is_tank() and  windower.ffxi.get_spell_recasts()[840]== 0  then
					do_cast("input /ma 'Foil' <me>")
				end
				
			end
			if abf_autorune then
				for key,entry in pairs(abf_runes) do
					local buff_id = 0
					local rune = ''
					if key == 'fire' then buff_id = 523; rune = 'Ignis'
					elseif key == 'ice' then buff_id = 524; rune = 'Gelus'
					elseif key == 'wind' then buff_id = 525; rune = 'Flabra'
					elseif key == 'earth' then buff_id = 526; rune = 'Tellus'
					elseif key == 'thunder' then buff_id = 527; rune = 'Sulport'
					elseif key == 'water' then buff_id = 528; rune = 'Unda'
					elseif key == 'light' then buff_id = 529; rune = 'Lux'
					elseif key == 'dark' then buff_id = 530; rune = 'Tenebrae'
					end
					if buffCount(buff_id) < entry and windower.ffxi.get_ability_recasts()[92] == 0 then
						do_command("input /ja '"..rune.."' <me>")
					end
				end
			end
		end
		--PLD
		if player.sub_job == 'PLD' or player.main_job == 'PLD' then
			if player.main_job == 'PLD' then
				if is_tank() and  not hasbuff(623) and windower.ffxi.get_ability_recasts()[75]== 0  then
					do_command("input /ja 'Sentinel' <me>")
					coroutine.sleep(2)
				end
				if is_tank() and not hasbuff(62) and windower.ffxi.get_ability_recasts()[77]== 0  then
					do_command("input /ja 'Rampart' <me>")
				end
				
				if is_tank() and getVitals('hp') < 1500 and windower.ffxi.get_spell_recasts()[8]==0 then
					do_cast("input /ma 'Cure IV' <me>")
				end
				if is_tank() and windower.ffxi.get_ability_recasts()[73]== 0  then
					do_command("input /ja 'Shield Bash' <t>")
				end
				if not hasbuff(289) and windower.ffxi.get_spell_recasts()[476]== 0 then
					do_cast("input /ma 'Crusade' <me>")
				end
				if not hasbuff(403) and windower.ffxi.get_spell_recasts()[97]== 0 then
					do_cast("input /ma 'Reprisal' <me>")
				end
				if windower.ffxi.get_spell_recasts()[112]==0 and getVitals('mp') > 23 then
					do_cast("input /ma 'Flash' <t>")
				end
				
				if not hasbuff(621) and windower.ffxi.get_ability_recasts()[150]== 0  then
					do_command("input /ja 'Majesty' <me>")
				end
				if windower.ffxi.get_ability_recasts()[74]== 0  then
					do_command("input /ja 'Holy Circle' <me>")
				end
			end
		end
		--THF
		if player.sub_job == 'THF' or player.main_job == 'THF' then

			if player.main_job == 'THF' then
				if windower.ffxi.get_ability_recasts()[40]== 0  then
					do_command("input /ja 'Conspirator' <me>")
				end
				if windower.ffxi.get_ability_recasts()[240]== 0  then
					do_command("input /ja 'Bully' <t>")
				end
			end
		end
		
		
		
		if player.sub_job == 'DRG' or player.main_job == 'DRG' then
			if player.main_job == 'DRG' then
				--PET
				if windower.ffxi.get_ability_recasts()[163]== 0  and not hasPet() then
					do_command("input /ja 'call wyvern' <me>")
				end
				if windower.ffxi.get_ability_recasts()[163]== 0  and hasPet() and getVitals('hpp') < 50 then
					do_command("input /ja 'restoring breath' <me>")
				end
				if windower.ffxi.get_ability_recasts()[162]== 0  and hasPet() then
					do_command("input /ja 'Spirit Link' <me>")
				end
				if windower.ffxi.get_ability_recasts()[70]== 0  and hasPet() then
					do_command("input /pet 'steady wing' <me>")
				end
				if windower.ffxi.get_ability_recasts()[167]== 0 and getVitals('tp') < 1000  then
					do_command("input /ja 'Soul Jump' <t>")
				end
				if windower.ffxi.get_ability_recasts()[166]== 0 and getVitals('tp') < 1000 then
					do_command("input /ja 'Spirit Jump' <t>")
				end
				if windower.ffxi.get_ability_recasts()[158]== 0 and getVitals('tp') < 1000 then
					do_command("input /ja 'Jump' <t>")
				end
				if windower.ffxi.get_ability_recasts()[159]== 0 and getVitals('tp') < 1000 then
					do_command("input /ja 'High Jump' <t>")
				end
				
			end
			
		end
	end
	coroutine.schedule(do_it, 1)
end

function getVitals(vital)
	player = windower.ffxi.get_player()
	return player.vitals[vital]
end

function hasPet()
	if pet == nil or pet.status == nil then
		--print('NO PET')
		return false
	else
		--print('HAS PET')
		return true
	end
end

-- Get a count of the number of runes of a given type
function rune_count(rune)
    local count = 0
    local current_time = os.time()
    for _,entry in pairs(rune_timers) do
        if entry.rune == rune and entry.expires > current_time then
            count = count + 1
        end
    end
    return count
end

function hasbuff(buff)
	return buffCount(buff) > 0
end

function buffCount(buff)
	local count = 0
	for nameCount = 1, #player.buffs do
		--print(player.buffs[nameCount])
		if player.buffs[nameCount] == buff then
			count = count +1
		end
	end
	return count
end

windower.register_event('incoming chunk', function(id, data)
    if id == 0x028 then
        local action_message = packets.parse('incoming', data)
		--log(dump(action_message))
		if action_message["Category"] == 4 then
			isCasting = false
		elseif action_message["Category"] == 8 then
			isCasting = true
			if action_message["Target 1 Action 1 Message"] == 0 then
				isCasting = false
				isBusy = Action_Delay
			end
		end
	end
end)


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

local abf_brd_buffer = 0


function do_debuff(args)
	--log(dump(args))
	if args[1] == 'all' then
		do_cast('input /assist Helmaru;wait 1;input /ma "Frazzle III" <t>;wait 5;input /ma "Distract III" <t>;wait 5;input /ma "Dia III" <t>;wait 5;input /ma "Inundation" <t>;wait 5;input /ma "Paralyze II" <t>;wait 5;input /ma "Slow II" <t>;wait 5;input /ma "Blind II" <t>')
    end
	if args[1] == 'haste' and args[2] ~= nil then
		do_cast('input /ma "Haste II" '..args[2])
    end
	if args[1] == 'phalanx' and args[2] ~= nil then
		do_cast('input /ma "Phalanx II" '..args[2])
    end
end
function log(o)
   windower.add_to_chat(8,'[AutoBuff] '..o)
end


mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end
moving = false
function check_mov()
	if player == nil then
		coroutine.schedule(check_mov, 0.5)
		return
	end

	local pl = windower.ffxi.get_mob_by_index(player.index)
	if pl and pl.x and mov.x then
		local movement = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 ) > 0.1
		if movement and not moving then
			moving = true
			--log('moving')
		elseif not movement and moving then
			moving = false
			--log('not moving')
		end
	end
	if pl and pl.x then
		mov.x = pl.x
		mov.y = pl.y
		mov.z = pl.z
	end
	coroutine.schedule(check_mov, 0.5)
end

check_mov()
do_it()
log("buffs: ")
windower.add_to_chat(12,dump(player.buffs))
log("recasts: ")
log(dump(windower.ffxi.get_ability_recasts()))
log("hasPet: ")
log(dump(pet))