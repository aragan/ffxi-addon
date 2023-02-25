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

require('logger')
require('texts')
require('tables')
local settings = require('settings')

commands = {}

commands.actions = {
    add='add',
    remove='remove',    
    show='show',
    hide='hide',    
    list='list',
    help='help',    
}
commands.filter_types = {
    p='p',
    s='s'
}

--Display a help section
function commands.help()
    log("%s v.%s":format(_addon.name, _addon.version))  
    log('Usage: //cf (add | remove) (p | s) player_or_string')  
    log('List Filters: //cf list')      
    log('Show or Hide Messages: //cf show | hide') 
    log('Show or Hide will highlight chat messages that match filters instead of blocking them.')
    log('====================') 
    log('Example 1 - Add Player: //cf add p Bob')
    log('Example 2 - Add String: //cf add s "Lady Lilith"') 
end

--Display error based on invalid selection
function commands.invalid_option(option)
    warning('\'%s\' is not a valid option. See //cf help': format(option))
end

--Show Mode
function commands.show()
    settings.show = true
    notice("Filtered messages will be shown, and not blocked.") 
    settings:save('all')
end

--Hide Mode
function commands.hide()
    settings.show = false
    notice("Filtered messages will be blocked (default).")   
    settings:save('all')
end

--Display the list of players and strings
function commands.list()
    log("Blocked Players":color(250))
    for i, p in pairs(settings.filters.players) do  
      log(' \'' .. p .. '\'')
    end
    
    log("Blocked Strings":color(250))
    for i, s in pairs(settings.filters.strings) do  
      log(' \'' .. s .. '\'')
    end 
end

--Add a player to the list
function commands.add_player(player)
    local cleaned_key = windower.convert_auto_trans(player):lower():gsub('%W','')
    local cleaned_value = windower.convert_auto_trans(player):lower()
    
    if settings.filters.players[cleaned_key] == nil then
        settings.filters.players[cleaned_key] = cleaned_value
        settings:save('all')
    end

    notice("The player '%s' is blocked.":format(cleaned_value):color(50))
end

--Remove a player from the list
function commands.remove_player(player)
    local cleaned_key = windower.convert_auto_trans(player):lower():gsub('%W','')
    local cleaned_value = windower.convert_auto_trans(player):lower()
    
    settings.filters.players[cleaned_key] = nil
    settings:save('all')

    notice("The player '%s' is unblocked.":format(cleaned_value):color(50)) 
end

--Add a string to the list
function commands.add_string(str)
    local cleaned_key = windower.convert_auto_trans(str):lower():gsub('%W','')
    local cleaned_value = windower.convert_auto_trans(str):lower()
    
    if settings.filters.strings[cleaned_key] == nil then
        settings.filters.strings[cleaned_key] = cleaned_value
        settings:save('all')
    end

    notice("The string '%s' is blocked.":format(cleaned_value):color(50))
end

--Remove a string from the list
function commands.remove_string(str)
    local cleaned_key = windower.convert_auto_trans(str):lower():gsub('%W','')
    local cleaned_value = windower.convert_auto_trans(str):lower()
        
    settings.filters.strings[cleaned_key] = nil
    settings:save('all')

    notice("The string '%s' is unblocked.":format(cleaned_value):color(50)) 
end

return commands