_addon.name = 'sortiejobs'
_addon.author = 'Nalfey'
_addon.version = '1.0'
_addon.commands = {'sortiejobs'}

require('tables')
require('strings')
packets = require('packets')
res = require('resources')

-- Initialize the addon
function initialize()
    update_party_jobs(false)
end

-- Store party member job info
local party_jobs = {}

-- Add packet spam prevention
local last_packet_time = {}
local PACKET_DELAY = 1  -- minimum seconds between same packet type for same player

-- Add valid job combinations
local valid_jobs = {
    ["PLD"] = "RUN",
    ["DNC"] = "DRG",
    ["COR"] = "DRK",
    ["BRD"] = "DRK",
    ["GEO"] = "DRK",
    ["RDM"] = "DRK"
}

-- Color constants
local colors = {
    green = 158,  -- Light green
    red = 167,    -- Light red
    default = 207 -- Default color
}

-- Function to update job info from packet data
local function update_job_info(name, main_job_id, main_job_level, sub_job_id, sub_job_level)
    if not party_jobs[name] then
        party_jobs[name] = {}
    end
    
    if main_job_id and main_job_id > 0 then
        party_jobs[name].main_job = res.jobs[main_job_id].ens
        party_jobs[name].main_job_level = main_job_level
    end
    
    if sub_job_id and sub_job_id > 0 then
        party_jobs[name].sub_job = res.jobs[sub_job_id].ens
        party_jobs[name].sub_job_level = sub_job_level
    end
    
    if debug_mode then
        windower.add_to_chat(207, string.format('[Debug] Updated job info for %s: %s/%d %s/%d', 
            name,
            party_jobs[name].main_job or 'NONE',
            party_jobs[name].main_job_level or 0,
            party_jobs[name].sub_job or 'NONE',
            party_jobs[name].sub_job_level or 0))
    end
end

-- Function to check if we should process a packet (prevent spam)
local function should_process_packet(packet_id, player_name)
    local current_time = os.time()
    local key = packet_id .. player_name
    
    if not last_packet_time[key] or (current_time - last_packet_time[key]) >= PACKET_DELAY then
        last_packet_time[key] = current_time
        return true
    end
    return false
end

-- Check if job combination is valid
local function is_valid_combo(main_job, sub_job)
    if valid_jobs[main_job] then
        return valid_jobs[main_job] == sub_job
    end
    return false
end

-- Add zone check function
local function is_in_kamihr_drifts()
    local info = windower.ffxi.get_info()
    return info.zone == 267  -- 267 is the zone ID for Kamihr Drifts
end

-- Main function to update and display party jobs
function update_party_jobs(force_update)
    -- Check if in correct zone, unless force_update is true
    if not force_update and not is_in_kamihr_drifts() then
        if debug_mode then
            windower.add_to_chat(colors.red, 'Must be in Kamihr Drifts for automatic updates')
        end
        return
    end

    local party = windower.ffxi.get_party()
    if not party then return end
    
    windower.add_to_chat(colors.default, '== Party Jobs ==')
    
    -- Loop through party members (p0 to p5)
    for i = 0, 5 do
        local member = party['p'..i]
        if member and member.name then
            local job_info, color = get_job_info(member)
            if job_info then
                windower.add_to_chat(color, member.name .. ': ' .. job_info)
            end
        end
    end
end

-- Get job info for a party member
function get_job_info(member)
    local main_player = windower.ffxi.get_player()
    local color = colors.default
    
    if debug_mode then
        windower.add_to_chat(207, '[Debug] Processing member: ' .. member.name)
    end
    
    -- If this is the main player, we can get detailed job info
    if member.name == main_player.name then
        local main_job = res.jobs[main_player.main_job_id].ens
        local main_job_level = main_player.main_job_level
        local job_string = main_job .. ' ' .. tostring(main_job_level)
        
        -- Add sub job if it exists
        if main_player.sub_job_id then
            local sub_job = res.jobs[main_player.sub_job_id].ens
            local sub_job_level = main_player.sub_job_level
            job_string = job_string .. ' / ' .. sub_job .. ' ' .. tostring(sub_job_level)
            
            -- Check if combination is valid
            color = is_valid_combo(main_job, sub_job) and colors.green or colors.red
        end
        
        return job_string, color
    else
        -- For other party members, check stored job info
        if party_jobs[member.name] then
            local job_data = party_jobs[member.name]
            local job_string = job_data.main_job .. ' ' .. tostring(job_data.main_job_level)
            
            if job_data.sub_job then
                job_string = job_string .. ' / ' .. job_data.sub_job .. ' ' .. tostring(job_data.sub_job_level)
                color = is_valid_combo(job_data.main_job, job_data.sub_job) and colors.green or colors.red
            end
            
            return job_string, color
        end
        
        if debug_mode then
            windower.add_to_chat(207, '[Debug] No job info found for ' .. member.name)
        end
        
        return 'Unknown', colors.default
    end
