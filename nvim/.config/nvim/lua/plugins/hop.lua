local keys = vim.api.nvim_set_keymap

return {
    'phaazon/hop.nvim',
    event = "VimEnter",
    branch = 'v2',
    config = function()
        local hop = require('hop')

        hop.setup {
            keys = 'etovxqpdygfblzhckisuran'
        }

        -- --------------------------------
        -- -- Keys
        -- --------------------------------
        local directions = require('hop.hint').HintDirection
        local keySet = vim.keymap.set
        local noremapSilent = { noremap = true, silent = true }

        keySet('', 's', function()
            hop.hint_char2({ direction = directions.AFTER_CURSOR })
        end, noremapSilent)

        keySet('', 'S', function()
            hop.hint_char2({ direction = directions.BEFORE_CURSOR })
        end, noremapSilent)

        keySet('', 'f', function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
        end, noremapSilent)

        keySet('', 'F', function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
        end, noremapSilent)

        keySet('', 't', function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
        end, noremapSilent)

        keySet('', 'T', function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
        end, noremapSilent)

        keySet("n", "vo", function()
            vim.cmd([[:HopLineStart]])
            vim.schedule(function()
                vim.cmd([[normal! o]])
                vim.cmd([[startinsert]])
            end)
        end, { noremap = true, silent = true })

        keySet("n", "vO", function()
            vim.cmd([[:HopLineStart]])
            vim.schedule(function()
                vim.cmd([[normal! O]])
                vim.cmd([[startinsert]])
            end)
        end, { noremap = true, silent = true })
    end,
}
