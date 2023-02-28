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

_addon.name = 'ws'
_addon.version = '1.00'
_addon.author = 'Jintawk/Jinvoco (Carbuncle)'
_addon.command = 'ws'

require('actions')
require('tables')
require('sets')
res = require('resources')

engaged = false

windower.register_event('addon command', function()

end())

windower.register_event('status change', function(new, old)
    if new == 1 then
        engaged = true        
    else
        engaged = false
    end
end)

windower.register_event('time change', function(new, old)
	--windower.add_to_chat(207, "WS")
	--windower.add_to_chat(207, "TP = " .. windower.ffxi.get_player().vitals.tp)
	if engaged == true and windower.ffxi.get_player().vitals.tp >= 1000 then
        local mobHP = windower.ffxi.get_mob_by_target('t').hpp or 0
        if mobHP < 100 and mobHP > 15 then
            windower.send_command("input /ws \"Red Lotus Blade\" <t>")
        end
	end
end)
