_addon.author = 'Ivaar - Modified by PBW'
_addon.commands = {'Singer','sing'}
_addon.name = 'Singer'
_addon.version = '2.3.1'

require('luau')
require('pack')
packets = require('packets')
texts = require('texts')
config = require('config')

res = require('resources')
get = require('sing_get')
cast = require('sing_cast')
song_timers = require('song_timers')

default = {
    interval = 0.1,
    delay=3,
    marcato='Honor March',
    soul_voice=false,
    clarion=false,
    actions=false,
    pianissimo=false,
    nightingale=true,
    troubadour=true,
	nitro=true,
    recast={song={min=20,max=45},buff={min=5,max=10}},
    active=false,
    timers=true,
    aoe={['party']=true, ['p1'] = true,['p2'] = true,['p3'] = true,['p4'] = true,['p5'] = true},
    min_ws=20,
    max_ws=99,
    box={bg={visible=false},text={size=10},pos={x=650,y=0}},
}

-- City areas for town gear and behavior.
areas = S{
    "Ru'Lude Gardens",
    "Upper Jeuno",
    "Lower Jeuno",
    "Port Jeuno",
    "Port Windurst",
    "Windurst Waters",
    "Windurst Woods",
    "Windurst Walls",
    "Heavens Tower",
    "Port San d'Oria",
    "Northern San d'Oria",
    "Southern San d'Oria",
	"Chateau d'Oraguille",
    "Port Bastok",
    "Bastok Markets",
    "Bastok Mines",
    "Metalworks",
    "Aht Urhgan Whitegate",
	"The Colosseum",
    "Tavnazian Safehold",
   -- "Nashmau",
    "Selbina",
    "Mhaura",
	"Rabao",
    "Norg",
    "Kazham",
    "Eastern Adoulin",
    "Western Adoulin",
	"Celennia Memorial Library",
	"Mog Garden",
	"Leafallia"
}

local info = windower.ffxi.get_info()

if info.logged_in then
    zone_id = info.zone
end

settings = config.load(default)

setting = T{
    buffs = T{},
    dummy = L{"Puppet's Operetta","Scop's Operetta","Shining Fantasia","Goblin Gavotte"},
    songs = L{"Honor March","Victory March","Blade Madrigal","Valor Minuet V","Valor Minuet IV",},
    song = {},
    playlist = T{
        clear = L{}
    },
}

del = 0
counter = 0
timers = {AoE={}}
party = get.party()
buffs = get.buffs()
color = {}

local save_file
job_registry = T{}

__party_buff_list = {}
__pbuff_timestamp = os.clock()

function process_buff_packet(target_id, status)
    if not target_id then return end
    local target = windower.ffxi.get_mob_by_id(target_id)
    if not target then return end
	local temp_buff_table = {}

	for k,v in pairs(status) do
		if song_buffs[v] then
			table.insert(temp_buff_table, v)
		end
	end
	__party_buff_list[target.name] = __party_buff_list[target.name] or {}
	__party_buff_list[target.name] = temp_buff_table
	review_full_dispel(target)
end

function review_full_dispel(player)
	--Full dispel table handling
    if next(__party_buff_list[player.name]) == nil and timers[player.name] then
		timers[player.name] = nil
		if settings.aoe.party then
			local party = windower.ffxi.get_party()
			for slot in get.party_slots:it() do
				if settings.aoe[slot] and party[slot].name == player.name then
					log('Watched lost: '..player.name)
					timers['AoE'] = nil	
				end
			end
		end
		return
	end
end

