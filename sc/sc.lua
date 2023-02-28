--[[
Copyright (c) 2014, Matt McGinty
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
    * Neither the name of <addon name> nor the
    names of its contributors may be used to endorse or promote products
    derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL <your name> BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

_addon.name = 'sc'
_addon.version = '1.20'
_addon.author = 'Jinvoco/Jintawk (Carbuncle)'
_addon.command = 'sc'

require('actions')
require('tables')
require('sets')
res = require('resources')
require "data/skillchainData"
require "Chain"
require "List"
require "gui"

BLUE = 207
debug = false
chainSc = nil
chainMb = nil

-- set auto mode here
auto_mode = false

function log(msg)
    windower.add_to_chat(BLUE, 'SC -> ' .. msg)
end

function log_d(msg)
    if debug then
        log("[dbg] " .. msg)
    end
end

--[[
    Event: Addon loaded
]]
windower.register_event('load', function()
    log('Addon loaded')
end)

--[[
    Searches for weaponskills available to the player that
    can close a skillchain based on an opening weaponskill.
    Parameters:
    name:   Name of opening weaponskill
    scA:    Primary skillchain property of opening weaponskill
    scB:    Secondary skillchain property of opening weaponskill
    scB:    Tertiary skillchain property of opening weaponskill (rare)
]]
function GetClosers(name, scA, scB, scC)
    -- Get players available weaponskills
    local myWeaponskills = T(windower.ffxi.get_abilities()['weapon_skills'])

    -- Get data on all possible skillchain combinations
    local skillchains = GetSkillChains()

    -- Found a closer? False initially
    local found = false

    -- Highest level closer found
    local highestLvl = 1

    -- List of all weaponskills that can be used to form the highest level skillchain possible
    local closers = List.new()

    -- Check each level of skillchain is reverse order (3 > 2 > 1)
    -- Faster that way as we're only interested in the highest
    for lvl = #skillchains, 1, -1 do
        -- If we've already found closers of a higher level, break and record the level
        if found == true then
            highestLvl = lvl + 1
            break
        end
        
        -- Check each skillchain in this level
        for sc = 1, #skillchains[lvl] do
            local nextSc = skillchains[lvl][sc]

            -- If scA/B/C of used ws can open this sc 
            if scA == nextSc.open or scB == nextSc.open or scC == nextSc.open then
                -- Check each of my weapon skills
                for ws = 1, #myWeaponskills do
                    local myNextWs = res.weapon_skills[myWeaponskills[ws]]

                    -- If the scA of my weaponskill can close this lvl sc
                    if myNextWs.skillchain_a == nextSc.close then    
                        found = true                         
                        if closers.contains(closers, myNextWs.name) == false then
                            closers.push_back(closers, myNextWs.name)
                        end
                    -- If the scB of my weaponskill can close this lvl sc
                    elseif myNextWs.skillchain_b == nextSc.close then
                        found = true 
                        if closers.contains(closers, myNextWs.name) == false then
                            closers.push_back(closers, myNextWs.name)
                        end
                    -- If the scC of my weaponskill can close this lvl sc
                    elseif myNextWs.skillchain_c == nextSc.close then
                        found = true 
                        if closers.contains(closers, myNextWs.name) == false then
                            closers.push_back(closers, myNextWs.name)
                        end               
                    end
                end
            -- Else if we're looking at lvl3 which can be closed either way - check the reverse order
            elseif lvl == 3 and (scA == nextSc.close or scB == nextSc.close or scC == nextSc.close) then
                -- Check each of my weapon skills
                for ws = 1, #myWeaponskills do
                    local myNextWs = res.weapon_skills[myWeaponskills[ws]]

                    -- If the scA of my weaponskill can close this lvl sc
                    if myNextWs.skillchain_a == nextSc.open then     
                        found = true 
                        if closers.contains(closers, myNextWs.name) == false then
                            closers.push_back(closers, myNextWs.name)
                        end            
                    -- If the scB of my weaponskill can close this lvl sc
                    elseif myNextWs.skillchain_b == nextSc.open then
                        found = true 
                        if closers.contains(closers, mNyextWs.name) == false then
                            closers.push_back(closers, myNextWs.name)
                        end       
                     -- If the scC of my weaponskill can close this lvl sc
                    elseif myNextWs.skillchain_c == nextSc.open then
                        found = true 
                        if closers.contains(closers, mNyextWs.name) == false then
                            closers.push_back(closers, myNextWs.name)
                        end       
                    end
                end
            end
        end
    end

    -- Did not find any closers to this WS with players available WS - return
    if found == false then 
        log('No SC closers found...')
        return 
    end
    
    -- Print highest level skillchain available
    local printStr = 'Lvl ' .. highestLvl .. ' Closers >>'

    -- Print weaponskills that can close to the highest level skillchain available
    for i = closers.first, closers.last do
        printStr = printStr .. ' ['.. closers.items[i] ..']'

        if i < closers.last then
            printStr = printStr .. ','
        end
    end

    log(printStr)

    chainSc = Chain.new({ printStr, os.time() + 6 })
end

--[[
    Fires when an action event is received from the game.
    Checks if the action is a valid weaponskill performed by
    another player targeting the same mob as the user. If 
    checks are passed closing weaponskills are then searched for.
    Parameters:
    action:   Action received
]]
windower.register_event('action', function(act)
    if type(act) ~= 'table' then return end

    log_d('action ' .. act.category)

    if act == nil then 
        log_d('act is nil! ')
        return 
    end

    -- Continue only if action is a weaponskill
    -- 3 = WS
    -- 11 = Monster WS (or Trusts)
    if act.category == 3 or act.category == 11 then        

        -- Magic burst detection
        if act.targets[1].actions[1] ~= nil then            
            local magicBurstId = act.targets[1].actions[1].add_effect_message

            log_d("magicBurstId " .. magicBurstId)

            if magicBurstId ~= nil then
                log_d("magicBurstId NOT NIL")

                local magicBursts = GetMagicBursts()

                if magicBursts[magicBurstId] ~= nil then
                    -- Magic burst successfully detected - report to player
                    log("" .. magicBursts[magicBurstId].name .. " Magic Burst! >> Burst now with: " .. magicBursts[magicBurstId].report)

                    chainMb = Chain.new({ magicBursts[magicBurstId].report, os.time() + 8 })    
                    
                    if auto_mode and magicBursts[magicBurstId].auto ~= nil then
                        log("Autocasting magic burst!")
                        windower.send_command("input /ma \"".. magicBursts[magicBurstId].auto .. "\" <t>")
                    end
                end
            end
        end

        log_d('ws !')
        local currentMob = windower.ffxi.get_mob_by_target('t') or nil
        local currentMobID = 0

        -- If no current mob then do nothing as we're not interested in others
        -- Otherwise record the ID of the mob we're fighting
        if currentMob == nil then 
            return
        else
            currentMobID = currentMob.id
        end

        log_d('current mob ok')

        -- If weaponskill came from the target, we can't chain - return    
        if act.actor_id == currentMobID then return end
        
        -- If weaponskill was performed on a mob we are not engaged with - return
        if act.targets[1].id ~= currentMobID then return end    
        
        -- Get ID of the weaponskill used
        --local wsID = act.targets[1].actions[1].param

        --log_d('ws valid -> ' .. wsID)
        log_d('ws param -> ' .. act.param)

        if act.param < #res.weapon_skills then
            log_d('ws valid IN IF -> ' .. act.param)

            -- Get the weaponskill from ID            
            local ws = res.weapon_skills[act.param]            

            -- Return if something went wrong getting the weaponskill
            if ws == nil then 
                log_d('ws -> NIL ')
                return 
            end

            -- Safely record the name and skillchain properties of the weaponskill
            local wsName = ws.en or '?'
            local wsScA = ws.skillchain_a or ''

            log_d('wsName -> ' .. wsName)
            log_d('wsScA -> ' .. wsScA)

            -- If weaponskill has no skillchain properties - return
            if wsScA == '' then
                return
            end

            local wsScB = ws.skillchain_b or ''
            local wsScC = ws.skillchain_c or ''

            -- Print info about the opening weaponskill
            local printStr = wsName .. ' >> [' .. wsScA .. ']'

            if wsScB ~= "" then
                if wsScC == "" then
                    printStr = printStr .. ', [' .. wsScB ..']'
                else
                    printStr = printStr .. ', [' .. wsScB .. '], [' .. wsScC .. ']'
                end
            end

            log(printStr)

            log_d('calling GetClosers')

            -- Go and find any weaponskills the player has that can close to create a skillchain
            GetClosers(wsName, wsScA, wsScB, wsScC)
        end
    end    
end)

windower.register_event('load', function()
	UpdateGUI(chains)
end)

windower.register_event('prerender',function ()
    if chainSc == nil and chainMb == nil then return end

    if chainSc ~= nil then
        local timeRemainingSc = chainSc.expiry - os.time()

        if timeRemainingSc < 0 then
            chainSc = nil
        end
    end

    if chainMb ~= nil then
        local timeRemainingMb = chainMb.expiry - os.time()

        if timeRemainingMb < 0 then
            chainMb = nil
        end
    end

    UpdateGUI(chainSc, chainMb)
end)