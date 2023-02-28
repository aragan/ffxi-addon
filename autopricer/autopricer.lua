require "List"
require "gui"
require('chat')
config = require('config')
require 'strings'
require('socket')
local https = require('ssl.https')
res = require('resources')

_addon.name = 'AutoPricer'
_addon.author = 'original: Brax, improvements and additions: Kenshi, auto-mode additions: Jintawk'
_addon.version = '2.0'
_addon.command = 'autopricer'

-- Settings
defaults = {}
defaults.server = "asura"

settings = config.load(defaults)

-- ID of inventery (bag 0)
inventory = 0
price_list = List.new()

servers = {
    ["bahamut"] = "sid=1",
    ["shiva"] = "sid=2",
    ["titan"] = "sid=3",
    ["ramuh"] = "sid=4",
    ["phoenix"] = "sid=5",
    ["carbuncle"] = "sid=6",
    ["fenrir"] = "sid=7",
    ["sylph"] = "sid=8",
    ["valefor"] = "sid=9",
    ["alexander"] = "sid=10",
    ["leviathan"] = "sid=11",
    ["odin"] = "sid=12",
    ["ifrit"] = "sid=13",
    ["diabolos"] = "sid=14",
    ["caitsith"] = "sid=15",
    ["quetzalcoatl"] = "sid=16",
    ["siren"] = "sid=17",
    ["unicorn"] = "sid=18",
    ["gilgamesh"] = "sid=19",
    ["ragnarok"] = "sid=20",
    ["pandemonium"] = "sid=21",
    ["garuda"] = "sid=22",
    ["cerberus"] = "sid=23",
    ["kujata"] = "sid=24",
    ["bismarck"] = "sid=25",
    ["seraph"] = "sid=26",
    ["lakshmi"] = "sid=27",
    ["asura"] = "sid=28",
    ["midgardsormr"] = "sid=29",
    ["fairy"] = "sid=30",
    ["remora"] = "sid=31",
    ["hades"] = "sid=32"
}

getSalesRating = function(rating) return rating >= 8 and "Very Fast" or rating >= 4 and "Fast" or rating >= 1 and "Average" or rating >= 1/7 and "Slow" or rating >= 1/30 and "Very Slow" or "Dead Slow" end

function get_sales(item,stack)
	local sales = {}
	local history = {}
	local header = {}
	header['cookie'] = temp_header or servers[settings.server] or servers[defaults.server]
	local result_table = {};
	https.request{
		url = "https://www.ffxiah.com/item/"..item..stack,
		sink = ltn12.sink.table(result_table),
		headers = header
	}

	result = table.concat(result_table)
	local r = (string.gmatch(result,"<title>(.-)%s%-%sFFXIAH.com</title>"))
	for word in r do title = word end
    
    stock = ""
    local re = (string.gmatch(result,"<span%sclass=stock>(%d+)</span>"))
    for word in re do
        stock = word
    end
    
    local ra = (string.gmatch(result,"&nbsp;x(%d+)"))
    for word in ra do
        stack = " x"..word
    end
    
    local se = (string.gmatch(result,'Site.server%s=%s"(%w+)"'))
    for word in se do
        server = word
    end
    
    rate = ""
    last_saleon = nil
    local ru = (string.gmatch(result,'"saleon":(%d+),"seller":%d+,"buyer":%d+,"price":%d+,"seller_name":"%w+","seller_id":%d+,"seller_server":%d+,"buyer_id":%d+,"buyer_name":"%w+","buyer_server":%d+}];'))
    for word in ru do
        last_saleon = tonumber(word)
    end
    
	local t = string.match(result,'Item.sales = (.-);')
    sales = string.gmatch(t,"{(.-)}")
    sales_ = string.gmatch(t,"{(.-)}")
    
    count = 0
    for word in sales_ do
        count = count + 1
    end
  
    if last_saleon then
        true_rating = count * 86400 / (os.time()-last_saleon)
        rating = getSalesRating(true_rating)
    end
    
    
    if rating == "Very Fast" then
        rate = tostring(rating:color(204)).." ("..string.format("%.3f",true_rating)..") sold/day"
    elseif rating == "Fast" then
        rate = tostring(rating:color(258)).." ("..string.format("%.3f",true_rating)..") sold/day"
    elseif rating == "Average" then
        rate = tostring(rating:color(156)).." ("..string.format("%.3f",true_rating)..") sold/day"
    elseif rating == "Slow" then
        rate = tostring(rating:color(264)).." ("..string.format("%.3f",true_rating)..") sold/day"
    elseif rating == "Very Slow" then
        rate = tostring(rating:color(167)).." ("..string.format("%.3f",true_rating)..") sold/day"
    elseif rating == "Dead Slow" then
        rate = tostring(rating:color(160)).." ("..string.format("%.3f",true_rating)..") sold/day"
    end
    
    if t == "null" or t == "[]" then
        rate = ""
    end
    
    windower.add_to_chat(207,"[Server: "..tostring(server:color(201)).."]")
    if stock == '0' then
        windower.add_to_chat(207,"[" ..tostring(title:color(258))..tostring(stack:color(258)).."] [Stock: "..tostring(stock:color(167)).."] [Rate: "..rate.."]")
    else
        windower.add_to_chat(207,"[" ..tostring(title:color(258))..tostring(stack:color(258)).."] [Stock: "..tostring(stock:color(258)).."] [Rate: "..rate.."]")
    end
    
	max = 0
    if t == "null" then
        windower.add_to_chat(207,'No auctionable item.')
    elseif t == "[]" then
        windower.add_to_chat(207,'No sales.')
	else
        for word in sales do
            history['saleon'] = string.match(word,'"saleon":(%d+),')
            history['seller_name'] = string.match(word,'"seller%_name":"(%w+)",')
            history['price'] = string.match(word,'"price":(%d+),')
            history['buyer_name'] = string.match(word,'"buyer%_name":"(%w+)",')
            windower.add_to_chat(207,'('..os.date("%d %b., %Y %H:%M:%S",history['saleon'])..') '..tostring(history['seller_name']:color(5))..string.char(0x81, 0xA8)..tostring(history['buyer_name']:color(5))..' ['..tostring(comma_value(history['price'])..'G'):color(156)..']')
            max = max +1
            if max > 5 then break end
        end
    end
    
    temp_header = nil
