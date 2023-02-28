List = {};
List.__index = List;

--[[
    Create a new list 
]]
function List.new()
  local self = setmetatable({}, List);
  self.first = 1;
  self.last = 1;
  self.count = 0;
  self.items = {};
  return self
end

--[[
    Add a new item to the end of a list
    Parameters:
    list: List to add item to
    item: Item to add to the list
]]
function List.push_back(list, item)
    if list.count ~= 0 then
        list.last = list.last + 1;
    end

    list.items[list.last] = item;
    list.count = list.count + 1;
end

--[[
    Remove the last item from the list
    Parameters:
    list: List to remove item from
]]
function List.pop_back(list)
    list.items[list.last] = nil;
    list.last = list.last - 1;
    list.count = list.count - 1;

end

--[[
    Remove an item from a list
    Parameters:
    list: List to remove item from
    item: Item to remove
]]
function List.remove(list, itemid)
    local removeAt = nil;

    for idx = list.first, list.first + list.count - 1 do
        if list.items[idx] == itemid then
            removeAt = idx;
        end
    end

    if removeAt == nil then
        return;
    end

    if removeAt ~= nil then
        list.items[removeAt] = nil;

        for idx = removeAt + 1, list.first + list.count - 1 do
            list.items[idx -1] = list.items[idx];
            list.items[idx] = nil;
        end
    end

    list.last = list.last - 1;
    list.count = list.count - 1;

end

--[[
    Check if a list contains an item
    Parameters:
    list: List to search
    item: Item to search for
]]
function List.contains(list, item)
    found = false
    for idx = list.first, list.first + list.count - 1 do
        if list.items[idx] == item then
            found = true
        end
    end

    return found
end

--[[
    Clear a list of all items
    Parameters:
    list: List to clear
]]
function List.clear(list)
    for idx = list.first, list.first + list.count - 1 do
        list.items[idx] = nil
    end

    list.first = 1
    list.last = 1
    list.count = 0
end