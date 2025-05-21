
--[[ Author: Aragan (Asura) and this addon AutoBuffBard created for focus on ody v25 
-----------------------------Authors of this file--------------------------------
------           ******************************************                ------
---                                                                           ---
--	  Aragan (Asura) --------------- [Author Primary]                          -- 
--                                                                             --
---------------------------------------------------------------------------------

               {{{{{{{secret addon AutoBuffBard}}}}}}}}}

Listen carefully, it is unnatural, it is supernatural, it is advanced and superior to everyone, 
and they are primitive without it, it has been hidden for a period of time, it is difficult to reach it, 
it is smooth like water, it is solid like a mountain, it is light like the wind, it is burning like fire.. 
it was made for a long period of time, it came out of the power of darkness, only the light.. 
u cannot be defeated, and it is in your hands, the power is with you.

               {{{{{{{secret addon AutoBuffBard}}}}}}}}} 

NOTE: only this addon can save songs name.
{u can save hundreds of songs setup and change it in a second only 1 word setup }

NOTE: marcato always use in song number 2.
{its save u time its save u every second its save u place in macro} 

command :
//abb bumba ccsv -- ccsv to use ja clarion call and Soul Voice
//abb bumba -- setup songs with nitro 
NOTE: //abb bumba ccsv -- ccsv with nitro 
command to execute all 5 normal songs


]]

_addon.name = 'AutoBuffBard'
_addon.author = 'Helmaru and modi. (Aragan@Asura) , Xenodeus' 
_addon.version = '2.3.2'
_addon.commands = {'abb','ABB',}
_addon.modification = {'Aragan','Xenodeus',}

--modification by Xenodeus and Aragan
--added dynamic pianissimo list
--edited behavior for multiple placeholder songs all at once + clarion call placeholder song (switch via boolean original_logic)

local abf_active = true
local abf_buffer = 0
local abf_mode = "dps"
local abf_runes = {}
local abf_autorune = false
local abf_phsongs = false
local abf_fake_cc = true

local original_logic = false
local abf_pianissimo_players = {}

local slow_recast = "5";
local nitro_reacst = "5";

require 'abb_sets'

windower.register_event('addon command', function(cmd, ...)
	local args = string.lower(table.concat({...},' '))
	--windower.add_to_chat(8,dump({...}))
	if string.lower(cmd) == "help" then
		windower.add_to_chat(8,'[AutoBuffBard] USAGE: //abb [setname] [nitro|noph|ccsv]')
		windower.add_to_chat(8,'[AutoBuffBard] USAGE: //abb [setname] [ccsv]')
		windower.add_to_chat(8,'[AutoBuffBard] USAGE: //abb [setname] [nonitro]')
		windower.add_to_chat(8,'[AutoBuffBard] USAGE: //abb [setname] ')
		windower.add_to_chat(8,'[AutoBuffBard] USAGE: //abb [setname] [noph]')
		windower.add_to_chat(8,'[AutoBuffBard] USAGE: //abb [setname] [ph]')
		windower.add_to_chat(8,'[AutoBuffBard] USAGE: //abb set [pianissimoSetName] [playername]')
		windower.add_to_chat(8,'[AutoBuffBard] USAGE: //abb reset')
	elseif string.lower(cmd) == "set" then
		local params = {...}
		if select('#', ...) ~= 2 then
			windower.add_to_chat(8, '[AutoBuffBard] ****** ['..cmd..' '..args..' CANCELED - Not enough parameters] ******')
		else
			if params[1] and params[2] then
				local pianissimo_set = string.lower(params[1])
				local playername = string.lower(params[2])
				if not bff_pianissimo_sets[pianissimo_set] then
					windower.add_to_chat(8, '[AutoBuffBard] ****** ['..params[1]..' CANCELED - Set Not Found] ******')
				else
					abf_pianissimo_players[playername] = pianissimo_set
					windower.add_to_chat(8, '[AutoBuffBard] ****** ['..playername..' ADDED with the Set '..pianissimo_set..'] ******')
				end
			else
				windower.add_to_chat(8, '[AutoBuffBard] ****** ['..cmd..' '..args..' CANCELED - Not enough parameters] ******')
			end
		end
	elseif string.lower(cmd) == "reset" then
		abf_pianissimo_players = {}
		windower.add_to_chat(8, '[AutoBuffBard] ****** ['..cmd..' DONE] ******')
	else
		if string.find(args, 'noph') then
			abf_phsongs = false
		else
			abf_phsongs = true
		end
		if string.find(args, 'ccsv') then
			abf_fake_cc = true
		else
			abf_fake_cc = false
		end
		if string.find(args, 'nonitro') then
			windower.add_to_chat(8,'[AutoBuffBard] Suppressing nitro!')
			do_buff(cmd, true)
		else
			do_buff(cmd, false)
		end
	end
end)