end

function get_sales_auto(item,stack)
    if price_list:contains(item) then
        local cached = price_list:get(item)

        windower.add_to_chat(207, "CACHED! -> " .. cached.info)

        return
    end

	local sales = {}
	local history = {}
	local header = {}
	header['cookie'] = temp_header or servers[settings.server] or servers[defaults.server]
	local result_table = {};
	https.request{
		url = "https://www.ffxiah.com/item/"..item..stack,
		sink = ltn12.sink.table(result_table),
		headers = header
	}

	result = table.concat(result_table)
	local r = (string.gmatch(result,"<title>(.-)%s%-%sFFXIAH.com</title>"))
    for word in r do title = word end
    
    local median = ""
    local me = (string.gmatch(result,"format>(%d+)</span>"))
    for word in me do        
        median = word
    end
    
    stock = ""
    local re = (string.gmatch(result,"<span%sclass=stock>(%d+)</span>"))
    for word in re do
        stock = word
    end
    
    local ra = (string.gmatch(result,"&nbsp;x(%d+)"))
    for word in ra do
        stack = " x"..word
    end
    
    local se = (string.gmatch(result,'Site.server%s=%s"(%w+)"'))
    for word in se do
        server = word
    end
    
    rate = ""
    last_saleon = nil
    local ru = (string.gmatch(result,'"saleon":(%d+),"seller":%d+,"buyer":%d+,"price":%d+,"seller_name":"%w+","seller_id":%d+,"seller_server":%d+,"buyer_id":%d+,"buyer_name":"%w+","buyer_server":%d+}];'))
    for word in ru do
        last_saleon = tonumber(word)
    end
    
	local t = string.match(result,'Item.sales = (.-);')
    sales = string.gmatch(t,"{(.-)}")
    sales_ = string.gmatch(t,"{(.-)}")
    
    count = 0
    for word in sales_ do
        count = count + 1
    end
  
    if last_saleon then
        true_rating = count * 86400 / (os.time()-last_saleon)
        rating = getSalesRating(true_rating)
    end   
    
    local info = "[" ..title..stack.."] [Median: "..median.."] [Stock: "..stock.."] [Rate: "..rating.."]"    

    windower.add_to_chat(207, info)
    
	max = 0
    if t == "null" then
        windower.add_to_chat(207,'No auctionable item.')
    elseif t == "[]" then
        windower.add_to_chat(207,'No sales.')
    end
    
    temp_header = nil

    local ability = ItemPrice.new(id, info)
    price_list:push_back(ability)
end

function comma_value(n)
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

