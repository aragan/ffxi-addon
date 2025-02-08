--[[
Copyright © 2020, Ekrividus
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of autoMB nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Ekrividus BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

--[[
autoMB will cast elements for magic bursts automatically
job/level is pulled from game and appropriate elements are used

single bursting only for now, but double may me introduced later

]]
_addon.version = '0.1.0'
_addon.name = 'autoNukes'
_addon.author = 'Ekrividus'
_addon.commands = {'autoNukes', 'nukes', 'ank'}
_addon.lastUpdate = '4/15/2020'
_addon.windower = '4'

require 'tables'
require 'strings'

chat = require('chat')
config = require('config')
packets = require('packets')
res = require('resources')
texts = require('texts')

defaults = T{}
defaults.debug = false -- Show debug output
defaults.active = false -- Engine running
defaults.cast_type = 'spell' -- What to cast (Spell, -ga, -ra, -ja)
defaults.delay = 5 -- Base delay between engine cycles, this is added to cast time for spells
defaults.min_dist = 0.1 -- Closest to mob we should get
defaults.max_dist = 20 -- Furthest from mob we should get
defaults.min_hpp = 0 -- Don't cast if target hpp is lower than this
defaults.max_hpp = 110 -- Don't cast if target hpp is higher than this
defaults.tier = 1 -- The max tier to be used for nuke spam or the tier to use for single spell selection
defaults.mp = 200 -- The minimum reserve MP, make sure we can cast buffs/heals if needed
defaults.single_spell = true -- Onle cast a single spell as chosen by the user
defaults.spell = "Stone" -- The spell to spam
defaults.frequency = 30 -- Random rate to cast spells to add some "human"
defaults.verbose = false -- Lots of extra output

player = windower.ffxi.get_player()
local name = windower.ffxi.get_player().name
local m_job = player.main_job
local s_job = player.sub_job
local fname = name.."_"..m_job.."_"..s_job..".xml"

settings = config.load("data\\"..fname, defaults)

stop = true
pause = 0.0
next_run = nil
last_time = os.clock()

is_casting = false
is_busy = 0
action_delay = 1.2
after_cast_delay = 1.5
failed_cast_delay = 1.5
skillchain_delay = 8

function buff_active(id)
    if T(windower.ffxi.get_player().buffs):contains(BuffID) == true then
        return true
    end
    return false
end

function disabled()
    if (buff_active(0)) then -- KO
        return true
    elseif (buff_active(2)) then -- Sleep
        return true
    elseif (buff_active(6)) then -- Silence
        return true
    elseif (buff_active(7)) then -- Petrification
        return true
    elseif (buff_active(10)) then -- Stun
        return true
    elseif (buff_active(14)) then -- Charm
        return true
    elseif (buff_active(28)) then -- Terrorize
        return true
    elseif (buff_active(29)) then -- Mute
        return true
    elseif (buff_active(193)) then -- Lullaby
        return true
    elseif (buff_active(262)) then -- Omerta
        return true
    end
    return false
end

function busy()
    if (is_casting or is_busy > 0) then
        return true
    end

    return false
end

-- If we're moving, casting or otherwise unable to start casting spells then bug out
function ready_to_cast()
    if (disabled() or busy()) then
        return false
    end

    if (player.vitals.mp <= settings.mp) then
        return false
    end

    return true
end

function check_recast(spell_name)
    local recasts = windower.ffxi.get_spell_recasts()
    local spell = res.spells:with('name', spell_name)

    return recasts[spell.id]
end

function choose_tier()
    tier = tonumber(settings.tier)
    if (tier ~= nil) then
        if (tier == 6) then
            return " VI"
        elseif (tier == 5) then
            return " V"
        elseif (tier == 4) then
            return " IV"
        elseif (tier == 3) then
            return " III"
        elseif (tier == 2) then
            return " II"
        else
            return ""
        end
    elseif (setting.tier == "VI" or settings.tier == "V" or settings.tier == "IV" or settings.tier == "III" or setting.tier == "II") then
        return " "..settings.tier
    else
        return ""
    end
end

function choose_spell()
    if (verbose) then
        windower.add_to_chat(207, _addon.name..": Choosing spell")
    end

    if (settings.single_spell) then
        local spell = settings.spell..choose_tier()
        recast = check_recast(spell)

        if (recast ~= nil and recast > 0) then
            if (settings.verbose) then
                windower.add_to_chat(207, _addon.name..": Spell: \""..spell.."\" recast remaining = "..(recast/100)..".")
            end
            return nil
        else
            return spell
        end
    end
end

function set_target(target)
    if (target == nil or not target.valid_target or target.hpp == nil or target.hpp <= 0) then
        return
    end

    packets.inject(packets.new('incoming', 0x058, {
        ['Player'] = player.id,
        ['Target'] = target.id,
        ['Player Index'] = player.index,
    }))
end

function choose_target()
    if (verbose) then
        windower.add_to_chat(207, _addon.name..": Choosing target.")
    end

    local bt = windower.ffxi.get_mob_by_target('bt')
    local mob_array = windower.ffxi.get_mob_array()

    if (bt == nil and player.status == 1) then
        bt = windower.ffxi.get_mob_by_index(player.target_index)
        if (bt ~= nil and bt.valid_target and bt.is_npc and bt.hpp > 0) then
            for _, mob in ipairs(mob_array) do
                if (bt.id == mob.id) then
                    return bt
                end
            end
        end
    end

    local pt = windower.ffxi.get_party()
    if (pt~= nil) then
        if (settings.verbose) then
            windower.add_to_chat(207, _addon.name..": Checking party for targets...")
        end
        -- If there's no bt and player isn't in combat then see if we can get a pt member's target
        for _, member in ipairs(pt) do
            if (not member.mob.is_npc and not member.mob.charmed and member.mob.target_index ~= nil and member.mob.target_index > 0) then
                local target = windower.ffxi.get_mob_by_index(member.mob.target_index)
                if (target ~= nil and target.is_npc and target.hpp ~= nil and target.hpp > 0) then
                    if (settings.verbose) then
                        windower.add_to_chat(207, _addon.name..": No <bt> Found targeting party member's target - "..target.name)
                    end
                    bt = target
                    for _, mob in ipairs(mob_array) do
                        if (bt.id == mob.id) then
                            return bt
                        end
                    end
                end
            end
        end
    end

    return bt
end

function check_distance(target)
    if (target == nil) then
        return false
    end
    
    local dist = target.distance:sqrt()
    if (dist < settings.min_dist or dist > settings.max_dist) then
        return false
    end

    return true
end

function check_hpp(target)
    if (target == nil) then
        return false
    end

    if (settings.min_hpp < target.hpp and target.hpp < settings.max_hpp) then
        return true
    end

    return false
end

function cast_spell(spell, target)
    if (spell == nil or spell == '' or target == nil) then
        return false
    end

    if (settings.verbose) then
        windower.add_to_chat(207, _addon.name..": Casting spell "..tostring(spell)..' on '..target.name)
    end

    windower.send_command('input /ma "'..spell..'" '..'<t>')
    return true
end

function engine_start()
    windower.add_to_chat(207, _addon.name..": Starting...")
    player = windower.ffxi.get_player()
    stop = false
    pause = 0
    is_busy = 0
    last_time = os.clock()
end

function engine_stop()
    windower.add_to_chat(207, _addon.name..": Stopping...")
    stop = true
end

function engine_pause(t) 
    if (t > 0 or t == -1999) then
        pause = t
    end
end

function show_help()
    windower.add_to_chat(207, "=*=*=    ".._addon.name..": Commands    =*=*=")
    windower.add_to_chat(207, "Help - Shows this info")
    windower.add_to_chat(207, "Status or Show - Display current settings and other info")
    windower.add_to_chat(207, "Start|On - Starts the engine")
    windower.add_to_chat(207, "Stop|Off - Stops the engine")
    windower.add_to_chat(207, "(C)ast <spell|ga|ra|ja|helix> - Sets the spell type to be cast, not implemented yet")
    windower.add_to_chat(207, "(T)ier # - Sets the spell tier to be cast")
    windower.add_to_chat(207, "(D)elay #.# - Sets the engines speed in seconds")
    windower.add_to_chat(207, "(P)ause #.# - Pauses the engine for #.# seconds")
    windower.add_to_chat(207, "(S)pell name - sets the spell to cast to name, do not include tier")
    windower.add_to_chat(207, "(Dist)ance < or > # - The closest a mob can get before casting stops")
    windower.add_to_chat(207, "MP ## - Will not cast if MP would fall below this amount")
    windower.add_to_chat(207, "HP < or > # - The hp percentage of the mob where casting will stop if above or below")
end

function show_status()
    windower.add_to_chat(207, "=-=-=-=    ".._addon.name..": Status    =-=-=-=")
    windower.add_to_chat(207, "Running: "..(stop and "No" or "Yes"))
    windower.add_to_chat(207, "Paused: "..(pause ~= 0 and (tostring(pause).." seconds more") or "No"))
    windower.add_to_chat(207, "Max Cast Tier: "..tostring(settings.tier))
    windower.add_to_chat(207, "Delay: "..settings.delay)
    windower.add_to_chat(207, "Spell: "..settings.spell)
    windower.add_to_chat(207, "Mindist: "..settings.min_dist.." Maxdist: "..settings.max_dist)
    windower.add_to_chat(207, "MP: "..settings.mp)
    windower.add_to_chat(207, "Min HPP: "..settings.min_hpp.." Max HPP: "..settings.max_hpp)

end

-- Check for skillchain effects applied, this can get wonky if/when a group is skillchaining on multiple mobs at once
windower.register_event('incoming chunk', function(id, packet, data, modified, is_injected, is_blocked)
	if (id ~= 0x28 or not active) then
		return
    end
    
	local actions_packet = windower.packets.parse_action(packet)
	local mob_array = windower.ffxi.get_mob_array()
	local valid = false
	local party = windower.ffxi.get_party()
	local party_ids = T{}
	
	player = windower.ffxi.get_player()

	if (data:unpack('I', 6) == player.id) then 
		local category, param = data:unpack( 'b4b16', 11, 3)
		local recast, targ_id = data:unpack('b32b32', 15, 7)
		local effect, message = data:unpack('b17b10', 27, 6)
		
		if start_act:contains(category) then
			if param == 24931 then                  -- Begin Casting/WS/Item/Range
				is_busy = 0
				is_casting = true
			elseif param == 28787 then              -- Failed Casting/WS/Item/Range
				is_casting = false
				is_busy = failed_cast_delay
			end
		elseif category == 6 then                   -- Use Job Ability
			is_busy = ability_delay
		elseif category == 4 then                   -- Finish Casting
			is_busy = after_cast_delay
			is_casting = false
		elseif finish_act:contains(category) then   -- Finish Range/WS/Item Use
			is_busy = 0
			is_casting = false
		end
    end
    
    -- Get ids of all current party member
	for _, member in pairs (party) do
		if (type(member) == 'table' and member.mob) then
			party_ids:append(member.mob.id)
		end
	end

	local cur_t = windower.ffxi.get_mob_by_target('t')
	local bt = windower.ffxi.get_mob_by_target('bt')
	
	for _, target in pairs(actions_packet.targets) do
		local t = windower.ffxi.get_mob_by_id(target.id)
		-- Make sure the mob is claimed by our alliance then
		if ((cur_t and cur_t.id == t.id) or (bt and bt.id == t.id) or party_ids:contains(t.claim_id)) then
			-- Make sure the mob is a valid MB target
            if (t and (t.is_npc and t.valid_target and not t.in_party and not t.charmed) and t.distance:sqrt() < 22) then
                pause = skillchain_delay
            end
        end
    end
end)

windower.register_event('outgoing chunk', function(id, data)
    if (id == 0x015) then
        local action_message = packets.parse('outgoing', data)
        player_rot = action_message['Rotation']
    end
end)

windower.register_event('prerender', function(...)
    if (stop == true) then return end
    player = windower.ffxi.get_player()
    local action_taken = false
    local cast_delay = 0
    local spell = ''
    local target = nil
    local time = os.clock()
    local delta_time = time - last_time
    last_time = time

    if (settings.verbose) then
        windower.add_to_chat(207, _addon.name..": Engine loop...\nPlayer status: "..player.status)
    end

    if (is_busy > 0) then
        if (settings.verbose) then
            windower.add_to_chat(207, _addon.name..": Busy for "..tostring(is_busy).." seconds")
        end
        is_busy = (is_busy - delta_time) > 0 and (is_busy - delta_time) or 0
        if (is_busy > 0) then return end
    end

    if (pause == -9999) then
        if (settings.verbose) then
            windower.add_to_chat(207, _addon.name..": Paused indefinently")
        end
    elseif (pause > 0) then
        if (settings.verbose) then
            windower.add_to_chat(207, _addon.name..": Busy for "..tostring(pause).." seconds")
        end
        pause = (pause - delta_time) > 0 and (pause - delta_time) or 0
        if (pause > 0) then return end
    end

    if (ready_to_cast()) then
        if (settings.verbose) then
            windower.add_to_chat(207, _addon.name..": Ready to cast")
        end
        if (math.random(1, 100) > settings.frequency) then
            target = choose_target()
            if (target ~= nil) then
                set_target(target)
                spell = choose_spell()
                if (spell ~= nil and spell ~= '') then
                    if (check_hpp(target) and check_distance(target)) then
                        action_taken = true
                        cast_spell(spell, target)
                    end
                end
            end
        end
    end

    pause = settings.delay
end)

windower.register_event('zone change', function(id, data)
    if (not stop) then
        engine_stop()
    end
end)

windower.register_event('job change', function(...)
    player = windower.ffxi.get_player()
    name = windower.ffxi.get_player().name
    m_job = player.main_job
    s_job = player.sub_job
    fname = name.."_"..m_job.."_"..s_job..".xml"
    
    settings = config.load("data\\"..fname, defaults)
    
    end)

-- Stop checking if logout happens
windower.register_event('logout', function(...)
    engine_stop()
end)

windower.register_event('unload', function(...)
    engine_stop()
end)

windower.register_event('addon command', function(...)
    local args = T{...}:map(string.lower)
    local argc = #args

    if (argc == nil or argc < 1 or args[1] == 'help') then
        show_help()
    elseif (args[1] == 'status' or args[1] == 'show') then
        show_status()
    elseif (args[1] == 'on' or args[1] == 'start') then
        engine_start()
    elseif (args[1] == 'off' or args[1] == 'stop') then
        engine_stop()
    elseif (args[1] == 'd' or args[1] == 'delay') then
        if (args[2] == nil or tonumber(args[2]) < 0 or tonumber(args[2]) > 600) then
            windower.add_to_chat(207, _addon.name..": Invalid tier - Usage: nukes delay #.#")
            windower.add_to_chat(207, _addon.name..": Where #.# is a number of seconds for delay from 0 to 600")
        else
            settings.delay = tonumber(args[2])
        end
    elseif (args[1] == 'p' or args[1] == 'pause') then
        if (args[2] == nil) then
            if (pause == -9999) then
                pause = 0
            else
                pause = -9999
            end
        elseif (tonumber(args[2]) < 0.1 or tonumber(args[2]) > 600) then
            windower.add_to_chat(207, _addon.name..": Invalid pause time - Usage: nukes pause #.#")
            windower.add_to_chat(207, _addon.name..": Without a number will pause or unpause indefinetly")
        else
            pause = tonumber(args[2])
        end
    elseif (args[1] == 'c' or args[1] == 'cast') then
        if (args[2] == nil) then
            windower.add_to_chat(207, _addon.name..": Invalid type - Usage: nukes cast type")
            windower.add_to_chat(207, _addon.name..": Where type is one of spell ga ra ja or helix")
        else
            settings.tier = tonumber(args[2])
        end
    elseif (args[1] == 'single' or args[1] == 'singlespell') then
        if (args[2] ~= nil) then
            if (args[2] == 'on') then
                settings.single_spell = true
            elseif (args[2] == 'off') then
                settings.single_spell = false
            end
        else
            settings.single_spell = not settings.single_spell
        end
    elseif (args[1] == 's' or args[1] == 'spell') then
        if (args[2] ~= nil) then
            settings.spell = args[2]:lower():ucfirst()
            settings.single_spell = true
        else
            windower.add_to_chat(207, _addon.name..": Usage - nukes spell spellname")
            windower.add_to_chat(207, _addon.name..": Without tier, use the tier option to choose spell tier")
        end
    elseif (args[1] == 't' or args[1] == 'tier') then
        if (args[2] == nil or tonumber(args[2]) < 1 or tonumber(args[2]) > 6) then
            windower.add_to_chat(207, _addon.name..": Invalid tier - Usage: nukes tier #")
            windower.add_to_chat(207, _addon.name..": Where # is a number between 1 and 6")
        else
            settings.tier = tonumber(args[2])
        end
    elseif (args[1] == 'distance' or args[1] == 'dist') then
        if (args[2] == nil or args[3] == nil or (args[2] ~= '<' and args[2] ~= '>') or tonumber(args[3]) < 0 or tonumber(args[3]) > 24) then
            windower.add_to_chat(207, _addon.name..": Usage: Nukes distance > # or nukes distance < #")
            windower.add_to_chat(207, "# is the closest and furhtest from target that spells will be cast, defaults nuke if distanc > 0.1 and distance < 24")
        else
            if (args[2] == '>') then
                settings.min_dist = tonumber(args[3])
            elseif (args[2] == '<') then
                settings.max_dist = tonumber(args[3])
            end
        end
    elseif (args[1] == 'mp') then
        if (args[2] ~= nil) then
            settings.mp = tonumber(args[2])
        end
    elseif (args[1] == 'hp') then
        if (args[2] == nil or args[3] == nil or (args[2] ~= '<' and args[2] ~= '>') or tonumber(args[3]) < 0 or tonumber(args[3]) > 100) then
            windower.add_to_chat(207, _addon.name..": Usage: Nukes hp > # or nukes hp < #")
            windower.add_to_chat(207, "# is the hp percentage to not nuke above or below, defaults nuke if hp > 5% and hp < 98%")
        else
            if (args[2] == '>') then
                settings.min_hpp = tonumber(args[3])
            elseif (args[2] == '<') then
                settings.max_hpp = tonumber(args[3])
            end
        end
    elseif (args[1] == 'f') then
        if (args[2] ~= nil and args[2] >= 1 and args[2] <= 100) then
            settings.frequency = tonumber(args[2])
        else
            windower.add_to_chat(207, _addon.name..": Invalid frequency - Usage: nukes frequency #")
            windower.add_to_chat(207, _addon.name..": Where # is a number between 1 and 100")
        end
    elseif (args[1] == 'verbose' or args[1] == 'v') then
        settings.verbose = not settings.verbose
    elseif (args[1] == 'save') then
        settings:save('all')
        windower.add_to_chat(207, _addon.name..": Settings file "..fname.." saved")
    else
        windower.add_to_chat(207, _addon.name..": Use help to see list of commands")
        show_status()
    end
end)