_addon.name = 'DropStop'
_addon.author = 'Dean James (Xurion of Bismarck)'
_addon.commands = {'dropstop', 'ds'}
_addon.version = '1.0.0'

packets = require('packets')
items = require('resources').items
config = require('config')

defaults = {
    items = ''
}
settings = config.load(defaults)

default_protected_items = require('defaults')
custom_protected_items = T{}

if string.len(settings.items) > 0 then
    for item in settings.items:gmatch("([^,]+)") do
        table.insert(custom_protected_items, item)
    end
end

protected_items = T{}

for k, v in ipairs(default_protected_items) do
    table.insert(protected_items, v:lower())
end
for k, v in ipairs(custom_protected_items) do
    table.insert(protected_items, v:lower())
end

function save_settings()
    settings.items = table.concat(custom_protected_items, ",")
    settings:save()
end

windower.register_event('outgoing chunk', function(id, data)
    if id == 0x028 then --drop item packet
        local parsed = packets.parse('outgoing', data)
        local item = windower.ffxi.get_items(0, parsed['Inventory Index'])

        if protected_items:contains(items[item.id].en:lower()) or protected_items:contains(items[item.id].enl:lower()) then
            windower.add_to_chat(8, 'DropStop prevented you dropping ' .. items[item.id].name)
            return true --prevent the drop
        end
    end
end)

windower.register_event('addon command', function(command, ...)
    command = command and command:lower() or 'help'

    if commands[command] then
        commands[command]({...})
    else
        commands.help()
    end
end)

commands = {}

commands.add = function(item_parts)
    if #item_parts == 0 then return end

    local item_name = table.concat(item_parts, " ")
    local item_name_lower = item_name:lower()

    if not custom_protected_items:contains(item_name_lower) then
        table.insert(custom_protected_items, item_name_lower)
        table.insert(protected_items, item_name_lower)
        save_settings()
        windower.add_to_chat(8, 'DropStop will now stop you from dropping ' .. item_name)
    end
end
commands.a = commands.add

commands.remove = function(item_parts)
    if #item_parts == 0 then return end

    local item_name = table.concat(item_parts, " ")
    local item_name_lower = item_name:lower()

    custom_protected_items:delete(item_name)
    protected_items:delete(item_name)
    save_settings()
    windower.add_to_chat(8, 'DropStop will now allow you to drop ' .. item_name)
end
commands.r = commands.remove

commands.help = function()
    windower.add_to_chat(8, '---DropStop---')
    windower.add_to_chat(8, 'Available commands:')
    windower.add_to_chat(8, '//ds add <item name> - add the item to the protected items list')
    windower.add_to_chat(8, '//ds remove <item name> - removed the item to the protected items list')
    windower.add_to_chat(8, '//ds help - displays this help')
end
commands.h = commands.help
