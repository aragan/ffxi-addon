_addon.name = 'Eneresist'
_addon.author = 'Enedin'
_addon.version = '0.1'

require('config')
require('luau')
require('tables')
require('sqlite3')
res = require('resources')
texts = require('texts')

-- variables
targetres = {}
mobres = {}
mobres.slash = 0
mobres.pierce = 0
mobres.h2h = 0
mobres.impact = 0
mobres.fire = 0
mobres.ice = 0
mobres.wind = 0
mobres.earth = 0
mobres.lightning = 0
mobres.water = 0
mobres.light = 0
mobres.dark = 0
rescolors = {}
rescolors[1] = '\\cs(220,80,54)'
rescolors[2] = '\\cs(58,187,181)'
rescolors[3] = '\\cs(85,199,110)'
rescolors[4] = '\\cs(228,193,60)'
rescolors[5] = '\\cs(189,112,205)'
rescolors[6] = '\\cs(60,150,250)'
rescolors[7] = '\\cs(199,203,205)'
rescolors[8] = '\\cs(131,133,135)'
resnames = {}
resnames[1] = 'Fire'
resnames[2] = 'Ice '
resnames[3] = 'Wind'
resnames[4] = 'Eart'
resnames[5] = 'Thun'
resnames[6] = 'Wate'
resnames[7] = 'Ligh'
resnames[8] = 'Dark'
colorpos = rescolors[3]
colorneg = rescolors[1]

-- box settings
defaults = {}
defaults.pos = {}
defaults.pos.x = 850
defaults.pos.y = 90
defaults.text = {}
defaults.text.font = 'Consolas'
defaults.text.size = 8
defaults.flags = {}
defaults.flags.bold = false
defaults.flags.draggable = true
defaults.bg = {}
defaults.bg.alpha = 200
defaults.padding = 4

settings = config.load(defaults)
box = texts.new('${current_string}', settings)
box:show()

-- load database
windower.register_event('load',function()
	db = sqlite3.open(windower.addon_path..'/database.db')
	if not windower.ffxi.get_info().logged_in then return end
	get_target()
end)

-- unload database
windower.register_event('unload',function()
    db:close()
end)

-- get target info
function get_target(index)

	-- get target info
	local player = windower.ffxi.get_player()
	local target = windower.ffxi.get_mob_by_target('st') or windower.ffxi.get_mob_by_target('t') or player
	
	-- if target is a monster
	if target.spawn_type == 16 then 
		box:show()
		local zone = res.zones[windower.ffxi.get_info().zone].name
		box.current_string = target.name .. "-" .. target.index
		get_db(target.name)
	else
		box:hide()
	end

end

function get_db(target)

	-- remove all nonalphanumeric characters and set everything in lowercase to match already filtered mob names in DB
	target = target:gsub('%W',''):lower()
    local query = 'SELECT * FROM "mobs" WHERE mob_name = "' .. target .. '"'
	local found_resist_id = -1
	
	-- if database is open and query is valid
    if db:isopen() and query then
	
		-- for every row found
        for id, mob_name, resist_id in db:urows(query) do
			box.current_string = target .. "+" .. resist_id
			found_resist_id = resist_id
			break -- only need the first hit. ideally we remove duplicates from the table
		end
		
		-- if there is no exact match, look for one which starts with the target's name
		if found_resist_id == -1 then
			query = 'SELECT * FROM "mobs" WHERE mob_name LIKE "' .. target .. '%"'
			
			-- for every row found
			for id, mob_name, resist_id in db:urows(query) do
				box.current_string = target .. "===" .. resist_id
				found_resist_id = resist_id
				break -- only need the first hit. ideally we remove duplicates from the table
			end
		end
		
		-- if still no match, the DB needs a new entry
		if found_resist_id == -1 then
			--windower.add_to_chat(167,"Unable to find a monster that matches the target.")
			
		-- if we have a match
		else
			query = 'SELECT * FROM "resistances" WHERE id = "' .. found_resist_id .. '"'
			
			-- for every row found
			for id, resistance_name, slash, pierce, h2h, impact, fire, ice, wind, earth, lightning, water, light, dark in db:urows(query) do
			
				-- take those 1000 values back to percentages (this allows me to save the values as integers in the DB instead of floating point values)
				mobres.slash = slash/10
				mobres.pierce = pierce/10
				mobres.h2h = h2h/10
				mobres.impact = impact/10
				mobres.fire = fire/10
				mobres.ice = ice/10
				mobres.wind = wind/10
				mobres.earth = earth/10
				mobres.lightning = lightning/10
				mobres.water = water/10
				mobres.light = light/10
				mobres.dark = dark/10
				
				-- set values in array so we can iterate easily
				targetres[1] = tostring(mobres.fire)
				targetres[2] = tostring(mobres.ice)
				targetres[3] = tostring(mobres.wind)
				targetres[4] = tostring(mobres.earth)
				targetres[5] = tostring(mobres.lightning)
				targetres[6] = tostring(mobres.water)
				targetres[7] = tostring(mobres.light)
				targetres[8] = tostring(mobres.dark)
				
				-- add + to positive values (and store which are positive for later color determination)
				local is_positive = {}
				for i = 1, 8 do 
					is_positive[i] = false
					if not string.startswith(targetres[i],"-") and not string.startswith(targetres[i],"0") then -- can just check if positive here right lol?
						targetres[i] = '+' .. targetres[i]
						is_positive[i] = true
					end
				end
				
				-- "right-align" values
				for i = 1, 8 do
					while (string.len(targetres[i]) < 6) do
						targetres[i] = ' ' .. targetres[i]
					end
				end
				
				-- add mob family name to info. replace lines with a space. max width 10, break if more
				local info =  ''
				local mob_family_name = resistance_name:upper()
				mob_family_name = string.gsub(mob_family_name, "_", " ")
				mob_family_name = string.gsub(mob_family_name, "-", " ")
				repeat
					info = info .. string.sub(mob_family_name,1,10) .. "\n"
					mob_family_name = string.sub(mob_family_name,11)
				until string.len(mob_family_name) < 1
				
				-- add resistance info
				for i = 1, 8 do
				
					-- determine color for this element
					local color = ""
					if is_positive[i] then color = colorpos else color = colorneg end
					
					-- show info if it's not zero
					if targetres[i] ~= '     0' then info = info .. rescolors[i] .. resnames[i] .. color .. targetres[i] .. '\n' end
				end
				
				-- if there's no resistance at all, say so
				local any_change = 0
				for i = 1, 8 do
					if targetres[i] == '     0' then any_change = any_change + 1 end
				end
				if any_change == 8 then info = info .. "None." end
				
				-- write the info
				box.current_string = info
			end
		end
	end
end

-- custom function startswith
function string.startswith(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end


-- render with this. it's fairly slow compared to windower.register_event, but it's more than fast enough
windower.register_event('target change', get_target)

-- render
-- windower.register_event('prerender', function()
    -- local curr = os.clock()
    -- if curr > frame_time + 0.1 then
        -- frame_time = curr
		-- update box info here
    -- end
-- end)