function review_missing_songs(player)
	if not timers[player.name] then return end
	if not __party_buff_list[player.name] then return end
	
	local tcat
	local tsongname
	local temp_buff_list = {}
	local truesong = false
	
	for t_fullname,_ in pairs(timers[player.name]) do
		truesong = false
		for t_cat,t_songs in pairs(get.songs) do
			for _,t_song_name in pairs(t_songs) do
				if t_song_name == t_fullname then
					tcat = t_cat or nil
					break
				end
			end
		end

		temp_buff_list = __party_buff_list[player.name]
		for _,bid in pairs(temp_buff_list) do
			local buff_name = res.buffs[bid].en
			if tcat == buff_name then
				temp_buff_list[_] = nil
				truesong = true
				
				__party_buff_list[player.name] = temp_buff_list
				break
			end
		
		end
		if not truesong then timers[player.name][t_fullname]= nil end
		if settings.aoe.party then
			local party = windower.ffxi.get_party()
			for slot in get.party_slots:it() do
				if settings.aoe[slot] and party[slot].name == player.name and not truesong then
					log('Watched lost: '..player.name)
					timers['AoE'][t_fullname]= nil
				end
			end
		end
		--if settings.aoe.party and not truesong then
			--timers['AoE'][t_fullname]= nil
		--end
	end
	table.vprint(__party_buff_list[player.name])
	table.vprint(timers[player.name])
end

function set_registry(id, job_id)
    if not id then return false end
    job_registry[id] = job_registry[id] or 'NON'
    job_id = job_id or 0
    if res.jobs[job_id].ens == 'NON' and job_registry[id] and not S{'NON', 'UNK'}:contains(job_registry[id]) then 
        return false
    end
    job_registry[id] = res.jobs[job_id].ens
    return true
end

-- Credit to partyhints
function get_registry(id)
    if job_registry[id] then
		return job_registry[id]
    else
        return 'UNK'
    end
end

do
    local file_path = windower.addon_path..'data/settings.lua'
    local table_tostring

    table_tostring = function(tab, padding) 
        local str = ''
        for k, v in pairs(tab) do
            if class(v) == 'List' then
                str = str .. '':rpad(' ', padding) .. '["%s"] = L{':format(k) .. table_tostring(v, padding+4) .. '},\n'
            elseif class(v) == 'Table' then
                str = str .. '':rpad(' ', padding) .. '["%s"] = T{\n':format(k) .. table_tostring(v, padding+4) .. '':rpad(' ', padding) .. '},\n'
            elseif class(v) == 'table' then
                str = str .. '':rpad(' ', padding) .. '["%s"] = {\n':format(k) .. table_tostring(v, padding+4) .. '':rpad(' ', padding) .. '},\n'
            elseif class(v) == 'string' then
                str = str .. '"%s",':format(v)
            end
        end
        return str
    end

    save_file = function()
        local make_file = io.open(file_path, 'w')
        
        local str = table_tostring(setting, 4)

        make_file:write('return {\n' .. str .. '}\n')
        make_file:close()
    end

    if windower.file_exists(file_path) then
        setting = setting:update(dofile(file_path))
    else
        save_file()
        notice('New file: data/settings.lua')
    end

    local time = os.time()
    local vana_time = time - 1009810800

    bufftime_offset = math.floor(time - (vana_time * 60 % 0x100000000) / 60)
end


function colorize(row, str)
    if not color[row] then return str end
    return '\\cs(0,255,0)%s\\cr':format(str)
end

local buttons = {'active','actions','nitro','pianissimo','party','p1','p2','p3','p4','p5'}

local display_box = function()
    local str = colorize(1, 'Singer')
    str = str .. colorize(2, '\n Actions: [%s]':format(settings.actions and 'On' or 'Off'))

    if not settings.active then return str end

    str = str..colorize(3, '\n Nitro:[%s]':format(settings.nitro and 'On' or 'Off'))
    str = str..colorize(4, '\n Pianissimo:[%s]':format(settings.pianissimo and 'On' or 'Off'))
    str = str..colorize(5, '\n AoE: [%s]':format(settings.aoe.party and 'On' or 'Off'))

    if settings.aoe.party then
        for x = 1, 5 do
            local slot = 'p' .. x
            local member = party[slot]
			if member then
				member = member.name
			else
				member = ''
			end
            str = str..colorize(x + 5,'\n <%s> [%s] %s':format(slot, settings.aoe[slot] and 'On' or 'Off', member))
        end
    end
    str = str..'\n Marcato:\n  [%s]':format(settings.marcato)
    for k,v in ipairs(setting.songs) do
        str = str..'\n   %d:[%s]':format(k, v)
    end

	for k,v in pairs(setting.song) do
        str = str..'\n %s:':format(k)
        for i, t in ipairs(v) do
            str = str..'\n  %d:[%s]':format(i,t)
        end
    end

    str = str..'\n Dummy Songs:[%d]':format(setting.dummy:length())

    for k,v in pairs(settings.recast) do
        str = str..'\n Recast %s:[%d-%d]':format(k:ucfirst(),v.min,v.max)
    end
    str = str..'\n Delay:[%s]':format(settings.delay)
    if settings.use_ws then
        str = str..'\n WS:[ > %d%%][ < %d%%]':format(settings.min_ws,settings.max_ws)
    end
    return str
