local json = require("utils.dkjson")

local M = {}

local function read(filepath)
    local f = assert(io.open(filepath, "rb"))
    local content = f:read("*all")
    f:close()
    return content
end

local function write(filepath, content)
    local f = assert(io.open(vim.fn.expand(filepath), "w+"))
    f:write(vim.inspect(content))
    f:close()
end

M.write = write
M.read = read

return M
