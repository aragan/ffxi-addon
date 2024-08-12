_addon.name = 'BluPldSets'
_addon.version = '1'
_addon.author = 'Sheeraa (Asura)'
_addon.commands = {'bps','blupldsets',}

require('tables')
require('strings')
require('logger')
config = require('config')
files = require('files')
res = require('resources')
chat = require('chat')

defaults = {}
defaults.setmode = 'PreserveTraits'
defaults.setspeed = 0.65
defaults.spellsets = {}
defaults.spellsets.default = T{}
settings = config.load(defaults)

function initialize()
    spells = res.spells:type('BlueMagic')
    get_current_spellset()
end

windower.register_event('load', initialize:cond(function() return windower.ffxi.get_info().logged_in end))
windower.register_event('login', initialize)
windower.register_event('job change', initialize:cond(function(sub_job) return sub_job == 16 end))

function set_spells(spellset, setmode)
    if windower.ffxi.get_player()['sub_job_id'] ~= 16--[[and windower.ffxi.get_player()['main_job_id'] ~= 16]] then
        error('Sub job not set to Blue Mage.')
        return
    end
    if settings.spellsets[spellset] == nil then
        error('Set not defined: '..spellset)
        return
    end
    if is_spellset_equipped(settings.spellsets[spellset]) then
        log(spellset..' was already equipped.')
        return
    end

    log('Starting to set '..spellset..'.')
    if setmode:lower() == 'clearfirst' then
        remove_all_spells()
        set_spells_from_spellset:schedule(settings.setspeed, spellset, 'add')
    elseif setmode:lower() == 'preservetraits' then
        set_spells_from_spellset(spellset, 'remove')
    else
        error('Unexpected setmode: '..setmode)
    end
end

function is_spellset_equipped(spellset)
    return S(spellset):map(string.lower) == S(get_current_spellset())
end

function set_spells_from_spellset(spellset, setPhase)
    local setToSet = settings.spellsets[spellset]
    local currentSet = get_current_spellset()

    if setPhase == 'remove' then
        -- Remove Phase
        for k,v in pairs(currentSet) do
            if not setToSet:contains(v:lower()) then
                setSlot = k
                local slotToRemove = tonumber(k:sub(5, k:len()))

                windower.ffxi.remove_blue_magic_spell(slotToRemove)
                --log('Removed spell: '..v..' at #'..slotToRemove)
                set_spells_from_spellset:schedule(settings.setspeed, spellset, 'remove')
                return
            end
        end
    end
    -- Did not find spell to remove. Start set phase
    -- Find empty slot:
    local slotToSetTo
    for i = 1, 20 do
        local slotName = 'slot%02u':format(i)
        if currentSet[slotName] == nil then
            slotToSetTo = i
            break
        end
    end

    if slotToSetTo ~= nil then
        -- We found an empty slot. Find a spell to set.
        for k,v in pairs(setToSet) do
            if not currentSet:contains(v:lower()) then
                if v ~= nil then
                    local spellID = find_spell_id_by_name(v)
                    if spellID ~= nil then
                        windower.ffxi.set_blue_magic_spell(spellID, tonumber(slotToSetTo))
                        --log('Set spell: '..v..' ('..spellID..') at: '..slotToSetTo)
                        set_spells_from_spellset:schedule(settings.setspeed, spellset, 'add')
                        return
                    end
                end
            end
        end
    end

    -- Unable to find any spells to set. Must be complete.
    log(spellset..' has been equipped.')
    windower.send_command('@timers c "Blue magic ready in -->" 60 up')
end

function find_spell_id_by_name(spellname)
    for spell in spells:it() do
        if spell['english']:lower() == spellname:lower() then
            return spell['id']
        end
    end
    return nil
end