end

bard_status = texts.new(display_box(),settings.box,settings)
bard_status:show()

function primary_song_check()
    bard_status:text(display_box())
    if not settings.actions then return end --or areas:contains(res.zones[zone_id].en) then return end

    counter = counter + settings.interval
    if counter >= del then
        counter = 0
        del = settings.interval
        local play = windower.ffxi.get_player()

        if not play or play.main_job ~= 'BRD' or (play.status ~= 1 and play.status ~= 0) then return end
        if is_moving or buffs.stun or buffs.sleep or buffs.charm or buffs.terror or buffs.petrification or buffs.mute or buffs.omerta then return end

        local spell_recasts = windower.ffxi.get_spell_recasts()
        local ability_recasts = windower.ffxi.get_ability_recasts()
        local recast = settings.recast.song.min

        for k, v in pairs(timers) do
            song_timers.update(k)
        end

        if settings.aoe.party and get.aoe_range() then
            if cast.check_song(setting.songs,'AoE',buffs,spell_recasts,ability_recasts,JA_WS_lock,recast) then
                return
            end
        end

		if not settings.aoe.party then
			if cast.check_song(setting.songs,'AoE',buffs,spell_recasts,ability_recasts,JA_WS_lock,recast) then
                return
            end
		end

        if settings.pianissimo then
            for targ, songs in pairs(setting.song) do
                local member = get.party_member(targ)
                if member and get.is_valid_target(member.mob, 20) then
                    if cast.check_song(songs,targ,buffs,spell_recasts,ability_recasts,JA_WS_lock,recast) then
                        return
                    end
                end
            end
        end

    end
end

local last_render = 0
function handle_prerender()
	if (os.clock()-last_render) > settings.interval then
		primary_song_check()
		last_render = os.clock()
	end
end

function handle_load()
	settings.actions = false
end


start_categories = S{8,9}
finish_categories = S{3,5}
buff_lost_messages = S{64,74,83,123,159,168,204,206,322,341,342,343,344,350,378,453,531,647}
death_messages = {[6]=true,[20]=true,[113]=true,[406]=true,[605]=true,[646]=true}

