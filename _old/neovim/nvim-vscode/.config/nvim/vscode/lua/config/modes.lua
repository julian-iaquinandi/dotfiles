local M = {}

M.navigation = function(libmodal)
    local layer = libmodal.layer.new({
        n = { -- normal mode mappings
            k = {
                rhs = '<C-d>zz',
                noremap = true,
                -- other options such as `noremap` and `silent` can be set to `true` here
            },
            l = {
                rhs = '<C-u>zz',
                noremap = true,
            },
            j = {
                rhs = '{',
                noremap = true,
                -- other options such as `noremap` and `silent` can be set to `true` here
            },
            [';'] = {
                rhs = '}',
                noremap = true,
            },
        }
    })

    -- mappings
    layer:map('n', '<Esc>', function() layer:exit() end, {})
    -- Type `<Leader>ll` in normal mode to enter the layer
    vim.keymap.set('n', 'gm', function() layer:enter() end, {})
    --[[ unmap `gg`. Notice that now both `gg` and `G` return the cursor to the top. ]]
    layer:unmap(nil, 'n', 'gm')
    
    -- return layer
end

return M

-- local function show_macros()
--     vim.api.nvim_command 'ShowMacros()'
-- end

-- m = {
--     rhs = show_macros
-- }