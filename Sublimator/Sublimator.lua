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

_addon.version = '1.1.0'
_addon.name = 'Sublimator'
_addon.author = 'Ekrividus'
_addon.commands = {'sublimator','sublimate','sbl'}
_addon.lastUpdate = '4/04/2021'
_addon.windower = '4'

require 'tables'

res = require('resources')
config = require('config')

defaults = T{}
defaults.debug = false -- Show debug output
defaults.mp_missing = 600 -- Use when missing this many MP
defaults.mpp_low = 30 -- Or use if MP falls below this point
defaults.full_only = true -- Only use when fully charged
defaults.min_charge_seconds = 300 -- Minimum time in seconds (300 is 5 mins.)
defaults.delay = 1 -- seconds between MP checks
defaults.verbose = true -- Spam your chat with details
defaults.disable_on_zone = false -- Whether or not to disable on zoning

settings = config.load(defaults)

local player = windower.ffxi.get_player()
local buffs = T{}
local recasts = T{}
local last_check_time = 0
local charge_time = 0
local main_job = nil
local sub_job = nil
local active = true
local zone_pause = 30
local paused = 0

-- Zones where Sublimator will not try to activate, add/remove as you see fit
local Cities = S{
    "Northern San d'Oria", "Southern San d'Oria", "Port San d'Oria", "Chateau d'Oraguille",
    "Bastok Markets", "Bastok Mines", "Port Bastok", "Metalworks",
    "Windurst Walls", "Windurst Waters", "Windurst Woods", "Port Windurst", "Heavens Tower",
    "Ru'Lude Gardens", "Upper Jeuno", "Lower Jeuno", "Port Jeuno",
    --"Selbina", "Mhaura", "Kazham", "Norg", "Rabao", "Tavnazian Safehold",
    "Aht Urhgan Whitegate", "Al Zahbi", "Nashmau",
    "Southern San d'Oria (S)", "Bastok Markets (S)", "Windurst Waters (S)",
    "Western Adoulin", "Eastern Adoulin", "Celennia Memorial Library",
    "Bastok-Jeuno Airship", "Kazham-Jeuno Airship", "San d'Oria-Jeuno Airship", "Windurst-Jeuno Airship",
    "Ship bound for Mhaura", "Ship bound for Selbina", "Open sea route to Al Zahbi", "Open sea route to Mhaura",
    "Silver Sea route to Al Zahbi", "Silver Sea route to Nashmau", "Manaclipper", "Phanauet Channel",
    "Chocobo Circuit", "Feretory", "Mog Garden",
}

--TODO: Add checks for statuses that disallow use of JAs
function is_disabled() 
    return false
end

-- returns true if current zone is a city or town.
function in_town()
    local zone = res.zones[windower.ffxi.get_info().zone].en
    if Cities:contains(zone) then
        return true
    end
    return false
end

function get_buffs(player)
    local l = T{}
    for k, b in pairs(player.buffs) do
        if (res.buffs:with('id',b)) then
            l[b] = res.buffs:with('id',b).name
        end
    end

    return T(l)
end

function start()
    active = true
end

function stop()
    active = false
end

function reset()
    active = false
    main_job = windower.ffxi.get_player().main_job:lower()
    sub_job = windower.ffxi.get_player().sub_job:lower()

    settings = config.load(defaults)
    if (not settings[main_job]) then
        settings[main_job] = {}
        settings[main_job].mp_missing = settings.mp_missing
        settings[main_job].mpp_low = settings.mpp_low
        settings[main_job].full_only = settings.full_only
        settings[main_job].min_charge_seconds = settings.min_charge_seconds
    end
end

function show_help()
    windower.add_to_chat(207, _addon.name..": Help\n"..
    [[
        Keep sublimation up and use as appropriate.
        Commands:
        save - saves current settings to your main job
        zone - toggles whether or not to disable when zoning, off by default
        mpp <number> - sets the MP % for sublimation
        missing <number> - sets an amount of MP lost for sublimation
        full [true|false] - will only use sublmiation when full if true
        charge <number> - sets minimum charge time for sublimation if full is false
        verbose [true|false] - sets whether or not to post extra messages
    ]])

end

function show_status()
    windower.add_to_chat(207, "   ~~~~~ ".._addon.name.." Status - "..(active and "Running" or "Stopped").. " ~~~~~\n"
    .."\nUse only when fully charged? "
    ..(settings[main_job] ~= nil and tostring(settings[main_job].full_only) or tostring(settings.full_only))
    .."\nWhen not fully charged:\n\tIf charge time elapsed is more than: "
    ..(settings[main_job] ~= nil and settings[main_job].min_charge_seconds or settings.min_charge_seconds) .. " seconds"
    .."\nand MP % below: "
    ..(settings[main_job] ~= nil and settings[main_job].mpp_low or settings.mpp_low)
    .." -or- MP Mising >= "
    ..(settings[main_job] ~= nil and settings[main_job].mp_missing or settings.mp_missing)
    )
end