windower.register_event('incoming chunk', function(id,original,modified,injected,blocked)
    if id == 0x028 then
        local packet = packets.parse('incoming', original)
		local tact = nil
		
        if packet['Actor'] ~= get.player_id then return false end
        if packet['Category'] == 8 then
            if (packet['Param'] == 24931) then
            -- Begin Casting
                is_casting = true
            elseif (packet['Param'] == 28787) then
            -- Failed Casting
                is_casting = false
                del = 2.5
            end
        elseif packet['Category'] == 4 then
            -- Finish Casting
            is_casting = false
            del = settings.delay

            local song = get.song_name(packet['Param'])

            if not song then return end

            local buff_id = packet['Target 1 Action 1 Param']
            if song_buffs[buff_id] and packet['Target Count'] > 1 and (not settings.aoe.party or get.aoe_range()) then
                song_timers.adjust(song, 'AoE', buffs)
            end

            for x = 1, packet['Target Count'] do
                local buff_id = packet['Target '..x..' Action 1 Param']
                local targ_id = packet['Target '..x..' ID']
                if song_buffs[buff_id] then
                    song_timers.adjust(song, windower.ffxi.get_mob_by_id(targ_id).name, buffs)
                end
            end
        elseif finish_categories:contains(packet['Category']) then
            is_casting = false
        elseif start_categories:contains(packet['Category']) then
            is_casting = true
        end

    elseif id == 0x029 then
        local packet = packets.parse('incoming', original)
        if death_messages[packet.Message] then
			--timers[packet.Target] = nil
			--timers['AoE'] = nil
        elseif buff_lost_messages:contains(packet.Message) and packet['Actor'] == get.player_id then
            song_timers.buff_lost(packet['Target'],packet['Param 1']) 
			local mob_entity = windower.ffxi.get_mob_by_id(packet['Target'])
			if packet['Target'] ~= get.player_id and get.songs[song_buffs[packet['Param 1']]] then --and get.party_member(mob_entity.name) then
				review_missing_songs(mob_entity)
			end
        end
    elseif id == 0x63 and original:byte(5) == 9 then
        local set_buff = {}
        local set_time = {}
        for n=1,32 do
            local buff_id = original:unpack('H', n*2+7)
            local buff_ts = original:unpack('I', n*4+69)

            if buff_ts == 0 then
                break
            elseif buff_id ~= 255 then
                local buff_en = res.buffs[buff_id].en:lower()

                set_buff[buff_en] = (set_buff[buff_en] or 0) + 1
                set_time[buff_en] = math.floor(buff_ts / 60 + bufftime_offset)
            end
        end
        buffs = set_buff
	elseif id == 0x076 then
        for k = 0, 4 do
            local id = original:unpack('I', k*48+5)
            local new_buffs_list = {}

            local new_i = 0
            if id ~= 0 then
                for i = 1, 32 do
                    local buff = original:byte(k*48+5+16+i-1) + 256*( math.floor( original:byte(k*48+5+8+ math.floor((i-1)/4)) / 4^((i-1)%4) )%4) -- Credit: Byrth, GearSwap
                    if buff == 255 then
                        break
                    end
                    new_buffs_list[i] = buff
                end
            end
           process_buff_packet(id, new_buffs_list)
        end
    elseif id == 0x00A then
        local packet = packets.parse('incoming', original)

        get.player_id = packet.Player
        get.zone_id = packet.Zone
        get.player_name = packet.Name
	elseif (id == 0x0DD or id == 0x0DF or id == 0x0C8) then           --Party member update
        local parsed = packets.parse('incoming', original)
		if parsed then
			local playerId = parsed['ID']
			local indexx = parsed['Index']
			local job = parsed['Main job']
			
			if playerId and playerId > 0 then
				set_registry(parsed['ID'], parsed['Main job'])
			end
		end
    end
end)

windower.register_event('outgoing chunk', function(id,data,modified,is_injected,is_blocked)
    if id == 0x015 then
        is_moving = modified:sub(0x04+1, 0x0F+1) ~= lastcoord
        lastcoord = modified:sub(0x04+1, 0x0F+1)
    end
end)

function addon_message(str)
    windower.add_to_chat(207, _addon.name..': '..str)
end

handled_commands = T{
    actions = S{'on','off'},
    aoe = T{
        ['on'] = 'on',
        ['add'] = 'on',
        ['+'] = 'on',
        ['watch'] = 'on',
        ['off'] = 'off',
        ['remove'] = 'off',
        ['-'] = 'off',
        ['ignore'] = 'off',
    },
    recast = S{'buff','song'},
    clear = S{'remove','clear'},
}

short_commands = {
    ['p'] = 'pianissimo',
    ['n'] = 'nitro',
    ['t'] = 'troubadour',
    ['pl'] = 'playlist',
}

local function save_playlist(commands)
    if not commands[2] or commands[2] == 'clear' then
        return false
    end

    local song_list = setting.song[commands[3] and commands[3]:ucfirst()] or setting.songs

    if song_list and not song_list:empty() then
        setting.playlist[commands[2]] = song_list:copy()
        addon_message('Playlist set: "%s" %s':format(commands[2], song_list:tostring())) 
        return true
    end
