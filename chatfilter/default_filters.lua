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

require('tables')

local default_filters = T{}

--Will hide messages with special characters like stars.
--See https://riptutorial.com/lua/example/20315/lua-pattern-matching
default_filters.special_characters = T{
    string.char(0x81,0x99), --'★'
    string.char(0x81,0x9A), --'☆'
}

--Will hide use of skill books.
default_filters.skill_pages = T{
    '6147',  --
    '6148',  -- 
    '6149',  -- 
    '6150',  -- 
    '6151',  -- 
    '6152',  -- 
    '6153',  -- 
    '6154',  -- 
    '6155',  -- 
    '6156',  -- 
    '6157',  -- 
    '6158',  -- 
    '6159',  -- 
    '6160',  -- 
    '6161',  --Throwing
    '6162',  -- 
    '6163',  -- 
    '6164',  -- 
    '6165',  -- 
    '6166',  -- 
    '6167',  -- 
    '6168',  -- 
    '6169',  -- 
    '6170',  -- 
    '6171',  -- 
    '6172',  -- 
    '6173',  -- 
    '6174',  -- 
    '6175',  -- 
    '6176',  -- 
    '6177',  -- 
    '6178',  -- 
    '6179',  -- 
    '6180',  -- 
    '6181',  -- 
    '6182',  -- 
    '6183',  -- 
    '6184',  -- 
    '6185',  --
}

--Will hide use of items like silt pouches etc.
default_filters.items = T{
    '6391',  --Silt Pouch
}

return default_filters