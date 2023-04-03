local keySet = vim.keymap.set
local noremapSilent = { noremap = true, silent = true }

return {
    "ggandor/leap.nvim",
    event = "VimEnter",
    config = function()
        local leap = require('leap')
        leap.add_default_mappings()

        local function get_targets(winid)
            local wininfo = vim.fn.getwininfo(winid)[1]
            local cur_line = vim.fn.line('.')
            -- Get targets.
            local targets = {}
            local lnum = wininfo.topline
            while lnum <= wininfo.botline do
                -- Skip folded ranges.
                local fold_end = vim.fn.foldclosedend(lnum)
                if fold_end ~= -1 then
                    lnum = fold_end + 1
                else
                    if lnum ~= cur_line then
                        table.insert(targets, { pos = { lnum, 1 } })
                    end
                    lnum = lnum + 1
                end
            end
            -- Sort them by vertical screen distance from cursor.
            local cur_screen_row = vim.fn.screenpos(winid, cur_line, 1)['row']
            local function screen_rows_from_cursor(t)
                local t_screen_row = vim.fn.screenpos(winid, t.pos[1], t.pos[2])['row']
                return math.abs(cur_screen_row - t_screen_row)
            end
            table.sort(targets, function(t1, t2)
                return screen_rows_from_cursor(t1) < screen_rows_from_cursor(t2)
            end)
            if #targets >= 1 then return targets end
        end

        -- Map this function to your preferred key.
        local function leap_lines()
            local winid = vim.api.nvim_get_current_win()
            leap { targets = get_targets(winid), target_windows = { winid }, }
        end

        keySet("n", "vo", function()
            -- vim.cmd([[:HopLineStart]])
            leap_lines()
            vim.schedule(function()
                vim.cmd([[normal! o]])
                vim.cmd([[startinsert]])
            end)
        end, noremapSilent)

        keySet("n", "vO", function()
            leap_lines()
            -- vim.cmd([[:HopLineStart]])
            vim.schedule(function()
                vim.cmd([[normal! O]])
                vim.cmd([[startinsert]])
            end)
        end, noremapSilent)
    end
}
