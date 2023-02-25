_addon.name = 'FuckOff'
_addon.version = '0.21'
_addon.author = 'Chiaia (Asura)'
_addon.commands = {'fuckoff','fo'} --Won't do anything atm.

require('luau')
packets = require('packets')

local block_skillup = true

local black_listed_users = T{'TotallyABotOne111111','TotallyABotTwo222222','TotallyABotThree333333',} -- Want to block all messages from X user then added there name(s) here.
	
-- I could do a general digit check on JP instead of set 500/2100 values but atm I feel it's not needed. Will see if they change thier tactics.
-- If you want to learn more about "Magical Characters" or Patterns in Lua: https://riptutorial.com/lua/example/20315/lua-pattern-matching
local black_listed_words = T{string.char(0x81,0x69),string.char(0x81,0x99),string.char(0x81,0x9A),'1%-99','Job Points.*2100','Job Points.*500','Job Points.*4m','JP.*2100','JP.*500','Capacity Points.*2100','Capacity Points.*500','CPS*.*2100','CPS*.*500','ｆｆｘｉｓｈｏｐ','Jinpu 99999','Jinpu99999','This is IGXE','Clear Mind*.*15mins rdy start','Reisenjima*.*Helms*.*T4*.*Buy','Aeonic Weapon*.*3zone*.*Buy','Tumult Curator*.*Kill','Aeonic Weapon*.*Mind','Aeonic Weapon*.*Buy','Selling Aeonic','Empy Weapons Abyssea','50 50 75'} -- First two are '☆' and '★' symbols.

local black_listed_skill_pages = T{'6147', '6148', '6149', '6150', '6151', '6152', '6153', '6154', '6155', '6156', '6157', '6158', '6159', '6160', '6161', '6162', '6163', '6164', '6165', '6166', '6167', '6168', '6169', '6170', '6171', '6172', '6173', '6174', '6175', '6176', '6177', '6178', '6179', '6180', '6181', '6182', '6183', '6184', '6185',}

windower.register_event('incoming chunk', function(id,data)
    if id == 0x017 then -- 0x017 Is incoming chat.
        local chat = packets.parse('incoming', data)
        local cleaned = windower.convert_auto_trans(chat['Message']):lower()

		if black_listed_users:contains(chat['Sender Name']) then -- Blocks any message from X user in any chat mode.
			return true
		elseif (chat['Mode'] == 3 or chat['Mode'] == 1 or chat['Mode'] == 26) then -- RMT checks in tell, shouts, and yells. Years ago they use to use tells to be more stealthy about gil selling.
			for k,v in ipairs(black_listed_words) do
				if cleaned:match(v:lower()) then
					return true
				end
			end
        end
    elseif id == 0x028 and block_skillup then -- Action Message
        local data = packets.parse('incoming', data)
        if black_listed_skill_pages:contains(data['Target 1 Action 1 Param']) then
            return true
        end
	end
end)

--[[
Copyright (c) 2019-2021, Chiaia
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
    * Neither the name of FuckOff nor the
    names of its contributors may be used to endorse or promote products
    derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Chiaia BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]
