local json = require("libs.dkjson")

local M = {}

local function decode(json_file_string)
    local currentJsonFileTable

    local obj, pos, err = json.decode(json_file_string, 1, nil)
    if err then
        print("Error:", err)
    else
        if (obj) then
            currentJsonFileTable = obj
        end
    end

    return currentJsonFileTable
end

local function encode(lua_table)
    local str = json.encode(lua_table, { indent = true })
    return str
end

M.decode = decode
M.encode = encode

return M
