--[[Class object of a ffxi chain event (sc/mb) - MMcGinty 2019]]

Chain = {};
Chain.__index = Chain;

--[[
    Create a new Chain 
]]
function Chain.new(params)
	local chain = setmetatable({}, Chain)

	chain.description = params[1]
	chain.expiry = params[2]

	return chain
end