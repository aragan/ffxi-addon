_addon.name = 'OhNoYouDont'
_addon.author = 'Lorand'
_addon.command = 'onyd'
_addon.version = '0.8.0'
_addon.lastUpdate = '2016.10.16'

require('luau')
require('lor/lor_utils')
_libs.lor.req('all', {n='strings',v='2016.10.16'})
_libs.lor.debug = false

local rarr = string.char(129,168)

local abil_start_ids = S{43,326,675}
local spell_start_ids = S{3,327,716}
start_ids = abil_start_ids:union(spell_start_ids)

local active_tense = {turn='Turning for',stun='Stunning'}

local defaults = {shark={stun=S{'Protolithic Puncture','Pelagic Cleaver','Tidal Guillotine','Carcharian Verve','Marine Mayhem','Aquatic Lance'}}}
settings = _libs.lor.settings.load('data/settings.lua', defaults)

blu_stun_ids = {623,692,628,669,640}  --Omitted spells with a cast time > 1s
blu_stun_names = {[623]='Head Butt',[692]='Sudden Lunge',[628]='Frypan',[669]='Whirl of Rage',[640]='Tail Slap'}

profile = {}
local enabled = false
local debugging = true
profiles = {}

local get_action_info = _libs.lor.packets.get_action_info


windower.register_event('load', function()
    load_settings()
	print_helptext()
end)


windower.register_event('logout', function()
	windower.send_command('lua unload '.._addon.name)
end)


windower.register_event('addon command', function (command,...)
	command = command and command:lower() or 'help'
	local args = {...}
	
	if S{'reload','unload'}:contains(command) then
        windower.send_command('lua %s %s':format(command, _addon.name))
	elseif S{'load','profile'}:contains(command) then
		if (args[1] ~= nil) then
            if profiles[args[1]] ~= nil then
                enabled = true
				loadProfile(args[1])
            else
                atcfs(123, 'Error: Unable to find profile: %s', args[1])
            end
		else
			atc('ERROR: No profile name provided to load.')
		end
	elseif S{'enable','on','start'}:contains(command) then
		enabled = true
		print_status()
	elseif S{'disable','off','stop'}:contains(command) then
		enabled = false
		atc('Disabled.')
	elseif command == 'status' then
		print_status()
    elseif command == 'info' then
        if not _libs.lor.exec then
            atc(3,'Unable to parse info.  Windower/addons/libs/lor/lor_exec.lua was unable to be loaded.')
            atc(3,'If you would like to use this function, please visit https://github.com/lorand-ffxi/lor_libs to download it.')
            return
        end
        local cmd = args[1]     --Take the first element as the command
        table.remove(args, 1)   --Remove the first from the list of args
        _libs.lor.exec.process_input(cmd, args)
	else
		atc(123, 'ERROR: Unknown command')
	end
end)


function load_settings()
    local res_types = S{'monster_abilities','spells'}
    local norm_res = {}
    for rtype,_ in pairs(res_types) do
        norm_res[rtype] = {}
        for id, action in pairs(res[rtype]) do
            local aname = action.en
            local aname_l = aname:lower()
            norm_res[rtype][aname_l] = norm_res[rtype][aname_l] or {name=aname,ids=S{}}
            norm_res[rtype][aname_l].ids:add(id)
        end
    end
    
    for profile_name, profile in pairs(settings) do
        profiles[profile_name] = {}
        for player_action, mob_actions in pairs(profile) do
            profiles[profile_name][player_action] = {monster_abilities={},spells={}}
            for mob_action,_ in pairs(mob_actions) do
                local ma = mob_action:lower()
                local found_count = 0
                for rtype,_ in pairs(res_types) do
                    local mabil = norm_res[rtype][ma]
                    if mabil ~= nil then
                        for id,_ in pairs(mabil.ids) do
                            profiles[profile_name][player_action][rtype][id] = mabil.name
                            found_count = found_count + 1
                        end
                    end
                end
                
                if found_count < 1 then
                    atcfs(123, 'Unable to find "%s" in resources!', mob_action)
                end
            end
        end
    end
end


function loadProfile(pname)
    profile = profiles[pname]
    profile.name = pname
	print_status()
end


function print_status()
	local pname = profile.name or '(none)'
	local etxt = enabled and 'ACTIVE' or 'DISABLED'
	atc('Profile loaded: '..pname..' ['..etxt..']')
	
    local _profile = profiles[pname]
    for paction, msg in pairs(active_tense) do
        if _profile[paction] ~= nil then
            local action_set = S{}
            for _,group in pairs(_profile[paction]) do
                for id, name in pairs(group) do
                    action_set:add(name)
                end
            end
            atcfs('%s: %s', msg, ', ':join(action_set))
        else
            atcfs('%s: (nothing)', msg)
        end
    end