function do_buff(cmd, nonitro)
	local buffstring = ''
	local recast = slow_recast
	if hasbuff(6) then
		buffstring = 'input /item "Remedy" <me>;wait 5;'
        windower.add_to_chat(8, '[AutoBuffBard] ****** [SILENCED - Using Remedy] ******')
	end
	if is_impaired() then
        windower.add_to_chat(8, '[AutoBuffBard] ****** ['..cmd..' CANCELED - impaired] ******')
		return
	end
	windower.add_to_chat(8,'[AutoBuffBard] '..cmd)
	if moving then 
		windower.add_to_chat(8, '[AutoBuffBard] ****** ['..cmd..' CANCELED - Moving] ******')
		return 
	end 
	if windower.ffxi.get_ability_recasts()[109]== 0 and windower.ffxi.get_ability_recasts()[110]== 0 and not nonitro then
		recast = nitro_reacst
		buffstring = buffstring..'input /ja "Nightingale" <me>;wait 1;input /ja "Troubadour" <me>;wait 1;'
	end
	
	if not bff_sets[cmd] then
		windower.add_to_chat(8, '[AutoBuffBard] ****** ['..cmd..' CANCELED - Set Not Found] ******')
	end
	
	if original_logic then
		local int = 1
		local ph_song = bff_ph_song
		for _,entry in pairs(bff_sets[cmd]) do
			if int == 2 and windower.ffxi.get_ability_recasts()[48]== 0 then
				buffstring = buffstring..'input /ja "Marcato" <me>;wait 1;'
			end
			if int <= 4 or hasbuff(499) then
				if int > 2 and abf_phsongs and entry ~= "Aria of Passion" then
					buffstring = buffstring..'input /ma "'..ph_song..'" <me>;wait '..recast..';'
					ph_song = bff_ph_song..' '..tostring(int)
				end
				buffstring = buffstring..'input /ma "'..entry..'" <me>;wait '..recast..';'
			end
			int = int + 1
		end
	else
		local int = 1
		local ph_songs = bff_ph_songs
		local ph_songs_todo = true
		for _,entry in pairs(bff_sets[cmd]) do
			if int == 2 and windower.ffxi.get_ability_recasts()[48]== 0 then
				buffstring = buffstring..'input /ja "Marcato" <me>;wait 1;'
			end

			if int <= 5 or hasbuff(499) or abf_fake_cc then
				if int > 0 and abf_phsongs and ph_songs_todo and entry ~= "Aria of Passion" then
					for _,ph_song in pairs(bff_ph_songs) do
						buffstring = buffstring..'input /ma "'..ph_song..'" <me>;'
					end
					if (hasbuff(499) or abf_fake_cc) then
						buffstring = 'input /ja "clarion call" <me>;wait 1; input /ja "Soul Voice" <me>;wait 1;'..buffstring		
					end
					ph_songs_todo = false
				end
				buffstring = buffstring..'input /ma "'..entry..'" <me>;wait '..recast..';'
			end
			int = int + 1
		end
	end
	
	for key,entry in pairs(bff_pianissimo) do
		buffstring = buffstring..'input /ja "Pianissimo" <me>;wait 2;input /ma "'..entry..'" '..key..';wait '..recast..';'
    end

	for player_name,pianissimo_set in pairs(abf_pianissimo_players) do
		for key,song_name in pairs(bff_pianissimo_sets[pianissimo_set]) do
			buffstring = buffstring..'input /ja "Pianissimo" <me>;wait 2;input /ma "'..song_name..'" '..player_name..';wait '..recast..';'
		end
	end
	
	windower.add_to_chat(8, buffstring)
	windower.send_command(buffstring)
end



mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().index).x
    mov.y = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().index).y
    mov.z = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().index).z
end
moving = false
function is_moving()
	if windower.ffxi.get_player() == nil then 
		coroutine.schedule(is_moving, 0.5)
		return 
	end
	
	local pl = windower.ffxi.get_mob_by_index(windower.ffxi.get_player().index)
	if pl and pl.x and mov.x then
		local movement = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 ) > 0.1
		if movement and not moving then
			moving = true
		elseif not movement and moving then
			moving = false
		end
	end
	if pl and pl.x then
		mov.x = pl.x
		mov.y = pl.y
		mov.z = pl.z
	end
	coroutine.schedule(is_moving, 0.5)
end
is_moving()

function silent_check_amnesia()
	if hasbuff(16) or hasbuff(261) then --amnesia / ipairement
		return true
	else
		return false	
	end
end
function is_impaired()
	if hasbuff(28) or hasbuff(7) or hasbuff(19) or hasbuff(193) or hasbuff(10) then
		windower.add_to_chat(8, '[AutoBuffBard] ****** ['..cmd..' CANCELED - Amnesia/Impaired] ******')
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