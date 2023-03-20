local M = {}

local function read(filepath)
    local f = assert(io.open(filepath, "rb"))
    local content = f:read("*all")
    f:close()
    return tostring(content)
end

local function write(filepath, content)
    local f = io.open(filepath, "w+")
    f:write(content)
    f:close()
end

M.write = write
M.read = read

return M
