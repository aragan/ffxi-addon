_addon.name = 'AutoSpamFilter'
_addon.version = '0.1'
_addon.commands = {'asf'}
_addon.author = 'Relisaa (Asura)'

require('luau')
require('pack')
require('lists')
require('tables')
require('strings')
texts = require('texts')
config = require('config')
packets = require('packets')

-- This is heurstic based spam filter

-- It doesn't care about words so much as the same repeated message over and over again
-- It does employ an initial spam word check though

-- Timestamp wise it doesn't matter

-- Bots for the most part spam the same message over and over again which can be detected roughly by 3 third message seen if the initial spam word filter fails
-- Humans seem to change their message every 2-5 shouts

-- Also provides a window that shows the current LFG stuff separated out from chat with last seen in seconds / minutes (also removed after 10m if not heard from again)

local function InsertPairWise(base, seps, output)
    for i,v in ipairs(base) do
        for i2, v2 in ipairs(seps) do
            local s1 = v..v2
            local s2 = v2..v
            table.insert(output, s1)
            table.insert(output, s2)
        end
    end
end

local function Insert(t1, t2)
    for i,v in ipairs(t2) do
        table.insert(t1, v)
    end
end

local islfgpositive = {'Looking for members', 'Can i have it', 'Team up', '%d/%d?', '%@%d/%d?', 'looking for', 'lfm', 'lfg', 'looking for group'}
local islfgfull = {"Our party's full"}
local islfggeneral = {'TANK', 'HEALER', 'healing', 'SUPPORT','DD','token farm'}
local islfgjobs = {'whm', 'brd', 'sch', 'remaBRD', 'ywhm', 'nsmn', 'smn', 'war', 'drg', 'rdm', 'cor', 'roll+%d', 'sam', 'dnc', 'pld', 'run', 'drk', 'bst', 'rng', 'nin', 'blu', 'pup', 'geo', 'mnk', 'blm', 'thf'}
local islfgjobsfullname = {'white mage', 'bard', 'scholar', 'summoner', 'warrior', 'dragoon', 'red mage', 'corsair', 'samurai', 'dancer', 'paladin', 'dark knight', 'ranger', 'ninja', 'blue mage', 'puppetmaster', 'monk', 'black mage', 'thief', 'beastmaster', 'geomancer', 'rune fencer'}
local islfgseperators = {'%s+', '/', ',', '-'}

local majorLFGTags = {}
local minorLFGTags = {}

InsertPairWise(islfggeneral, islfgseperators, majorLFGTags)
InsertPairWise(islfgjobs, islfgseperators, majorLFGTags)
InsertPairWise(islfgjobsfullname, islfgseperators, majorLFGTags)

Insert(minorLFGTags, islfgjobs)
Insert(minorLFGTags, islfgjobsfullname)

local default = {
    blacklist = {string.char(0x81,0x69),string.char(0x81,0x99),string.char(0x81,0x9A),'S H O P','CODE:','discount', 'Discount','Price','prices', 'gil','empy weapon','Shop','Weapon Shop','1%-99','Job Points.*2100','Job Points.*500','JP.*2100','JP.*500','Capacity Points.*2100','Capacity Points.*500','CPS*.*2100','CPS*.*500','ｆｆｘｉｓｈｏｐ','Jinpu 99999','Jinpu99999','This is IGXE','Clear Mind*.*15mins rdy start','Reisenjima*.*Helms*.*T4*.*Buy?','Aeonic Weapon*.*3zone*.*Buy','Aeonic Weapon*.*Mind','Aeonic Weapon*.*Buy','Selling Aeonic','Empy Weapons Abyssea','50 50 75','80 85 90','Buy?', '%d+%/%d+M', '%d+H%/%d?M', 'kill credit x%d.*%d+m.*/tell'}, -- First two are '☆' and '★' symbols.
    expiration = 60 * 7,
    minscore = 3,
    lfgscore = 1,
    maxscore = 255,
    stillspam = 0.9,
    active = true,
    lfgwindow = {
        pos = {
            x = 0,
            y = 0
        },
        bg = {
            red = 0,
            green = 0,
            blue = 0,
            alpha = 250,
            visible = true
        },
        text = {
            red = 255,
            green = 255,
            blue = 255,
            alpha = 255,
            font = "calibri",
            fonts = L{'calibri', 'arial'},
            size = 12,
            stroke = {
                width = 0,
                red = 255,
                green = 255,
                blue = 255,
                alpha = 255
            }
        },
        padding = 5,
        flags = {
            italic = false,
            bold = false,
            right = false,
            bottom = false,
        },
        shown = true
    }
}

local settings = config.load(default)
local lfg = {}
local filtered = {}
local max_update_time = 1
local last_update = os.time()
local user_events = nil

local function GetWords(s)
    local words = {}
    for word in s:gmatch("%w+") do table.insert(words, word) end
    return words
end

local function IsSpam(incoming)
    for i,v in ipairs(settings.blacklist) do
        if incoming:match(v:lower()) then
            return true
        end
    end

    return false
end

local function IsStillSpam(cwords, incoming)
    local iwords = GetWords(incoming)
    local totalCWords = #cwords;
    local totalIWords = #iwords
    local total = math.min(totalCWords, totalIWords)
    local match = 0

    for i = 1,total do
        local w1 = iwords[i]
        local w2 = cwords[i]
        if (w1 and w2 and w1 == w2) then
            match = match + 1
        end
    end

    return match / total >= settings.stillspam
end