function get_item_id(name)
local result = nil
 for i,v in pairs(res.items) do
	if string.lower(v.name) == string.lower(name) or string.lower(v.enl) == string.lower(name) or string.lower(v.id) == string.lower(name) then
	 result = v.id
	end
 end
 return result
end

windower.register_event('add item', function(bag, index, id, count)
    windower.add_to_chat(207, 'new item. bag ' .. bag .. ' - index ' .. index .. ' - id ' .. id .. ' - count ' .. count)

    if bag == inventory and res.items[id] ~= nil then
        get_sales_auto(id, "")
        UpdateGUI(price_list)
    end
end)

windower.register_event('addon command', function(...)
    local args = T{...}
    local server_names = S{"bahamut","shiva","titan","ramuh","phoenix","carbuncle","fenrir","sylph","valefor","alexander","leviathan",
        "odin","ifrit","diabolos","caitsith","quetzalcoatl","siren","unicorn","gilgamesh","ragnarok","pandemonium","garuda","cerberus",
        "kujata","bismarck","seraph","lakshmi","asura","midgardsormr","fairy","remora","hades"}
    
    if args[1] then
        if server_names:contains(args[1]:lower()) then
            if not args[2] then
                windower.add_to_chat(207,"Second argument not specified, use '//price help' for info.")
            elseif args[2]:lower() == "default" then
                if settings.server == args[1]:lower() then
                    windower.add_to_chat(207,'Server '..args[1]:lower()..' already set as default.')
                else
                    settings.server = args[1]:lower()
                    settings:save()
                    windower.add_to_chat(207,'Server '..args[1]:lower()..' set as default.')
                end
            elseif args[2]:lower() == "stack" then
                for i,v in pairs(args) do args[i]=windower.convert_auto_trans(args[i])end
                local item = table.concat(args," ",3):lower()
                local stack = "/?stack=1"
                temp_header = servers[args[1]:lower()]
                
                local id = get_item_id(item)
                if id then
                    get_sales(id,stack)
                else
                    windower.add_to_chat(207,"Item Not Found or wrong command use '//price help' for info.")
                end
            else
                for i,v in pairs(args) do args[i]=windower.convert_auto_trans(args[i]) end
                local item = table.concat(args," ",2):lower()
                local item2 = table.concat(args," ",1):lower()
                local stack = ""
                
                local id = get_item_id(item)
                local id2 = get_item_id(item2)
                if id then
                    temp_header = servers[args[1]:lower()]
                    get_sales(id,stack)
                elseif id2 then
                    temp_header = servers[settings.server:lower()]
                    get_sales(id2,stack)
                else
                    windower.add_to_chat(207,"Item Not Found or wrong command use '//price help' for info.")
                end
            end
        elseif args[1]:lower() == "help" then
            windower.add_to_chat(207,"Pricer Commands:")
            windower.add_to_chat(207,"//price <server> default (set the default server to search)")
            windower.add_to_chat(207,"//price <item> (search a specified item in the default server)")
            windower.add_to_chat(207,"//price stack <item> (search a stack of the specified item in the default server)")
            windower.add_to_chat(207,"//price <server> <item> (search a specified item in the specified server)")
            windower.add_to_chat(207,"//price <server> stack <item> (search a stack of the specified item in the specified server)")
        elseif args[1]:lower() == "stack" then
            for i,v in pairs(args) do args[i]=windower.convert_auto_trans(args[i])end
                local item = table.concat(args," ",2):lower()
                local stack = "/?stack=1"
                temp_header = servers[args[1]:lower()]
                
                local id = get_item_id(item)
                if id then
                    get_sales(id,stack)
                else
                    windower.add_to_chat(207,"Item Not Found or wrong command use '//price help' for info.")
                end
        else
            for i,v in pairs(args) do args[i]=windower.convert_auto_trans(args[i]) end
                local item = table.concat(args," "):lower()
                temp_header = servers[settings.server:lower()]
                local stack = ""
                
                local id = get_item_id(item)
                if id then
                    get_sales(id,stack)
                else
                    windower.add_to_chat(207,"Item Not Found or wrong command use '//price help' for info.")
                end
        end
    else
        windower.add_to_chat(207,"First argument not specified, use '//price help' for info.")
    end
    
end)

--[[Class object of an ffxi Item and price info]]

ItemPrice = {};
ItemPrice.__index = ItemPrice;

--[[
    Create a new ItemPrice 
]]
function ItemPrice.new(id, info)
	local act = setmetatable({}, ItemPrice)
	

	act.id = id
	act.info = info

	return act
end