vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])


local noremapSilent = { noremap = true, silent = true }
local remap = vim.api.nvim_set_keymap
local keyset = vim.keymap.set

-- Escape normal mode + terminal swapping
remap("i", "jk", "<Esc>", { noremap = false })
remap("t", "jk", "<C-\\><C-n>", { noremap = false })

-- Remap hjkl to jkl;
remap("n", "j", "h", noremapSilent)
remap("n", "k", "j", noremapSilent)
remap("n", "l", "k", noremapSilent)
remap("n", ";", "l", noremapSilent)

-- Open file exp
keyset("n", "gf", function()
    vim.cmd([[:call VSCodeNotify("file-navigator.start")]])
end, { noremap = true, silent = true })


-- --------------------------------
-- -- Hop
-- --------------------------------
-- local hop = require('hop')

-- local status, hop = pcall(require, 'hop')
-- if not status then
--     print('Something went wrong:', hop)
-- else
--     local directions = require('hop.hint').HintDirection

--     key.api.nvim_set_keymap.set('', 'f', function()
--         hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
--     end, { remap = true })

--     key('', 'F', function()
--         hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
--     end, { remap = true })

--     key('', 't', function()
--         hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
--     end, { remap = true })

--     key('', 'T', function()
--         hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
--     end, { remap = true })
-- end



-- highlight in function
-- key("n", "vaf", "va{V", noremapSilent)
--

-- Snippets
-- keymap("n", "<C-J>", "<Plug>(vsnip-expand)", noremapSilent)

-- Copy
-- key("v", "<C-c>", "<Plug>OscYank<cr>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "gy", ":normal y :normal v :normal gv ", noremapSilent)

-- --------------------------------
-- -- Nvim Tmux movement keys
-- --------------------------------
-- vim.g.tmux_navigator_save_on_switch = 1
-- key("n", "<M-j>", ":TmuxNavigateLeft<cr>", noremapSilent)
-- key("n", "<M-k>", ":TmuxNavigateDown<cr>", noremapSilent)
-- key("n", "<M-l>", ":TmuxNavigateUp<cr>", noremapSilent)
-- key("n", "<M-;>", ":TmuxNavigateRight<cr>", noremapSilent)

-- --------------------------------
-- -- lsp -- see lspconfig.lua
-- --------------------------------

-- local keymap = vim.keymap.set

-- keymap("v", "K", ":m '>+1<cr>gv=gv")
-- keymap("v", "L", ":m '>-2<cr>gv=gv")

-- keymap("n", "K", "mzJ`z")

-- -- Keep the cursor in the middle when scrolling
-- keymap("n", "<C-d>", "<C-d>zz")
-- keymap("n", "<C-u>", "<C-u>zz")

-- -- Keep the cursor in the middle when searching
-- keymap("n", "n", "nzzzv")
-- keymap("n", "N", "Nzzzv")

-- -- Preserve register on paste
-- keymap("x", "<leader>p", '"_dP')

-- -- Yank to system register
-- keymap("n", "<leader>y", '"+y')
-- keymap("v", "<leader>y", '"+y')
-- keymap("n", "<leader>Y", '"+Y')

-- -- LSP finder - Find the symbol's definition
-- -- If there is no definition, it will instead be hidden
-- -- When you use an action in finder like "open vsplit",
-- -- you can use <C-t> to jump back
-- keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- -- Code action
-- keymap({ "n", "v" }, "ga", "<cmd>Lspsaga code_action<CR>")

-- -- Rename all occurrences of the hovered word for the entire file
-- keymap("n", "gx", "<cmd>Lspsaga rename<CR>")
-- -- Rename all occurrences of the hovered word for the selected files
-- keymap("n", "gX", "<cmd>Lspsaga rename ++project<CR>")

-- -- Peek definition
-- -- You can edit the file containing the definition in the floating window
-- -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- -- It also supports tagstack
-- -- Use <C-t> to jump back
-- keymap("n", "gd", "<CMD>Glance definitions<CR>")
-- keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>")

-- -- Go to definition
-- -- keymap("n", "gD", "<cmd>Lspsaga goto_definition<CR>")

-- -- Peek type definition
-- -- You can edit the file containing the type definition in the floating window
-- -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- -- It also supports tagstack
-- -- Use <C-t> to jump back
-- keymap("n", "gt", "<CMD>Glance type_definitions<CR>")
-- keymap("n", "gT", "<cmd>Lspsaga peek_type_definition<CR>")
-- -- keymap("n", "gT", "<cmd>Lspsaga goto_type_definition<CR>")

-- keymap("n", "gr", "<CMD>Glance references<CR>")
-- keymap("n", "gi", "<CMD>Glance implementations<CR>")

-- -- Show line diagnostics
-- -- You can pass argument ++unfocus to
-- -- unfocus the show_line_diagnostics floating window
-- keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- -- Show cursor diagnostics
-- -- Like show_line_diagnostics, it supports passing the ++unfocus argument
-- keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- -- Show buffer diagnostics
-- keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- -- Diagnostic jump
-- -- You can use <C-o> to jump back to your previous location
-- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- -- Diagnostic jump with filters such as only jumping to an error
-- keymap("n", "[E", function()
-- 	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end)
-- keymap("n", "]E", function()
-- 	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end)

-- -- Toggle outline
-- keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
-- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
-- keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
-- keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
-- keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
-- keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
