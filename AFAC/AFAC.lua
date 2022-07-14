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
_addon.name = 'AFAC'
_addon.author = 'Ekrividus'
_addon.commands = {'afac'}
_addon.lastUpdate = '4/3/2022'
_addon.windower = '4'

require 'tables'
require 'strings'
require 'logger'

res = require('resources')
config = require('config')
chat = require('chat')
packets = require('packets')

local debug = false
local time_last_check = 0
local delay = 0
local action = 0
local player = nil 
local skip_afac = false

-- Default settings
local defaults = T{}
defaults.frequency = 0.5 -- Time in seconds between trying to use abilities/spells
defaults.convert_mp = 300 -- Mp threshold for Convert
defaults.blood_pact = 'Volt Strike' -- Which Blood Pact to use

-- Newly added default settings
defaults.delays = T{
    pet=1.8,
    ja=1.5,
    summon=6,
}

-- Load settings/defaults
local settings = T{}
settings = config.load(defaults)

-- Add missing settings
settings.delays = settings.delays or defaults.delays

local actions = {
    [0]={type="ja", verb="Apogee",noun="<me>"},
    [1]={type="ja", verb="Astral Flow",noun="<me>"},
    [2]={type="pet", verb="Blood Pact: Rage",noun="<t>"},
    [3]={type="ja", verb="Mana Cede",noun="<me>"},
    [4]={type="pet", verb="Blood Pact: Rage",noun="<t>"},
    [5]={type="ja", verb="Astral Conduit",noun="<me>"},
    [6]={type="pet", verb="Blood Pact: Rage",noun="<t>"},
}

local summon_list = {
    ["Volt Strike"]="Ramuh",
    
    ["Wind Blade"] = "Garuda",
    
    ["Flaming Crush"] = "Ifrit",
    ["Meteor Stike"] = "Ifrit",

    ["Hysteric Barrage"] = "Siren",
}

--[[
    Function: title_case
    @param string str, str to be converted
    @return string, converted string
    Converts a string param from it's current casing to title case
]]
function title_case(str)
    if (str == nil) then
        return str
    end
    str = str:gsub("(%a)([%w_']*)", function(first, rest)
        return first:upper()..rest:lower()
    end)
    return str
end

--[[ Function: Message
    @param string message, message to be sent
    @param bool debug, whether this is a debug message or not
    @param bool log, should message go to windower log instead of in-game chat
    Send messages to in-game or windower logs
]]--
function message(msg, debug, to_log)
    if (not debug and not to_log) then
        windower.add_to_chat(207, msg)
    elseif (debug and not to_log) then
        windower.add_to_chat(207, msg)
    elseif (to_log) then
        log(msg)
    end
end

