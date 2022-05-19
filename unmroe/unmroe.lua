-- Copyright © 2020, Zetonegi
-- All rights reserved.

-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:

    -- * Redistributions of source code must retain the above copyright
      -- notice, this list of conditions and the following disclaimer.
    -- * Redistributions in binary form must reproduce the above copyright
      -- notice, this list of conditions and the following disclaimer in the
      -- documentation and/or other materials provided with the distribution.
    -- * Neither the name of UNM nor the
      -- names of its contributors may be used to endorse or promote products
      -- derived from this software without specific prior written permission.

-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
-- ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-- WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
-- DISCLAIMED. IN NO EVENT SHALL Zetonegi BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-- SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

-- Thanks to Cair for writing the original ROE addon which this is both based on and built off of.

_addon = {}
_addon.name = 'unmroe'
_addon.version = '1.0.2'
_addon.author = "Zetonegi"
_addon.commands = {'unmroe', 'uroe'}

packets = require('packets')
config = require('config')
require('logger')

_roe = T{
    active = T{},
    complete = T{},    
    max_count = 30,
}

--TODO Transfer to settings file?
_unms = {
    ["hugemaw harold"] = {817},
    ["bounding belinda"] = {818},
    ["prickly pitriv"] = {819},
    ["ironhorn baldurno"] = {820},
    ["sleepy mabel"] = {821},
    ["valkurm imperator"] = {822},
    ["serpopard ninlil"] = {823},
    ["abyssdiver"] = {824},
    ["intuila"] = {825},
    ["emperor arthro"] = {826},
    ["orcfultrap"] = {827},
    ["lumber jill"] = {828},
    ["joyous green"] = {829},
    ["strix"] = {830},
    ["warblade beak"] = {831},
    ["arke"] = {832},
    ["largantua"] = {833},
    ["beist"] = {834},
    ["jester malatrix"] = {835},
    ["cactrot veloz"] = {836},
    ["woodland mender"] = {837},
    ["sybaritic samantha"] = {854},
    ["keeper of heiligtum"] = {855},
    ["douma weapon"] = {856},
    ["king uropygid"] = {857},
    ["vedrfolnir"] = {858},
    ["immanibugard"] = {859},
    ["tiyanak"] = {860},
    ["muut"] = {861},
    ["camahueto"] = {862},
    ["voso"] = {863},
    ["mephitas"] = {864},
    ["coca"] = {865},
    ["ayapec"] = {866},
    ["specter worm"] = {867},
    ["azrael"] = {868},
    ["borealis shadow"] = {869},
    ["garbage gel"] = {891},
    ["bakunawa"] = {892},
    ["azure-toothed clawberry"] = {893},
    ["vermillion fishfly"] = {894},
    ["volatile cluster"] = {895},
    ["grand grenade"] = {897},
    ["centurio xx-i"] = {898},
    ["kubool ja's mhuufya"] = {896},
    ["vidmapire"] = {899},
    ["sovereign behemoth"] = {914},
    ["hidhaegg"] = {915},
    ["tolba"] = {916},
    ["carousing celine"] = {918},
    ["glazemane"] = {919},
    ["bambrox"] = {920},
    ["thu'ban"] = {921},
    ["sarama"] = {922},
    ["shedu"] = {923},
    ["tumult curator"] = {924},
    ["east ronfaure"] = {817},
    ["south gustaberg"] = {818},
    ["east sarutabaruta"] = {819},
    ["la theine plateau"] = {820},
    ["konschtat highlands"] = {821},
    ["valkurm dunes"] = {822},
    ["tahrongi canyon"] = {823},
    ["buburimu peninsula"] = {824},
    ["bibiki bay"] = {825},
    ["jugner forest"] = {826},
    ["carpenter's landing"] = {827},
    ["batallia downs"] = {828},
    ["pashhow marshlands"] = {829},
    ["rolanberry fields"] = {830},
    ["meriphaataud mountains"] = {831},
    ["sauromugue champaign"] = {832},
    ["beaucedine glacier"] = {833},
    ["xarcabard"] = {834},
    ["qufim island"] = {835},
    ["eastern altepa desert"] = {836},
    ["yhoator jungle"] = {837},
    ["yuhtunga jungle"] = {854},
    ["sanctuary of zi'tah"] = {855},
    ["ro'maeve"] = {856},
    ["western altepa desert"] = {857},
    ["cape teriggan"] = {858,919},
    ["lufaise meadows"] = {859,894},
    ["misareaux coast"] = {860,895},
    ["attohwa chasm"] = {861},
    ["uleguerand range"] = {862},
    ["labyrinth of onzozo"] = {863},
    ["garlaige citadel"] = {864},
    ["ifrit's cauldron"] = {865},
    ["the boyahda tree"] = {866,915},
    ["kuftal tunnel"] = {867},
    ["den of rancor"] = {868},
    ["borealis"] = {869},
    ["bostaunieux oubliette"] = {891},
    ["sea serpent grotto"] = {892},
    ["temple of uggalepih"] = {893},
    ["mount zhayolm"] = {897,922},
    ["quicksand caves"] = {898},
    ["wajaom woodlands"] = {896,921},
    ["alzadaal undersea ruins"] = {899},
    ["behemoth's dominion"] = {914},
    ["valley of sorrows"] = {916},
    ["fei'yin"] = {918},
    ["gustav tunnel"] = {920},
    ["caedarva mire"] = {923},
    ["aydeewa subterrane"] = {924},
}