local function IsLFGFull(incoming)
    for i,v in ipairs(islfgfull) do
        if incoming:match(v:lower()) then
            return true;
        end
    end

    return false;
end

local function IsLFGText(incoming)
    local score = 0
    local positive = 0

    for i,v in ipairs(majorLFGTags) do
        if incoming:match(v:lower()) then
            score = score + 1
        end
    end

    -- only try minor if score is still less
    if score < settings.lfgscore then
        for i,v in ipairs(minorLFGTags) do
            if incoming:match(v:lower()) then
                score = score + 0.5
            end
        end
    end

    for i,v in pairs(islfgpositive) do
        if incoming:match(v:lower()) then
            positive = positive + 1
        end
    end

    -- reason for positive check: so we don't get text that is just talking or referring to jobs in the sentence
    return score >= settings.lfgscore and positive >= 1
end

local function GetFormattedTime(time)
    local current = os.time()
    local diff = current - time

    if diff > 60 then
        return tostring(math.ceil(diff / 60)).." mins ago"
    else
        return tostring(diff).." secs ago"
    end
end

local function IsOldLFG(olfg)
    local current = os.time()
    local expire = olfg[3] + (settings.expiration * 0.5)
    return current >= expire
end

local function IsLFG(sender, cleaned)
    if (not settings.lfgwindow.shown) then
        return false
    end

    local previous = lfg[sender]

    if (IsLFGText(cleaned)) then
        if (not previous) then
            previous = {sender, cleaned, os.time()}
        end

        previous[3] = os.time()
        previous[2] = cleaned
        lfg[sender] = previous
        
        return true
    elseif (previous and IsLFGFull(cleaned)) then
        lfg[sender] = nil
    end

    return false
end

local function GetLFGText()
    local str = 'LFG/LFM Status:'
    for k,v in pairs(lfg) do
        local isOld = IsOldLFG(v)

        if (not isOld) then
            local sender = v[1]
            local message = v[2]
            local time = GetFormattedTime(v[3])
            str = str..'\n <%s> %s - %s':format(sender, message, time)
        else
            lfg[k] = nil
        end
    end
    return str
end

local lfg_status = texts.new(GetLFGText(), settings.lfgwindow, settings)

local function prerender()
    if (settings.lfgwindow.shown) then
        lfg_status:show()
    else
        lfg_status:hide()
    end

    if (not settings.active or not settings.lfgwindow.shown) then
        return
    end

    if (os.time() - last_update >= max_update_time) then
        last_update = os.time()
        lfg_status:text(GetLFGText())
    end
end

local function addon_command(...)
    local commands = {...}
    commands[1] = commands[1] and commands[1]:lower()

    if (not commands[1]) then
        return
    end

    if (commands[1] == 'active') then
        if (settings.active) then
            settings.active = false
        else
            settings.active = true
        end
    elseif (commands[1] == 'lfg') then
        if (settings.lfgwindow.shown) then
            settings.lfgwindow.shown = false
        else
            settings.lfgwindow.shown = true
        end
    elseif (commands[1] == 'save') then
        settings:save()
	elseif (commands[1] == 'reset') then
		lfg = {}
		filtered = {}
    end
end

local function incoming_chunk(id, data)
    if (not settings.active) then
        return
    end

    if id == 0x017 then -- 0x017 Is incoming chat.
        local chat = packets.parse('incoming', data)

        if (chat['Mode'] == 3 or chat['Mode'] == 1 or chat['Mode'] == 26) then
            local sender = chat['Sender Name']
            local cleaned = windower.convert_auto_trans(chat['Message']):lower()
            local spam = IsSpam(cleaned)

            if (not spam and IsLFG(sender, cleaned)) then
                return true
            elseif (filtered[sender]) then
                local score = filtered[sender]
                local last = score.last

                if (os.time() >= score.expiration) then
                    local spam = IsSpam(cleaned)
                    if (spam) then
                        score.total = settings.minscore
                    elseif (score.total >= settings.minscore) then
                        if (last == cleaned or IsStillSpam(score.words, cleaned)) then
                            score.total = score.total + 1
                        else
                            score.total = 0
                        end
                    else
                        score.total = 0
                    end
                end

                score.expiration = os.time() + settings.expiration

                -- Do a fast and quick direct comparison first
                -- then check deeper
                if (last == cleaned or IsStillSpam(score.words, cleaned)) then
                    score.total = score.total + 1
                else
                    score.words = GetWords(cleaned)
                    score.last = cleaned
                    score.total = score.total - 1
                end

                score.total = math.max(0, math.min(score.total, settings.maxscore))

                if (score.total >= settings.minscore) then
                    return true;
                end
            else
                local score = {}
                score.words = GetWords(cleaned)
                score.last = cleaned
                score.total = spam and settings.minscore or 0
                score.expiration = os.time() + settings.expiration
                filtered[sender] = score

                if (spam) then
                    return true
                end
            end
        end
    end
end

local function loaded() 
    if user_events then
        return
    end

    user_events = {}
    user_events.prerender = windower.register_event('prerender', prerender)
    user_events.incoming_chunk = windower.register_event('incoming chunk', incoming_chunk)
end

local function unloaded()
    if not user_events then
        return
    end

    for k,v in pairs(user_events) do
        windower.unregister_event(v)
    end

    lfg_status:hide()
    user_events = nil
    lfg = {}
    filtered = {}
end

windower.register_event('addon command', addon_command)
windower.register_event('logout', 'unload', unloaded)
windower.register_event('login', 'load', loaded)