--[[
    Main Loop in prerender
]]
windower.register_event('prerender', function(...)
    local time = os.clock()
    local cmd = ""

    if (running and (time > time_last_check + settings.frequency) and (time > time_last_check + delay)) then
        message("Delay from last action: "..tostring(delay).." Time since last action: "..time - time_last_check, true)
        player = windower.ffxi.get_player()

        local recasts = T(windower.ffxi.get_ability_recasts())
        local buffs = T(windower.ffxi.get_player().buffs)

        
        time_last_check = time

        if (action >= 7 and 
            not T(buffs):contains(res.buffs:with('en', "Apogee").id) and 
            not T(buffs):contains(res.buffs:with('en', "Astral Conduit").id) and 
            not T(buffs):contains(res.buffs:with('en', "Astral Flow").id)) then
                
            running = false
            action = 0
            delay = 0
            message("Astral Conduit Completed! Blood Pacts Complete!")
            
            local buff_list = ""
            for k, v in ipairs(buffs) do
                buff_list = buff_list..", "..res.buffs[v].en
            end
            message("Buffs: "..buff_list, true)
            return
        end

        action = action > 6 and 6 or action
        local action_id = res.job_abilities:with('en', actions[action].verb) and res.job_abilities:with('en', actions[action].verb).recast_id or nil
        message(actions[action].verb.." Recast ID: "..action_id, true)
        if (skip_afac and (action == 1 or action == 5)) then
            action = action + 1
            return
        end

        -- Wait for AC and BP CDs, bugout if AF is on CD, skip Apogee and Mana Cede
        if (recasts[action_id] and recasts[action_id] > 0) then
            message(actions[action].verb.." is on CD for "..recasts[action_id].." seconds. Should we try again or just skip it?", true)
            if (recasts[action_id] and recasts[action_id] > 0 and actions[action].verb == "Astral Flow") then
                delay = 0
                running = false
                return
            elseif (recasts[action_id] and recasts[action_id] > 0 and actions[action].verb == "Astral Conduit") then
                delay = recasts[action_id] - (settings.frequency * 2)
                return
            elseif (recasts[action_id] and recasts[action_id] > 0 and action <= 7 and actions[action].verb == "Blood Pact: Rage") then
                delay = recasts[action_id] - (settings.frequency * 2)
                return
            end
            delay = 0.5
            action = action + 1
            return
        end

        if (action >= 6 and recasts[res.job_abilities:with('en', "Convert").recast_id] and 
            recasts[res.job_abilities:with('en', "Convert").recast_id] == 0 and 
            player.vitals.mp < settings.convert_mp) then
            cmd = "input /ja \"Convert\" <me>"
            delay = settings.delays.ja
        elseif (actions[action].verb ~= "Blood Pact: Rage") then
            cmd = "input /"..actions[action].type.." \""..actions[action].verb.."\" "..actions[action].noun
            delay = settings.delays[actions[action].type]
        elseif (actions[action].verb == "Blood Pact: Rage") then
            local pet = windower.ffxi.get_mob_by_target("pet")
            if (not pet or pet.hpp <= 0) then
                cmd = "input /ma \""..summon_list[settings.blood_pact]
                action = action >= 6 and 6 or action - 1
                delay = settings.delays.summon
            else
                cmd = "input /"..actions[action].type.." \""..settings.blood_pact.."\" "..actions[action].noun
                delay = settings.delays[actions[action].type]
            end
        end
        
        local target = windower.ffxi.get_mob_by_target("t")

        if (not recasts:contains(action_id)) then
            windower.send_command(cmd)
        end

        action = action + 1
    end
end)

windower.register_event('addon command', function(...)
    if (T({"start","go","on"}):contains(arg[1]:lower())) then
        message("AF + AC Starting!")
        delay = 0
        running = true
    elseif (T({"stop","end","off"}):contains(arg[1]:lower())) then
        message("AF + AC Stopping!")
        delay = 0
        running = false
    elseif (T{"bp","use","bloodpact"}):contains(arg[1]:lower()) then
        local pact = title_case(T(arg):slice(2,#arg):concat(" "))
        if (res.job_abilities:with('en', pact)) then
            settings.blood_pact = pact
            message("Blood Pact set to "..pact)
        else
            message("No Blood Pact named: "..pact)
            return
        end
        settings:save()
    elseif (T({"mp","magic","mana"}):contains(arg[1]:lower())) then
        local num = tonumber(arg[2]) or 300
        message("Convert MP threshold: "..tostring(num))
        settings:save()
    elseif (arg[1]:lower() == "show") then
        for k, v in pairs(settings) do
            k = title_case(k:split("_"):concat(" "))
            if (type(v) == "table") then
                message(title_case(k)..":")
                for k2, v2 in pairs(v) do
                    k2 = title_case(k2:split("_"):concat(" "))
                    message("....."..title_case(k2)..": "..tostring(v2))
                end
            else
                message(title_case(k)..": "..tostring(v))
            end
        end
    elseif (arg[1]:lower() == "skip") then
        skip_afac = not skip_afac
        message("Will "..(skip_afac and "skip " or "use ").."Astral Flow/Conduit")
    elseif (arg[1]:lower() == "debug") then
        debug = not debug
        message("Debug information will "..(debug and "print" or "not print"))
    end

end)