--Copyright © 2021, Zubis
--All rights reserved.

--Redistribution and use in source and binary forms, with or without
--modification, are permitted provided that the following conditions are met:

--    * Redistributions of source code must retain the above copyright
--      notice, this list of conditions and the following disclaimer.
--    * Redistributions in binary form must reproduce the above copyright
--      notice, this list of conditions and the following disclaimer in the
--      documentation and/or other materials provided with the distribution.
--    * Neither the name of ChatFilter nor the
--      names of its contributors may be used to endorse or promote products
--      derived from this software without specific prior written permission.

--THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
--ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
--WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
--DISCLAIMED. IN NO EVENT SHALL <your name> BE LIABLE FOR ANY
--DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
--LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
--ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
--(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
--SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

require('luau')
require('tables')
require('logger')
local packets = require('packets')
local texts = require('texts')
local commands = require('commands')
local settings = require('settings')
local default_filters = require('default_filters')

--Register the base //cf command
windower.register_event('addon command',function (...)
    local command = {...}
    
    local action = command[1]
    local filter_type = command[2]
    local filter_text = command[3]
    
    --If no action (//cf), stop.
    if not action then 
        return 
    end
    
    --If action is not a valid action (//cf x), stop.
    if commands.actions[action] == nil then 
        commands.invalid_option(action)
        return 
    end
    
    --If action is help, stop.
    if action == 'help' then 
        commands.help()
        return  
    end 
    
    --If action is show, then show.
    if action == 'show' then 
        commands.show() 
        return 
    end
    
    --If action is hide, then hide.
    if action == 'hide' then 
        commands.hide() 
        return 
    end 
    
    --If action is list, then display the list of players and phrases.
    if action == 'list' then 
        commands.list() 
        return 
    end
    
    --If no filter type (//cf add), stop.
    if not filter_type then 
        commands.invalid_option('') 
        return 
    end

    --If filter type is not a valid filter type (//cf add x), stop.
    if commands.filter_types[filter_type] == nil then 
        commands.invalid_option(filter_type)    
        return 
    end
    
    --If no filter text(//cf add p), stop.
    if not filter_text then 
        commands.invalid_option('')
        return 
    end 
    
    -- --If the action was add, add the player or string.
    if action == 'add' then
        if filter_type == 'p' then
            commands.add_player(filter_text)
        elseif filter_type == 's' then
            commands.add_string(filter_text)
        end
        return      
    end
    
    --If the action was remove, remove the player or string.
    if action == 'remove' then
        if filter_type == 'p' then
            commands.remove_player(filter_text)
        elseif filter_type == 's' then
            commands.remove_string(filter_text)
        end
        return      
    end 
end)

--Register Incoming Chunks for chat parsing
windower.register_event('incoming chunk', function(id,data)
    if id == 0x017 then -- 0x017 - Chat.
        local chat = packets.parse('incoming', data)
        
        local player_cleaned_key = windower.convert_auto_trans(chat['Sender Name']):lower():gsub('%W','')
        
        --Filter Players
        if settings.filters.players[player_cleaned_key] ~= nil then
            if settings.show then
                windower.add_to_chat(160, "ChatFilter: Blocked Player %s. %s: %s":format(chat['Sender Name']:color(50), chat['Sender Name'], chat['Message']))                  
            end
            return true
        end
        
        --Apply Filters to Tells/Shouts/Yells only.
        if (chat['Mode'] == 3 or chat['Mode'] == 1 or chat['Mode'] == 26) then
            local message_cleaned_value = windower.convert_auto_trans(chat['Message']):lower()      
        
            --Filter Strings 
            for k,v in pairs(settings.filters.strings) do
                if string.find(message_cleaned_value, v:lower(), 1, true) then
                    if settings.show then            
                        windower.add_to_chat(160, "ChatFilter: Blocked String %s. %s: %s":format(v:color(50), chat['Sender Name'], chat['Message']))        
                    end
                    return true
                end
            end
            
            --Filter Special Characters
            for k,v in pairs(default_filters.special_characters) do
                if string.find(message_cleaned_value, v:lower(), 1, true) then
                    if settings.show then            
                        windower.add_to_chat(160, "ChatFilter: Blocked Default String %s. %s: %s":format(v:color(50), chat['Sender Name'], chat['Message']))       
                    end
                    return true
                end
            end         
        end
    end     
            
    if id == 0x028 then -- 0x028 - Action
        local data = packets.parse('incoming', data)
        
        --Filter Skill Ups      
        if default_filters.skill_pages:contains(tostring(data['Target 1 Action 1 Param'])) then 
            if settings.show then                 
                windower.add_to_chat(160, "ChatFilter: Blocked Skill Up.")         
            end      
            return true
        end 
        
        --Filter Items
        if default_filters.items:contains(tostring(data['Target 1 Action 1 Param'])) then 
            if settings.show then                 
                windower.add_to_chat(160, "ChatFilter: Blocked Item.")         
            end      
            return true
        end         
    end
end)
