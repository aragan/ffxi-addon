require 'refresh'

function pathsearch(files_list)

    -- base directory search order:
    -- windower
    -- %appdata%/Windower/GearSwap
    
    -- sub directory search order:
    -- libs-dev (only in windower addon path)
    -- libs (only in windower addon path)
    -- data/player.name
    -- data/common
    -- data
    
    local gearswap_data = windower.addon_path .. 'data/'
    local gearswap_appdata = (os.getenv('APPDATA') or '') .. '/Windower/GearSwap/'
    
    local search_path = {
        [1] = windower.addon_path .. 'libs-dev/',
        [2] = windower.addon_path .. 'libs/',
        [3] = gearswap_data .. player.name .. '/',
        [4] = gearswap_data .. 'common/',
        [5] = gearswap_data,
        [6] = gearswap_appdata .. player.name .. '/',
        [7] = gearswap_appdata .. 'common/',
        [8] = gearswap_appdata,
        [9] = windower.windower_path .. 'addons/libs/'
    }
    
    local user_path
    local normal_path

    for _,basepath in ipairs(search_path) do
        if windower.dir_exists(basepath) then
            for i,v in ipairs(files_list) do
                if v ~= '' then
                    if include_user_path then
                        user_path = basepath .. include_user_path .. '/' .. v
                    end
                    normal_path = basepath .. v
                    
                    if user_path and windower.file_exists(user_path) then
                        return user_path,basepath,v
                    elseif normal_path and windower.file_exists(normal_path) then
                        return normal_path,basepath,v
                    end
                end
            end
        end
    end
    
    return false
end
