local json = require('utils.json')
local file = require('utils.file')
local string = require('utils.string')


vim.cmd('command! -nargs=1 RegToMacro lua require("macroHelper").reg_to_macro(<f-args>)')

local function convert_to_function(contents, funcName)
    -- Convert the contents to a Lua function

    local vimscript_func = "function " .. funcName .. "()\n  " .. contents .. "\nendfunction"
    local vimscript_let = "let tester = " .. "'" .. contents .. "'"
    -- local lua_func = "function " .. funcName .. "()\n" .. "  " .. contents .. "end"


    print(vimscript_let)
    return vimscript_let
end

local function reg_to_macro(args)
    local _args = string.split(args)
    local register = _args[1]

    local funcName = _args[2]
    local contents = vim.fn.getreg(register)

    local macro_file_path = "C:\\Users\\Administrator\\AppData\\Local\\nvim\\lua\\macroHelper\\macros.json"
    local json_file = file.read(macro_file_path)

    local currentJsonFileTable = json.decode(json_file)
    -- print(currentJsonFileTable.test)

    currentJsonFileTable.test = "This is a new test"

    local newJsonFileString = json.encode(currentJsonFileTable)

    print(newJsonFileString)

    file.write(macro_file_path, newJsonFileString)
end

return {
    reg_to_macro = reg_to_macro
}