end

function resolve_song(commands)
    local x = tonumber(commands[#commands], 7)

    if x then commands[#commands] = {'I','II','III','IV','V','VI'}[x] end

    return get.song_from_command(table.concat(commands, ' ',2))
end

windower.register_event('addon command', function(...)
    local commands = T(arg):map(windower.convert_auto_trans .. string.lower)

    commands[1] = short_commands[commands[1]] or commands[1]
    
    if commands[1] == 'actions' then
        commands:remove(1)
    end

    if not commands[1] or handled_commands.actions:contains(commands[1]) then
        if not commands[1] then
            settings.actions = not settings.actions
        elseif commands[1] == 'on' then
            settings.actions = true
        elseif commands[1] == 'off' then
            settings.actions = false
        end
        if settings.actions then
            del = 0
            initialize()
        end
        addon_message('Actions %s':format(settings.actions and 'On' or 'Off'))
    elseif commands[1] == 'save' then
        if not commands[2] then
            settings:save('all')
            addon_message('settings Saved.')
        elseif not save_playlist(commands) then
           return
        end
        save_file()
    elseif commands[1] == 'playlist' then
        if commands[2] == 'save' then
            commands:remove(1)
            if save_playlist(commands) then
                save_file()
            end
        elseif setting.playlist:containskey(commands[2]) then
            local song_list = setting.playlist[commands[2]]
            local name = commands[3] and commands[3]:ucfirst()

            if name then
                setting.song[name] = song_list:copy()
                if setting.song[name]:empty() then
                    setting.song[name] = nil
                end
            else
                setting.songs = song_list:copy()
            end
            addon_message('%s: %s':format(name or 'AoE', song_list:tostring()))
        else
            addon_message('Playlist not found: %s':format(commands[2]))
        end
    elseif handled_commands.clear:contains(commands[1]) and commands[2] then
        local song_list
        if commands[2] == 'aoe' then
            setting.songs:clear()
		elseif commands[2] == 'all' then
			addon_message('Clearing all Pianissimo.')
			for k,v in pairs(setting.song) do
				addon_message('Clearing songs for: ' ..k)
				setting.song[k] = nil
			end
        else
            for _, Name in T(setting.song):key_filter(string.ieq+{commands[2]}):it() do
                setting.song[Name] = nil
            end
        end
    elseif tonumber(commands[1], 6) and commands[2] then
        local name = commands[commands[3] and #commands]
        local ind = tonumber(commands[1])

        if handled_commands.clear:contains(commands[2]) then
            if not name then
                setting.songs:remove(ind)
            else
                for _, Name in T(setting.song):key_filter(string.ieq+{name}):it() do
                    setting.song[Name]:remove(ind)
                    if setting.song[Name]:empty() then
                        setting.song[Name] = nil
                    end
                end
            end
        else
            local member = get.party_member(name)
            if member then
                name = member.name
                commands:remove(#commands)
            else
                name = nil
            end

            local song = resolve_song(commands)
            local song_list
            if song then
                if name then
                    setting.song[name] = setting.song[name] or L{}
                    song_list = setting.song[name]
                else
                    song_list = setting.songs
                end

                if song_list:length() < ind then
                    song_list:append(song)
                else
                    song_list[ind] = song
                end
                addon_message('%s: %s':format(name or 'AoE', song_list:tostring()))
            else
                addon_message('Invalid song name.')
            end
        end

	-- Pianissimo
    elseif get.songs[commands[1]] then
        local type = commands[1]
        local songs = get.ext_songs(type, commands[2])

        if songs then
            commands:remove(2)
        else
            songs = get.songs[type]
        end

        commands:remove(1)

        local n = commands[1]
        n = tonumber({off=0}[n] or n)
        if n then
            commands:remove(1)
        else
            n = 1
        end

        local name
        if commands[1] then
			local member
			
			if job_list(commands[1]) then
				member = getPlayerNameFromJob(commands[1])
			else
				member = get.party_member(commands[1]) and get.party_member(commands[1]).name
			end
			
            if member then
				name = member
            else
                for _, Name in T(setting.song):key_filter(string.ieq+{commands[1]}):it() do
                    name = Name
                end
            end
            if not name then
				addon_message('Error: '..commands[1]..' is not in party.')
                return
            end
            setting.song[name] = setting.song[name] or L{}
        end

        local song_list = setting.song[name] or setting.songs

        if not n then
            return
        elseif #songs < n then
            addon_message('Error: %d exceeds the maximum value for %s.':format(n, type))
            return
        elseif n == 0 then
            for x = #songs, 1, -1 do
                local song = song_list:find(songs[x])

                if song then
                    song_list:remove(song)
                end
            end
        else
            for x = 1, n do
                local song = songs[x]

                if not song_list:find(song) then
                    if #song_list >= 5 then
                        song_list:remove(5)
                    end
                    song_list:insert(1, song)
                end
            end
        end

        if song_list:empty() then
            setting.song[name] = nil
        end
        addon_message('%s: %s':format(name or 'AoE', song_list:tostring()))
    elseif commands[1] == 'aoe' and commands[2] then
        local command = handled_commands.aoe[commands[#commands]]
        local n = commands[2]:match('[1-5]') or S{'on','off'}:contains(commands[2]:lower())
        
		if commands[2] == 'on' then
			settings.aoe.party = true
			return
		elseif commands[2] == 'off' then
			settings.aoe.party = false
			return
		end
		
        local _, slot = get.party_member(commands[2])
        slot = slot or 'p'..n

        if not slot then
            if command and not commands[3] then
            elseif commands[2] ~= 'party' then
                return
            end
            slot = 'party'
        elseif slot == 'p0' then
            return
        end
        if not command then
            settings.aoe[slot] = not settings.aoe[slot]
        elseif command == 'on' then
            settings.aoe[slot] = true
        elseif command == 'off' then
            settings.aoe[slot] = false
        end

        if settings.aoe[slot] then
            addon_message('Will now ensure <%s> is in AoE range.':format(slot))
        else
            addon_message('Ignoring <%s>':format(slot))
        end   
    elseif commands[1] == 'recast' and handled_commands.recast:contains(commands[2]) then
        settings.recast[commands[2]].min = tonumber(commands[3]) or settings.recast[commands[2]].min
        settings.recast[commands[2]].max = tonumber(commands[4]) or settings.recast[commands[2]].max
        addon_message('%s recast set to min: %s max: %s':format(commands[2], settings.recast[commands[2]].min, settings.recast[commands[2]].max))
    elseif commands[1] == 'ws' and commands[3] then
        if commands[3] == 'on' then
            settings.use_ws = true
        elseif commands[3] == 'off' then
            settings.use_ws = false
        elseif tonumber(commands[3]) then
            if commands[2] == '<' then
                settings.max_ws = tonumber(commands[3])
            elseif commands[2] == '>' then
                settings.min_ws = tonumber(commands[3])
            end
        end
   elseif commands[1]:startswith('dummy') then
        local ind = tonumber(commands[1]:sub(6))

        if not ind and tonumber(commands[2]) then
            ind = commands[2]
            commands:remove(2)
        end

        ind = tonumber(ind or 1, 5, 0)

        if commands[2] == 'remove' then
            setting.dummy:remove(ind)
            return
        end

        local song = resolve_song(commands)

        if song then
            setting.dummy[ind] = song
            addon_message('Dummy song #%d set to %s':format(ind,song))
        else
            addon_message('Invalid song name.')
        end
    elseif type(default[commands[1]]) == 'string' and commands[2] then
        local song = resolve_song(commands)

        if song then
            settings[commands[1]] = song
            addon_message('%s is now set to %s':format(commands[1],song))
        else
            addon_message('Invalid song name.')
        end
	elseif type(default[commands[1]]) == 'number' and commands[2] and tonumber(commands[2]) then
        settings[commands[1]] = tonumber(commands[2])
        addon_message('%s is now set to %s':format(commands[1],settings[commands[1]]))
    elseif type(default[commands[1]]) == 'boolean' then
        if not commands[2] then
            settings[commands[1]] = not settings[commands[1]]
        elseif commands[2] == 'on' then
            settings[commands[1]] = true
        elseif commands[2] == 'off' then
            settings[commands[1]] = false
        end
        if commands[1] == 'timers' and not settings.timers then
            song_timers.reset(true)
        end
        addon_message('%s %s':format(commands[1],settings[commands[1]] and 'On' or 'Off'))
    elseif commands[1] == 'reset' then
        song_timers.reset()
    elseif commands[1] == 'eval' then
        assert(loadstring(table.concat(commands, ' ',2)))()
	elseif commands[1] == 'show' then
		--table.vprint(timers)
		--table.vprint(buffs)
		print(string.format("Timers Table Size: %d", T(timers):length()))
		print(string.format("Party Table Size: %d", T(party):length()))
		print(string.format("Buffs Table Size: %d", T(buffs):length()))
		print(string.format("Buff Table Size: %d", T(buff):length()))
	elseif commands[1] == 'sh' then
		table.vprint(timers)
		
	elseif commands[1] == 'test' then
	-- for t_cat,t_songs in pairs(get.songs) do
		-- log(t_cat)
		-- for _,t_song_name in pairs(t_songs) do
			-- log(t_song_name)
		-- end
		
	-- end
	table.vprint(__party_buff_list)
	--table.vprint(settings.aoe)
    end
    bard_status:text(display_box())
end)


function job_list(job_selection)
	if job_selection:lower() == 'tank' then
		return true
	end
	for _,jobs in pairs(res.jobs) do
		if type(jobs)=='table' and job_selection:lower() == jobs.ens:lower() then
			return true
		end
	end
end

function getPlayerNameFromJob(job)
	local target
	for k, v in pairs(windower.ffxi.get_party()) do
		if type(v) == 'table' and v.mob ~= nil and v.mob.in_party then
			if ((job:lower() == 'tank' and S{'PLD','RUN'}:contains(get_registry(v.mob.id))) or (job:lower() ~= 'tank' and get_registry(v.mob.id):lower() == job:lower())) then
				target = v.name
			end
		end
	end
    if target ~= nil then
        return target
    end
    return nil
end

function event_change()
    settings.actions = false
    song_timers.reset()
    bard_status:text(display_box())
end

function handle_zone_change(new_id, old_id)
	zone_id = new_id
	settings.actions = false
    song_timers.reset()
    bard_status:text(display_box())
end

function status_change(new,old)
    if new == 2 or new == 3 then
        event_change()
    end
end

function mouse_event(type, x, y, delta, blocked)

    for row in ipairs(buttons) do
        color[row] = false
    end

    if bard_status:hover(x, y) and bard_status:visible() then
        local lines = bard_status:text():count('\n') + 1
        local _, _y = bard_status:extents()
        local pos_y = y - settings.box.pos.y
        local off_y = _y / lines
        local upper = 1
        local lower = off_y

        for row, button in ipairs(buttons) do
            if pos_y > upper and pos_y < lower then
                color[row] = true

                if type == 2 then
                    if default.aoe[button] then
                        if not settings.aoe.party and button ~= 'party' then
                            break
                        end
                        settings.aoe[button] = not settings.aoe[button]
                    else
                        settings[button] = not settings[button]
                    end
                    return true
                end
            end
            upper = lower
            lower = lower + off_y
        end
    end
end

function handle_logout()
	settings.actions = false
    song_timers.reset()
    bard_status:text(display_box())
	windower.send_command('lua unload singer')
end

windower.register_event('mouse', mouse_event)
windower.register_event('unload', song_timers.reset)
windower.register_event('status change', status_change)
windower.register_event('job change', event_change)
windower.register_event('zone change', handle_zone_change)
windower.register_event('logout', handle_logout)
windower.register_event('load', handle_load)
windower.register_event('prerender', handle_prerender)
