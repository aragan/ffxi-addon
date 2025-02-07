--[[Copyright © 2022
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL KENSHI BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.]]

_addon.name = 'RollKeeper'
_addon.author = 'Kosumi'
_addon.version = '1.0'
_addon.commands = {'rollkeeper', 'rk'}

require('luau')
texts = require('texts')

-- Config
defaults = {}
defaults.display = {}
defaults.display.pos = {}
defaults.display.pos.x = 0
defaults.display.pos.y = 0
defaults.display.bg = {}
defaults.display.bg.red = 0
defaults.display.bg.green = 0
defaults.display.bg.blue = 0
defaults.display.bg.alpha = 102
defaults.display.bg.visible = true
defaults.padding = 10
defaults.flags = {}
defaults.flags.bold = true
defaults.text = {}
defaults.text.font = 'Consolas'
defaults.text.red = 255
defaults.text.green = 255
defaults.text.blue = 255
defaults.text.alpha = 255
defaults.text.size = 12

settings = config.load(defaults)
box = texts.new('${current_string}', settings)

local status = true
local rolls = { }
local duplicate_rolls = { }
local aliance_members = { }
local aliance_rolls_only = true

windower.register_event('load', function()

end)

windower.register_event('incoming text', function(_, txt, _, _, blocked)
    if blocked or txt == '' then
        return
    end

    if not status then return end
    
    if string.find(txt:strip_format(), "Dice roll!") then
        update_aliance()
        local string = txt:strip_format()
        local words = { }
        for word in string:gmatch("%w+") do table.insert(words, word) end

        local player = words[3]
        local roll = words[5]:sub(1, -1)
        
        local valid_player = false
        if aliance_rolls_only then
            for _, v in pairs(aliance_members) do
                if v == player then
                    valid_player = true
                end
            end
        end

        if not valid_player then return end

        if TableLength(rolls) == 0 then
            table.insert(rolls, {player, tonumber(roll)})
        else
            local duplicate = false
            for i, v in ipairs(rolls) do
                local name = v[1]
                local roll = v[2]
                if name == player then duplicate = true end
            end
            
            if duplicate == false then
                table.insert(rolls, {player, tonumber(roll)})
            else
                table.insert(duplicate_rolls, {player, tonumber(roll)})
            end
        end
    end
end)


windower.register_event('prerender', function()
    if status then update_aliance() end
    box:show()
    local current_string = 'Roll Keeper   //rk help\n'

    local status_str = ''
    if status then 
        status_str = '\\cs(0,255,0)ON\\cr'
    else
        status_str = '\\cs(255,0,0)OFF\\cr'
    end

    current_string = current_string..'Roll tracking is '..status_str..'\n'

    table.sort(rolls, function(k1, k2) return k1[2] > k2[2] end)

    local count = 0
    for i, v in ipairs(rolls) do
        local name = v[1]
        local roll = v[2]
        count = count + 1

        current_string = (current_string..('\n%-3s%-15s%s'):format(count, name, roll))
    end

    if status then 
        current_string = (current_string..'\n\n\\cs(190,190,190,10)No Roll\\cr') 
        for _, v in ipairs(aliance_members) do
            local name = v   
            if not locate(rolls, name) then current_string = (current_string..('\n\\cs(190,190,190,10)%-3s%-15s\\cr'):format('  ', name)) end
        end
    end

    if TableLength(duplicate_rolls) > 0 then
        current_string = (current_string..'\n\n\\cs(255,0,0)Duplicate Rolls\\cr')

        for i, v in ipairs(duplicate_rolls) do
            local name = v[1]
            local roll = v[2]

            current_string = (current_string..('\n\\cs(255,0,0)%-15s%s\\cr'):format(name, roll))
        end
    end

    box.current_string = current_string
end)

windower.register_event('logout', function()
    items = T{}
end)

function TableLength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end
  
function locate(table, value)
    for i, v in ipairs(table) do
        local name = v[1]
        if name:lower() == value:lower() then return true end
    end
    return false
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function update_aliance()
    local party_slots = L{ 'p0','p1','p2','p3','p4','p5',
        'a10','a11','a12','a13','a14','a15',
        'a20','a21','a22','a23','a24','a25' }
    local party = windower.ffxi.get_party()
    aliance_members = { }

    local count = 1
    for slot in party_slots:it() do
        local member = party[slot]
        if member then
            aliance_members[count] = member.name
            count = count + 1
        end
    end
end

function remove_roll(name)
    local count = 1
    for _, v in ipairs(rolls) do
        if v[1]:lower() == name:lower() then
            table.remove(rolls, count)
            log(name..'('..v[2]..') Removed')
        end
        count = count + 1
    end
end

windower.register_event('addon command', function(command, ...)
    cmd = command and command:lower()
    local arg = {...}

    if cmd == 'add' then
        local name = firstToUpper(arg[1]:lower())
        if TableLength(arg) > 1 then
            if tonumber(arg[2]) then
                if locate(rolls, name) then
                    remove_roll(name)
                end
                table.insert(rolls, {name, tonumber(arg[2])})
                log(name..'('..arg[2]..') Added')
            end
        end
    elseif cmd =='remove' then
        if TableLength(arg) > 0 then
            remove_roll(arg[1])
        end
    elseif cmd == 'reset' then
        status = true
        rolls = { }
        duplicate_rolls = { }
        aliance_members = { }
    elseif cmd == 'dupes' or cmd == 'dupe' then
        duplicate_rolls = { }
    elseif cmd == 'on' then
        status = true
        update_aliance()
    elseif cmd == 'off' then
        status = false
    elseif cmd == 'help' then
        log("")
        log("RollKepper - Kosumi@Asura")
        log("")
        log("//rk add {name} {roll} - Adds the player name and roll to the roll list")
        log("//rk remove {name} - Removes player roll from list")
        log("//rk dupe - Clears the duplicate roll list")
        log("//rk reset - Clears all data")
        log("//rk help - Displays help")
    end
end)
