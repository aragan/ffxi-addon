_addon.name = 'AutoBardBuff'
_addon.author = 'Helmaru'
_addon.version = '2.2.0'
_addon.commands = {'abb','ABB',}

local abf_active = true
local abf_buffer = 0
local abf_mode = "dps"
local abf_runes = {}
local abf_autorune = false
local abf_phsongs = true


local slow_recast = "7";
local nitro_reacst = "5";

require 'abb_sets'

windower.register_event('addon command', function(cmd, ...)
	local args = string.lower(table.concat({...},' '))
	--windower.add_to_chat(8,dump({...}))
	if string.lower(cmd) == "help" then
		windower.add_to_chat(8,'[AutoBardBuff] USAGE: //abb [setname] [nitro|noph]')
	else
		if args == 'noph' then
			abf_phsongs = false
		else
			abf_phsongs = true
		end
		if args == 'nonitro' then
			windower.add_to_chat(8,'[AutoBardBuff] Suppressing nitro!')
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
        windower.add_to_chat(8, '[AutoBardBuff] ****** [SILENCED - Using Remedy] ******')
	end
	if is_impaired() then
        windower.add_to_chat(8, '[AutoBardBuff] ****** ['..cmd..' CANCELED - impaired] ******')
		return
	end
	windower.add_to_chat(8,'[AutoBardBuff] '..cmd)
	if moving then 
		windower.add_to_chat(8, '[AutoBardBuff] ****** ['..cmd..' CANCELED - Moving] ******')
		return 
	end 
	if windower.ffxi.get_ability_recasts()[109]== 0 and windower.ffxi.get_ability_recasts()[110]== 0 and not nonitro then
		recast = nitro_reacst
		buffstring = buffstring..'input /ja "Nightingale" <me>;wait 4;input /ja "Troubadour" <me>;wait 4;'
	end
	
	if not bff_sets[cmd] then
		windower.add_to_chat(8, '[AutoBardBuff] ****** ['..cmd..' CANCELED - Set Not Found] ******')
	end
	
	local int = 1
	local ph_song = bff_ph_song
	for _,entry in pairs(bff_sets[cmd]) do
		if int == 2 and windower.ffxi.get_ability_recasts()[48]== 0 then
			buffstring = buffstring..'input /ja "Marcato" <me>;wait 4;'
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
	
	for key,entry in pairs(bff_pianissimo) do
		buffstring = buffstring..'input /ja "Pianissimo" <me>;wait 3;input /ma "'..entry..'" '..key..';wait '..recast..';'
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
		windower.add_to_chat(8, '[AutoBardBuff] ****** ['..cmd..' CANCELED - Amnesia/Impaired] ******')
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