_idToUnm = {
    [817] = "Hugemaw Harold",
    [818] = "Bounding Belinda",
    [819] = "Prickly Pitriv",
    [820] = "Ironhorn Baldurno",
    [821] = "Sleepy Mabel",
    [822] = "Valkurm Imperator",
    [823] = "Serpopard Ninlil",
    [824] = "Abyssdiver",
    [825] = "Intuila",
    [826] = "Emperor Arthro",
    [827] = "Orcfultrap",
    [828] = "Lumber Jill",
    [829] = "Joyous Green",
    [830] = "Strix",
    [831] = "Warblade Beak",
    [832] = "Arke",
    [833] = "Largantua",
    [834] = "Beist",
    [835] = "Jester Malatrix",
    [836] = "Cactrot Veloz",
    [837] = "Woodland Mender",
    [854] = "Sybaritic Samantha",
    [855] = "Keeper of Heiligtum",
    [856] = "Douma Weapon",
    [857] = "King Uropygid",
    [858] = "Vedrfolnir",
    [859] = "Immanibugard",
    [860] = "Tiyanak",
    [861] = "Muut",
    [862] = "Camahueto",
    [863] = "Voso",
    [864] = "Mephitas",
    [865] = "Coca",
    [866] = "Ayapec",
    [867] = "Specter Worm",
    [868] = "Azrael",
    [869] = "borealis shadow",
    [891] = "garbage gel",
    [892] = "bakunawa",
    [893] = "Azure-toothed Clawberry",
    [894] = "Vermillion Fishfly",
    [895] = "Volatile Cluster",
    [897] = "Grand Grenade",
    [898] = "Centurio XX-I",
    [896] = "Kubool Ja's Mhuufya",
    [899] = "vidmapire",
    [914] = "Sovereign Behemoth",
    [915] = "Hidhaegg",
    [916] = "Tolba",
    [918] = "Carousing Celine",
    [919] = "Glazemane",
    [920] = "Bambrox",
    [921] = "Thu'ban",
    [922] = "Sarama",
    [923] = "Shedu",
    [924] = "Tumult Curator",
}

local function tableLength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end


local function notEnoughRoeSpace(ids)
    activeNum = tableLength(_roe.active)
    idNum = tableLength(ids)
    count = activeNum+idNum

    --If we're already under max_count we're good
    if count <= _roe.max_count then return false end
    
    for k in pairs(ids) do
        id = ids[k]
        if _roe.active[id] ~= nil then
            count = count -1
        end
    end
    return count > _roe.max_count
end

local function cancelRoe(key)

    ids = _unms[key]
    for k in pairs(ids) do
        id = tonumber(ids[k])

        if id and _roe.active[id] then 

            local p = packets.new('outgoing', 0x10d, {['RoE Quest'] = id })
            packets.inject(p)
            coroutine.sleep(1)
        end
    end
end

local function acceptRoe(key)
    ids = _unms[key]

    if notEnoughRoeSpace(ids) then return
        error('`set` : Not enough space to set all objectives.')
    end

    for k in pairs(ids) do
        id = tonumber(ids[k])
        
        if not id then 
            --notice('not id' .. id)
            return
        end
        if _roe.active[id] then 
            --notice('already set')
            return
        end


        local p = packets.new('outgoing', 0x10c, {['RoE Quest'] = id })
        packets.inject(p)
        coroutine.sleep(1)
    end
end

local function set(name)
    if not type(name) == "string" then
        error('`set` : specify a UNM or zone')
        return
    end

    nameLower = windower.convert_auto_trans(name):lower()

    if _unms[nameLower] then
        acceptRoe(nameLower)
    else
        error('`set` : UNM or Zone not found')
    end


end

local function unset(name)
    if not type(name) == "string" then
        error('`unset` : specify a UNM or zone')
        return
    end

    nameLower = windower.convert_auto_trans(name):lower()

    if _unms[nameLower] then
        cancelRoe(nameLower)
    else
        error('`unset` : UNM or Zone not found')
    end


end

local function help()
    notice([[UNMROE - Command List:
    1. help - Displays this help menu.
    2. set <NM Name/Area Name> : attempts to set the ROE objective(s) for the given NM or area
        - Names are not case sensitive but are punctuation sensitive(Thu'ban)
        - Areas can use auto-translate
        - Adds all ROE objects for the area if there are multiple NMs in that area.
    3. unset <NM Name/Area Name> : attempts to remove the ROE objective(s) for the given NM or area
        - Names are not case sensitive but are punctuation sensitive(Thu'ban)
        - Areas can use auto-translate
        - Removes all ROE objects for the area if there are multiple NMs in that area.]])
end

local cmd_handlers = {
    set = set,
    unset = unset,
    help = help,
}


local function addonCommandHandler(command,...)
    local cmd  = command and command:lower() or "help"
    if cmd_handlers[cmd] then
        args = T{...}
        name = table.concat(args," ")
        cmd_handlers[cmd](name)
    else
        error('unknown command `%s`':format(cmd or ''))
    end

end

local function incChunkHandler(id,data)

    if id == 0x111 then
        _roe.active:clear()
        for i = 1, _roe.max_count do
            local offset = 5 + ((i - 1) * 4)
            local id,progress = data:unpack('b12b20', offset)
            if id > 0 then
                _roe.active[id] = progress
            end
        end
    elseif id == 0x112 then
        local complete = T{data:unpack('b1':rep(1024),4)}:key_map(
            function(k) 
                return (k + 1024*data:unpack('H', 133) - 1) 
            end):map(
            function(v) 
                return (v == 1)
            end)
        _roe.complete:update(complete)
    end
end

local function loadHandler()    
    local last_roe = windower.packets.last_incoming(0x111)
    if last_roe then incChunkHandler(0x111,last_roe) end

end

windower.register_event('incoming chunk', incChunkHandler)
windower.register_event('addon command', addonCommandHandler)
windower.register_event('load', loadHandler)