function set_single_spell(setspell,slot)
    if windower.ffxi.get_player()['sub_job_id'] ~= 16--[[and windower.ffxi.get_player()['main_job_id'] ~= 16]] then return nil end

    local tmpTable = T(get_current_spellset())
    for key,val in pairs(tmpTable) do
        if tmpTable[key]:lower() == setspell then
            error('That spell is already set.')
            return
        end
    end
    if tonumber(slot) < 10 then slot = '0'..slot end
    --insert spell add code here
    for spell in spells:it() do
        if spell['english']:lower() == setspell then
            --This is where single spell setting code goes.
            --Need to set by spell id rather than name.
            windower.ffxi.set_blue_magic_spell(spell['id'], tonumber(slot))
            windower.send_command('@timers c "Blue Spells Be Ready in" 60 up')
            tmpTable['slot'..slot] = setspell
        end
    end
    tmpTable = nil
end

function get_current_spellset()
    if windower.ffxi.get_player().sub_job_id ~= 16 then return nil end
    return T(windower.ffxi.get_sjob_data().spells)
    -- Returns all values but 512
    :filter(function(id) return id ~= 512 end)
    -- Transforms them from IDs to lowercase English names
    :map(function(id) return spells[id].english:lower() end)
    -- Transform the keys from numeric x or xx to string 'slot0x' or 'slotxx'
    :key_map(function(slot) return 'slot%02u':format(slot) end)
end

function remove_all_spells(trigger)
    windower.ffxi.reset_blue_magic_spells()
    notice('All spells removed.')
end

function save_set(setname)
    if setname == 'default' then
        error('Please choose a name other than default.')
        return
    end
    local curSpells = T(get_current_spellset())
    settings.spellsets[setname] = curSpells
    settings:save('all')
    notice('Set '..setname..' saved.')
end

function delete_set(setname)
    if settings.spellsets[setname] == nil then
        error('Please choose an existing spellset.')
        return
    end    
    settings.spellsets[setname] = nil
    settings:save('all')
    notice('Deleted '..setname..'.')
end



function get_spellset_list()
    log("Listing sets:")
    for key,_ in pairs(settings.spellsets) do
        if key ~= 'default' then
            local it = 0
            for i = 1, #settings.spellsets[key] do
                it = it + 1
            end
            log("\t"..key..' '..settings.spellsets[key]:length()..' spells.')
        end
    end
end

function get_spellset_content(spellset)
    log('Getting '..spellset..'\'s spell list:')
    settings.spellsets[spellset]:print()
end

windower.register_event('addon command', function(...)
    if windower.ffxi.get_player()['sub_job_id'] ~= 16--[[and windower.ffxi.get_player()['main_job_id'] ~= 16]] then
        error('You are not on (sub) Blue Mage.')
        return nil
    end
    local args = T{...}
    if args ~= nil then
        local comm = table.remove(args,1):lower()
        if comm == 'removeall' then
            remove_all_spells('trigger')
        elseif comm == 'add' then
            if args[2] ~= nil then
                local slot = table.remove(args,1)
                local spell = args:sconcat()
                set_single_spell(spell:lower(),slot)
            end
        elseif comm == 'save' then
            if args[1] ~= nil then
                save_set(args[1])
            end
        elseif comm == 'delete' then
            if args[1] ~= nil then
                delete_set(args[1])
            end
        elseif comm == 'spellset' or comm == 'set' then
            if args[1] ~= nil then
                set_spells(args[1], args[2] or settings.setmode)
            end
        elseif comm == 'currentlist' then
            get_current_spellset():print()
        elseif comm == 'setlist' then
            get_spellset_list()
        elseif comm == 'spelllist' then
            if args[1] ~= nil then
                get_spellset_content(args[1])
            end
        elseif comm == 'help' then
            local helptext = [[blupldsets - Command List:')
            1. //bps removeall -- remove current set spells.
            2. //bps set <setname> 
            3. //bps save <setname> -- Saves current set spells (setname).
            4. //bps delete <setname> -- Delete's spellset.
            5. //bps currentlist -- Lists currently set spells.
            6. //bps setlist -- Shows all spellsets.
            7. //bps help -- Shows help list]]
            for _, line in ipairs(helptext:split('\n')) do
                windower.add_to_chat(207, line..chat.controls.reset)
            end
        end
    end
end)