end


function get_stun_cmd(action_name)
	local player = windower.ffxi.get_player()
	if S{'BLM','DRK'}:contains(player.main_job) or S{'BLM','DRK'}:contains(player.sub_job) then
		return '/ma Stun <t>'
	elseif S{player.main_job,player.sub_job}:contains('DNC') then
		return '/ja "Violent Flourish" <t>'
    elseif player.main_job == 'BLU' then
        local set_spells = S(windower.ffxi.get_mjob_data().spells)
        local recast_ms = windower.ffxi.get_spell_recasts()
        for _,id in pairs(blu_stun_ids) do
            if set_spells:contains(id) and (recast_ms[id] == 0) then
                return '/ma "%s" <t>':format(blu_stun_names[id])
            end
        end
        atcfs(123, 'ERROR: Unable to find a BLU spell that is ready to stun %s', action_name)
        return nil
	else
		atcfs(123, 'ERROR: Job combo has no abilities available to stun %s', action_name)
		return nil
	end
end


function attempt_stun(action_name)
	local stun_cmd = get_stun_cmd(action_name)
	if (stun_cmd ~= nil) then
		windower.send_command('input '..stun_cmd)
		atcfs(123, '===============> STUNNING %s <===============', action_name)
	end
end


function processAction(m_id, a_id)
    --profile[turn|stun][monster_abilities|spells][id] = mabil.name
	if abil_start_ids:contains(m_id) then
        if profile.turn ~= nil then
            local turn_name = profile.turn.monster_abilities[a_id]
            if turn_name ~= nil then
                local target = windower.ffxi.get_mob_by_target()
                if target ~= nil then
					turn_away(target)
                    --windower.ffxi.turn(target.facing)
                    atcfs(258, 'Alert: Turned around for %s!', turn_name)
                    return true
                else
                    atcfs(123, 'Error: Unable to find target to turn for %s', turn_name)
                    return false
                end
            end
        end
    
        local stun_name = profile.stun.monster_abilities[a_id]
        if stun_name ~= nil then
            attempt_stun(stun_name)
            return true
        end
        
        local mabil = res.monster_abilities[a_id]
        local abilname = mabil and mabil.en or '(unknown)'
        atcd('No action to perform for %s [id: %s]', abilname, a_id)
	elseif spell_start_ids:contains(m_id) then
        local stun_name = profile.stun.spells[a_id]
        if stun_name ~= nil then
            attempt_stun(stun_name)
            return true
        end
        
		local spell = res.spells[a_id]
		local sname = spell and spell.en or '(unknown)'
        atcd('No action to perform for %s [id: %s]', sname, a_id)
	end
	return false	
end

function turn_away(target)
	local atan = math.atan
    local pi = math.pi
	
	local player = windower.ffxi.get_mob_by_id(windower.ffxi.get_player().id)
	if not player then 
		target = 0 
		return 
	end
	local mob = windower.ffxi.get_mob_by_index(target.index)
	local x,y = player.x-mob.x,player.y-mob.y
	local angle = atan(y/x)
	local heading = 0
	if x > 0 and y > 0 then
		heading = 0 - angle
	elseif x < 0 and y > 0 then
		heading = 0 - (pi + angle)
	elseif x < 0 and y < 0 then
		heading = pi - angle
	elseif x > 0 and y < 0 then
		heading = 0 - angle
	end
	windower.ffxi.turn(heading)
end

windower.register_event('incoming chunk', function(id, data)
	if enabled and (id == 0x28) then
		local ai = get_action_info(id, data)
		local actor = windower.ffxi.get_mob_by_id(ai.actor_id)
		local target = windower.ffxi.get_mob_by_target()
		if (actor ~= nil) and (actor.is_npc) and (target ~= nil) and (target.id == ai.actor_id) then
			for _,targ in pairs(ai.targets) do
				for _,tact in pairs(targ.actions) do
					if start_ids:contains(tact.message_id) then
						if processAction(tact.message_id, tact.param) then
							return
						end
					end
				end
			end
		end
	end
end)


function print_helptext()
	atc('Commands:')
	atc('onyd load <profile name> : load profile <profile name>')
end


function atcd(...)
	if debugging then
		atcfs(...)
	end
end

-----------------------------------------------------------------------------------------------------------
--[[
Copyright © 2016, Lorand
All rights reserved.
Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    * Neither the name of OhNoYouDont nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Lorand BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--]]
-----------------------------------------------------------------------------------------------------------