windower.register_event('prerender', function(...)
    if (not active or (not main_job == "sch" and not sub_job == "sch")) then
        return
    end
    player = windower.ffxi.get_player()

    local time = os.time()
    local delta_time = time - last_check_time
    if (paused > 0) then
        paused = paused - delta_time
        paused = paused > 0 and paused or 0
    end

    if (paused > 0 or player.status > 1) then
        return
    end

    if (last_check_time + settings.delay < time) then
        buffs = get_buffs(player)
        recasts = windower.ffxi.get_ability_recasts()
        last_check_time = time

        if (main_job and settings[main_job]) then 
            mpp_low = settings[main_job].mpp_low
            mp_missing = settings[main_job].mp_missing
            full_only = settings[main_job].full_only
            min_charge_seconds = settings[main_job].min_charge_seconds
        else
            mpp_low = settings.mpp_low
            mp_missing = settings.mp_missing
            full_only = settings.full_only
            min_charge_seconds = settings.min_charge_seconds
        end

        if (in_town()) then return end -- Don't spam sublimation in town, especially moghouses
        if (player.vitals.mpp < mpp_low or (player.vitals.max_mp - player.vitals.mp) > mp_missing) then
            if (buffs[188] and recasts[234] == 0) then
                if (settings.verbose) then
                    windower.add_to_chat(207, _addon.name..": Sublimation for MP - Full")
                end
                windower.send_command('input /ja "Sublimation" <me>')
                return
            elseif (buffs[187] and not full_only and (charge_time + min_charge_seconds < time) and recasts[234] == 0) then
                if (settings.verbose) then
                    windower.add_to_chat(207, _addon.name..": Sublimation for MP - Not Full")
                end
                windower.send_command('input /ja "Sublimation" <me>')
                return
            end
        end
        if ((not buffs[187] and not buffs[188]) and (not recasts[234] or recasts[234] == 0)) then
            if (settings.verbose) then
                windower.add_to_chat(207, _addon.name..": Sublimation - Up")
            end
            charge_time = time
            windower.send_command('input /ja "Sublimation" <me>')
            return
        end
    end
end)

windower.register_event('load', 'login', 'job change', reset)
windower.register_event('logout', stop)
windower.register_event('zone change', function()
    if (settings.disable_on_zone) then
        stop()
    end
    paused = zone_pause
end)

windower.register_event('addon command', function(...)
    local cmd = ''
    local args = T{}
    if (#arg > 0) then
        args = T(arg)
        cmd = args[1]
        args:remove(1)
    end

    if (cmd == '') then
        active = not active
        windower.add_to_chat(207, _addon.name..": "..(active and "Starting" or "Stopping"))
    elseif (cmd == 'start' or cmd == 'go' or cmd == 'on') then
        start()
        windower.add_to_chat(207, _addon.name..": "..(active and "Starting" or "Stopping"))
    elseif (cmd == 'stop' or cmd == 'off') then
        stop()
        windower.add_to_chat(207, _addon.name..": "..(active and "Starting" or "Stopping"))
    elseif (cmd == 'save') then
        settings:save(player.name)
        windower.add_to_chat(207, _addon.name..": Saving settings for "..main_job)
    elseif (cmd == 'help' or cmd == 'h') then
        show_help()
    elseif (cmd == 'show' or cmd == 'status') then
        show_status()
    elseif (cmd == 'mpp') then
        windower.add_to_chat(207, #args.." - "..args[1])
        if (#args > 0 and tonumber(args[1])) then
            settings[main_job].mpp_low = tonumber(args[1])
        end
        if (settings.verbose) then
            windower.add_to_chat(207, _addon.name..": Sublimate below "..settings[main_job].mpp_low.."% MP")
        end
    elseif (cmd == 'missing' or cmd == 'miss') then
        if (#args > 0 and tonumber(args[1])) then
            settings[main_job].mp_missing = tonumber(args[1])
        end
        if (settings.verbose) then
            windower.add_to_chat(207, _addon.name..": Sublimate if "..settings[main_job].mp_missing.." MP missing")
        end
    elseif (cmd == 'full') then
        if (#args > 0) then
            if (args[1] == 'true') then
                settings[main_job].full_only = true
            elseif (args[1] == 'false') then
                settings[main_job].full_only = false
            else
                settings[main_job].full_only = not settings[main_job].full_only
            end
        end
        if (settings.verbose) then
            windower.add_to_chat(207, _addon.name..": Sublimate if Full Only? "..(settings[main_job].full_only and "Yes" or "No"))
        end
    elseif (cmd == 'charge') then
        if (#args > 0 and tonumber(args[1])) then
            settings[main_job].min_charge_seconds = tonumber(args[1])
        end
        if (settings.verbose) then
            windower.add_to_chat(207, _addon.name..": Minimum charge time set to "..settings[main_job].min_charge_seconds.." seconds")
        end
	elseif (cmd == 'zone' or cmd == 'z') then
		settings.disable_on_zone = not settings.disable_on_zone
		windower.add_to_chat(207, "Sublimator will be "..(settings.disable_on_zone and 'enabled' or 'disabled').." when zoning.")
    elseif (cmd == 'verbose' or cmd == 'v') then
        if (#args > 0) then
            if (args[1] == 'true' or args[1] == 'on') then
                settings.verbose = true
            elseif (args[1] == 'false' or args[1] == 'off') then
                settings.verbose = false
            end
        else
            settings.verbose = not settings.verbose
        end
        windower.add_to_chat(207, _addon.name..": Verbose output "..(settings[main_job].verbose and "On" or "Off"))
    end
end)
