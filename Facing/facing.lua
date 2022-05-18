--[[
Copyright © 2021, Zero Serenity
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Zero Serenity nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Zero Serenity BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

_addon.name = 'Facing'
_addon.version = '0.3'
_addon.author = 'Zero Serenity, Rubenator'
_addon.language = 'english'
_addon.commands = {'facing'}

require('vectors')
config = require('config')
local texts = require('texts')

local _defaults = {
    max_ws_angle = 42,
    text_settings = {
        draggable = true,
        pos = {
            x = 800,
            y = 1000,
        },
        bg = {
            alpha = 255,
            red = 0,
            green = 0,
            blue = 0,
            visible = false,
        },
        flags = {
            draggable = true,
            italic = false,
            bold = true,
            bottom = false,
            right = false,
        },
        padding = 2,
        text = {
            font = "Consolas",
            size = 20,
            red = 255,
            green = 255,
            blue = 255,
            stroke = {
                width = 2,
                visible = true,
                red = 0,
                green = 0,
                blue = 0,
                alpha = 150,
            },
        },
        text_with_tp = {
            font = "Consolas",
            size = 20,
            red = 0,
            green = 255,
            blue = 0,
            stroke =
            {
                width = 2,
                visible = true,
                red = 255,
                green = 255,
                blue = 255,
                alpha = 150,
            },
        },
        text_without_tp = {
            font = "Consolas",
            size = 20,
            red = 255,
            green = 255,
            blue = 0,
            stroke =
            {
                width = 2,
                visible = true,
                red = 255,
                green = 255,
                blue = 255,
                alpha = 150,
            },
        },
    },
}


local settings = config.load(_defaults)
local text = texts.new("${left}${angle}${right}",settings.text_settings,settings)
text:register_event("reload",function()
    init()
end)
function init()
    local windower_settings = windower.get_windower_settings()
    pos = settings.text_settings.pos
    pos.x = pos.x < -10 and 0 or pos.x >= windower_settings.ui_x_res and windower_settings.ui_x_res - 100 or pos.x
    pos.y = pos.y < -5 and 0 or pos.y >= windower_settings.ui_y_res and windower_settings.ui_y_res - 100 or pos.y
    text:pos(settings.text_settings.pos.x, settings.text_settings.pos.y)
end
init()

local pi = math.pi

function getAngle(me,point)
    local dir = V{point.x, point.y} - V{me.x, me.y}
    local heading = V{}.from_radian(me.facing)
    local angle = V{}.angle(dir, heading) * (dir[1]*heading[2]-dir[2]*heading[1] < 0 and -1 or 1)
    return angle
end

local lastcheck = 0

windower.register_event('prerender', function()
    local clock = os.clock()
    if lastcheck + 0.1 > clock then return end
    lastcheck = clock
    local me = windower.ffxi.get_mob_by_target('me')
    local target = windower.ffxi.get_mob_by_target('st') or windower.ffxi.get_mob_by_target('t')
    if not me or not target or me.id == target.id then
        text:hide()
        return
    end
    
    local degrees = math.deg(getAngle(me, target))
    text.left = degrees < settings.max_ws_angle * -1 and "<" or degrees > settings.max_ws_angle and " " or "|"
    text.right = degrees > settings.max_ws_angle and ">" or degrees < settings.max_ws_angle * -1 and " " or "|"
    text.angle = "%03.0f":format(math.floor(degrees:abs()+0.5))

    if degrees:abs() < settings.max_ws_angle then
        if windower.ffxi.get_player().vitals.tp >= 1000 then
            text:color(settings.text_settings.text_with_tp.red,settings.text_settings.text_with_tp.green,settings.text_settings.text_with_tp.blue)
        else
            text:color(settings.text_settings.text_without_tp.red,settings.text_settings.text_without_tp.green,settings.text_settings.text_without_tp.blue)
        end
    else
        text:color(settings.text_settings.text.red,settings.text_settings.text.green,settings.text_settings.text.blue)
    end
    text:show()
    
end)