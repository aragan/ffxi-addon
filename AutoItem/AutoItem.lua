_addon.name = 'AutoItem'
_addon.version = '4.1'
_addon.author = 'PBW'
_addon.commands = {'autoitem','ai'}

require('tables')
require('strings')
require('logger')
require('sets')
require('lists')
packets = require('packets')
chat = require('chat')
res = require('resources')

active = true
panacea = false
job_registry = T{}
panacea_buffs = S{13,136,144,145,146,149,167}	-- Slow, STR Down, Max HP Down, Max MP Down, Accuracy Down, Defense Down, Magic Def. Down
dot_buffs = S{128,129,130,131,132,133}
remedy_buffs = S{4,8}	-- Paralysis, Disease
holywater_buffs = S{9}	-- Curse
allbuffs = remedy_buffs:union(panacea_buffs):union(holywater_buffs):union(dot_buffs)
active_buffs = S{}

local __bags = {}
local getBagType = function(access, equippable)
    return S(res.bags):filter(function(key) return (key.access == access and key.en ~= 'Recycle' and (not key.equippable or key.equippable == equippable)) or key.id == 0 and key end)
end

do -- Setup Bags.
    __bags.usable = T(getBagType('Everywhere', false))
end

local attempt = 0
function use_meds_check()

	if not active_buffs then return end
	local player = windower.ffxi.get_player()

	-- Remedy debuffs
    for buff_id,_ in pairs (active_buffs) do
		if remedy_buffs:contains(buff_id) and active and player.main_job ~= 'WHM' and (os.time()-attempt) > 4 then
			if haveBuff(buff_id) and haveMeds(4155) then
				windower.add_to_chat(6,"[AutoItem] Using Remedy.")
				windower.send_command('input /item "Remedy" <me>')
				attempt = os.time()
			else
				active_buffs:remove(buff_id)
				attempt = os.time()
			end
		elseif (panacea_buffs:contains(buff_id) or dot_buffs:contains(buff_id)) and active and panacea and (os.time()-attempt) > 4 then
			if haveBuff(buff_id) and haveMeds(4149) then
				windower.add_to_chat(6,"[AutoItem] Using Panacea.")
				windower.send_command('input /item "Panacea" <me>')
				attempt = os.time()
			else
				active_buffs:remove(buff_id)
				attempt = os.time()
			end
		elseif holywater_buffs:contains(buff_id) and active and player.main_job ~= 'WHM' and (os.time()-attempt) > 4 then
            if haveBuff(buff_id) and haveMeds(4154) then
				windower.add_to_chat(6,"[AutoItem] Using Holy Water.")
				windower.send_command('input /item "Holy Water" <me>')
				attempt = os.time()
            else
				active_buffs:remove(buff_id)
				attempt = os.time()
			end
		end
	end
	return
end
	
function haveMeds(med_id)
	for bag in T(__bags.usable):it() do
		for item, index in T(windower.ffxi.get_items(bag.id)):it() do
			if type(item) == 'table' and item.id == med_id then
				return true
			end
		end
	end
	
	windower.add_to_chat(3, '[AutoItem] <<NO>> -' .. res.items[med_id].en .. '- Found!')
	return false
end

function haveBuff(buff_id)
	local player = windower.ffxi.get_player()
	if (player and player.buffs) then
		for _,bid in pairs(player.buffs) do
			if buff_id == bid then
				return true
			end
		end
	end
	return false
end

local last_render = 0
local delay = 0.5
windower.register_event('prerender', function()

  if (os.clock()-last_render) > delay then
    use_meds_check()
    last_render = os.clock()

  end

end)

function handle_lose_buff(buff_id)
	if buff_id and allbuffs:contains(buff_id) then
		active_buffs:remove(buff_id)
		if panacea and active and (panacea_buffs:contains(buff_id) or dot_buffs:contains(buff_id)) then
			windower.add_to_chat(13,'[AutoItem] Debuff removed: ' .. res.buffs[buff_id].en .. ' - '..'['..buff_id..']')
		elseif active and (remedy_buffs:contains(buff_id) or holywater_buffs:contains(buff_id)) then
			windower.add_to_chat(13,'[AutoItem] Debuff removed: ' .. res.buffs[buff_id].en .. ' - '..'['..buff_id..']')
		end
	end
end	

function handle_incoming_chunk(id, data)
    if id == 0x028 then	-- Casting
        local action_message = packets.parse('incoming', data)
		if action_message["Category"] == 4 then
			isCasting = false
		elseif action_message["Category"] == 8 then
			isCasting = true
		end
	elseif id == 0x063 then -- Player buffs for Aura detection : Credit: elii, bp4
		local parsed = packets.parse('incoming', data)
		for i=1, 32 do
			local buff = tonumber(parsed[string.format('Buffs %s', i)]) or 0
			local our_time = tonumber(parsed[string.format('Time %s', i)]) or 0
			
			if buff > 0 and buff ~= 255 and allbuffs:contains(buff) then
				if math.ceil(1009810800 + (our_time / 60) + 0x100000000 / 60 * 9) - os.time() > 5 then
					if not (active_buffs:contains(buff)) then
						if panacea and active and panacea_buffs:contains(buff) then
							windower.add_to_chat(1, string.format("%s", ("[AutoItem] Debuff detected: %s - [%s]"):format(res.buffs[buff].en, buff):color(39)))
						elseif active and (remedy_buffs:contains(buff) or holywater_buffs:contains(buff)) then
							windower.add_to_chat(1, string.format("%s", ("[AutoItem] Debuff detected: %s - [%s]"):format(res.buffs[buff].en, buff):color(39)))
						end
						active_buffs:add(buff)
					end
				end
			end
		end
	end
end
	
function handle_addon(...)
    local args = {...}
    if args[1] ~= nil then
        local comm = args[1]:lower()
        if comm == 'on' then
            active = true
			windower.add_to_chat(262,"[AutoItem] ON")
        elseif comm == 'off' then
			active = false
            windower.add_to_chat(262,"[AutoItem] OFF")
		elseif comm == 'pana' then
			if args[2] and args[2]:lower() == 'on' then
				panacea = true
				windower.add_to_chat(262,"[AutoItem] Panacea ON")
			elseif args[2] and args[2]:lower() == 'off' then
				panacea = false
				windower.add_to_chat(262,"[AutoItem] Panacea OFF")
			else
				windower.add_to_chat(262,"[AutoItem] No parameter specified.")
			end
		elseif comm == 'show' then
			for k,v in pairs(active_buffs) do
				windower.add_to_chat(13,'Active Buffs: '..k)
			end
	    end
    end
end

windower.register_event('load', function()
	windower.add_to_chat(262,'[AutoItem] Welcome to AutoItem!')
end)

function handle_zone_change(new_id, old_id)
	if panacea then
		windower.add_to_chat(262,'[AutoItem] Disabling Auto-Panacea.')
		panacea = false
	end
end

windower.register_event('addon command',handle_addon)
windower.register_event('lose buff', handle_lose_buff)
windower.register_event('incoming chunk', handle_incoming_chunk)
windower.register_event('zone change', handle_zone_change)