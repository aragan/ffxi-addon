--[[
Copyright (c) 2014, Matt McGinty
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
    * Neither the name of <addon name> nor the
    names of its contributors may be used to endorse or promote products
    derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL <your name> BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

--[[A simple List data structure library]]

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
    Add a new item to the start of a list
    Parameters:
    list: List to add item to
    item: Item to add to the list
]]
function List.push_front(list, item)
    if list.count ~= 0 then
        list.first = list.first - 1
    end   

    list.items[list.first] = item;
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

    for idx = list.first, list.last do
        if list.items[idx] == itemid then
            removeAt = idx;
        end
    end

    if removeAt == nil then
        return;
    end

    if removeAt ~= nil then
        list.items[removeAt] = nil;

        for idx = removeAt + 1, list.last do
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
    for idx = list.first, list.last do
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
    for idx = list.first, list.last do
        list.items[idx] = nil
    end

    list.first = 1
    list.last = 1
    list.count = 0
end

--[[
    Check if a list contains an item and return index
    Returns -1 on fail
    Parameters:
    list: List to search
    item: Item to search for
]]
function List.find_by_id(list, id)
    for idx = list.first, list.last do
        if list.items[idx].id == id then
            return idx
        end
    end

    return -1
end