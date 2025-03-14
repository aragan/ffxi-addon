_addon.name = 'hovershot'
_addon.author = 'Rubenator'
_addon.version = '0.2'
_addon.language = 'english'
_addon.commands = {'hovershot'}

require('chat')
require('functions')
config = require('config')
local texts = require('texts')
local packets = require('packets')
local sets = require('sets')
local res = require('resources')

local hovershotJAID = res.job_abilities:with('en','Hover Shot').id
local hovershotBuffID = res.buffs:with('en','Hover Shot').id
local rangedWeaponskills = res.weapon_skills:filter(function(ws) return S{25, 26}:contains(ws.skill) end)

local defaults = {}
defaults = {}
defaults.draggable = true
defaults.pos = {}
defaults.pos.x = 0
defaults.pos.y = 0
defaults.text = {}
defaults.text.size = 10
defaults.text.stroke = {}
defaults.text.stroke.aplha = 200
defaults.text.stroke.red = 20
defaults.text.stroke.green = 20
defaults.text.stroke.blue = 20
defaults.text.stroke.width = 2
defaults.text.color = {}
defaults.text.color.alpha = 200
defaults.text.color.red = 200
defaults.text.color.green = 200
defaults.text.color.blue = 200
defaults.bg = {}
defaults.bg.alpha = 0
defaults.bg.red = 30
defaults.bg.green = 30
defaults.bg.blue = 30
defaults.visible = true

local settings = config.load(defaults)

local text = texts.new('${stacks}: ${distance} ${ok}', settings)
text:hide()
local hovershotBuff = false
local stacks = 0

local lastReportedPosition = nil
local lastEndShotPosition = nil
local tempEndShotPosition = nil

local scheduledTimeout = nil
local particle = false
local lastMobIDShot = -1

--[[config.register(settings, function()
    if text then
        text:destroy()
    end
    text = texts.new('${stacks}: ${distance} ${ok}', settings)
end) --TODO]]

text:register_event("drag",function()
    settings.pos.x = text:pos_x()
    settings.pos.y = text:pos_y()
    config.save(settings)
end)

function update_pos(pos)
    pos = pos or lastReportedPosition
    if not pos then return end
    local distance = calcDistance(pos)
    if distance and distance >= 9.9 then
        distance = 9.9
    end
    if distance then
        text.distance = distance and "%.1f'":format(distance) or ""
        local sameAsLast = lastReportedPosition and pos.x == lastReportedPosition.x and pos.y == lastReportedPosition.y and pos.z == lastReportedPosition.z
        local lastDistance = calcDistance(lastReportedPosition)
        local lastOkay = lastDistance and lastDistance > 1
        if distance >= 1 then
            if sameAsLast or lastOkay then 
                text.ok = "OK":text_color(0,200,0)
            else 
                text.ok = "OK"
            end
        elseif lastOkay then
            text.ok = "OK":text_color(200,200,0)
        else
            text.ok = ""
        end
    end
end

function calcDistance(finish, start)
    start = start or lastEndShotPosition
    finish = finish or lastReportedPosition
    return start and finish and math.sqrt(math.pow(finish.x-start.x,2) + math.pow(finish.y-start.y,2))
end

function handleShot(hoverSuccess, targetChanged)
    if not hovershotBuff then return end
    if hoverSuccess ~= nil then
        coroutine.close(scheduledTimeout)
        scheduledTimeout = nil
    end
    particle = false
    local pos = tempEndShotPosition or lastReportedPosition
    local distance = calcDistance(pos)
    if hoverSuccess then
        stacks = stacks >= 25 and 25 or stacks + 1
        --print("particle found", stacks)
    elseif distance and distance >= 1 then
        stacks = stacks >= 25 and 25 or stacks + 1
        --print("distance verified at timeout", stacks)
    else
        stacks = 1
        --print("improper distance at timeout", stacks)
    end
    text.stacks = stacks
    text:show()
    lastEndShotPosition = pos
end

function initialize()
    if not windower.ffxi.get_info().logged_in then
        return
    end
    hovershotBuff = S(windower.ffxi.get_player().buffs):contains(hovershotBuffID)
end
windower.register_event('login', initialize)
windower.register_event('logout', function()
    hovershotBuff = false
    lastReportedPosition = nil
    stacks = 0
    text:hide()
end)
windower.register_event('gain buff', function(buff_id)
    if buff_id == hovershotBuffID then
        hovershotBuff = true
        lastReportedPosition = nil
        stacks = 0
        text:hide()
    end
end)
windower.register_event('lose buff', function(buff_id)
    if buff_id == hovershotBuffID then
        hovershotBuff = false
        lastReportedPosition = nil
        stacks = 0
        text:hide()
    end
end)
windower.register_event('zone change', function(buff_id) -- TODO
    hovershotBuff = false
    lastReportedPosition = nil
    stacks = 0
    text:hide()
end)

windower.register_event('action', function(act)
    if not hovershotBuff then return end
    if (act.category == 2 or (act.category == 3 and rangedWeaponskills[act.param])) and act.actor_id == windower.ffxi.get_mob_by_target("me").id then -- end shot or wsfinish(archery or marksmanship)
        if not particle then
            tempEndShotPosition = lastReportedPosition
            scheduledTimeout = coroutine.schedule(handleShot, 0.5)
        end
        if act.targets[1].id ~= lastMobIDShot then
            lastMobIDShot = act.targets[1].id
            stacks = 0
        end
    elseif act.category == 12 and act.actor_id == windower.ffxi.get_mob_by_target("me").id then -- start shot
        if scheduledTimeout then
            coroutine.close(scheduledTimeout)
            scheduledTimeout = nil
        end
        particle = false
        tempEndShotPosition = nil
    elseif act.category == 6 and act.param == hovershotJAID then -- hovershot resets stacks, even while effect already active
        lastReportedPosition = nil
        stacks = 0
        text:hide()
    end
end)
windower.register_event('outgoing chunk', function(id,original,modified,injected,blocked)
    if hovershotBuff and id == 0x015 and not blocked then
        local packet = packets.parse('outgoing', modified)
        lastReportedPosition = {x=packet.X, y=packet.Y, z=packet.Z}
        update_pos()
    end
end)
windower.register_event('incoming chunk', function(id,original,modified,injected,blocked)
    if hovershotBuff and id == 0x038 and not injected then
        local packet = packets.parse('incoming', original)
        if packet.Type == "hov1" then
            particle = true
            handleShot(true)
        end
    elseif id == 0x00E then
        local packet = packets.parse('incoming', original)
        if packet['Status'] == 3 then
            if lastMobIDShot == packet['NPC'] then
                lastMobIDShot = -1
                stacks = 0
                text:hide()
            end
        end
    end
end)
windower.register_event('prerender', function()
    if not hovershotBuff then return end
    update_pos(windower.ffxi.get_mob_by_target('me'))
end)

initialize()