end

-- Add debug variable at the top with other globals
debug_mode = false  -- Set to false by default

-- Register event handlers
windower.register_event('load', function()
    update_party_jobs(false)
end)

windower.register_event('zone change', function()
    update_party_jobs(false)
end)

windower.register_event('login', function()
    update_party_jobs(false)
end)

windower.register_event('job change', function()
    update_party_jobs(false)
end)

-- Add handler for target changes
windower.register_event('target change', function(index)
    if not is_in_kamihr_drifts() then return end
    
    if index > 0 then
        local target = windower.ffxi.get_mob_by_index(index)
        if target and target.name and (target.name:lower():find("transposer") or target.name:lower():find("diaphanous")) then
            if debug_mode then
                windower.add_to_chat(207, '[Debug] Transposer targeted')
            end
            update_party_jobs(false)
        end
    end
end)

-- Add handler for incoming packets
windower.register_event('incoming chunk', function(id, data)
    if id == 0xDF then  -- Character update (0xDF)
        local packet = packets.parse('incoming', data)
        if packet then
            local playerId = packet['ID']
            if playerId and playerId > 0 then
                if debug_mode then
                    windower.add_to_chat(207, '[Debug] Received char update packet (0xDF) for ID: ' .. playerId)
                    for k,v in pairs(packet) do
                        windower.add_to_chat(207, string.format('  %s: %s', tostring(k), tostring(v)))
                    end
                end
                
                -- Get player name from ID
                local mob = windower.ffxi.get_mob_by_id(playerId)
                if mob and mob.name then
                    update_job_info(mob.name, packet['Main job'], packet['Main job level'], 
                                  packet['Sub job'], packet['Sub job level'])
                end
            end
        end
        
    elseif id == 0xDD then  -- Party member update (0xDD)
        local packet = packets.parse('incoming', data)
        if packet then
            local name = packet['Name']
            local playerId = packet['ID']
            if name and playerId and playerId > 0 then
                if debug_mode then
                    windower.add_to_chat(207, '[Debug] Received party member update packet (0xDD) for ' .. name)
                    for k,v in pairs(packet) do
                        windower.add_to_chat(207, string.format('  %s: %s', tostring(k), tostring(v)))
                    end
                end
                
                update_job_info(name, packet['Main job'], packet['Main job level'], 
                              packet['Sub job'], packet['Sub job level'])
            end
        end
    elseif id == 0x034 or id == 0x032 then -- Menu/NPC interaction
        if debug_mode then
            windower.add_to_chat(207, string.format('[Debug] Menu/NPC interaction detected (Packet: 0x%03X)', id))
        end
        
        -- Get current target
        local target = windower.ffxi.get_mob_by_target('t')
        if target and target.name and (target.name:lower():find("transposer") or target.name:lower():find("diaphanous")) then
            if debug_mode then
                windower.add_to_chat(207, '[Debug] Menu interaction with Transposer detected')
            end
            update_party_jobs(false)
        end
    end
end)

-- Add handler for status change
windower.register_event('status change', function(new_status_id)
    if debug_mode then
        windower.add_to_chat(207, string.format('[Debug] Status changed to: %d', new_status_id))
    end
    if new_status_id == 0 then  -- Status 0 is usually the normal status
        update_party_jobs(false)
    end
end)

-- Modify command handler to include debug toggle
windower.register_event('addon command', function(command, ...)
    if command == 'update' then
        update_party_jobs(true)  -- Force update regardless of zone
    elseif command == 'debug' then
        debug_mode = not debug_mode
        windower.add_to_chat(207, 'Debug mode: ' .. (debug_mode and 'ON' or 'OFF'))
        if debug_mode then
            windower.add_to_chat(207, 'Debug mode enabled - monitoring Transposer interactions')
        end
    else
        windower.add_to_chat(207, 'SortieJobs commands:')
        windower.add_to_chat(207, '//sortiejobs update - Show current party jobs (works in any zone)')
        windower.add_to_chat(207, '//sortiejobs debug - Toggle debug mode')
    end
end)
