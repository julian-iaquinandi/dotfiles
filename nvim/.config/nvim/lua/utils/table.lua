local M = {}

M.dump = function(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. M.dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

M.get_keys = function(t)
    local keys = {}
    for key, _ in pairs(t) do
        table.insert(keys, key)
    end
    return keys
end

M.print = function(table)
    print(M.dump(table))
end

M.utils_Set = function(list)
    local set = {}
    for _, l in ipairs(list) do set[l] = true end
    return set
end

M.contains = function(table, key)
    local _set = M.utils_Set(table)
    if _set[key] then return true end
    return false
end

return M
