-- n, v, i, t = mode names
local key = vim.keymap

-- Navigation
-- vim.cmd([[nnoremap <A-j> <C-w>h]])
-- vim.cmd([[nnoremap <A-k> <C-w>j]])
-- vim.cmd([[nnoremap <A-l> <C-w>k]])
-- vim.cmd([[nnoremap <A-;> <C-w>l]])
--
-- vim.cmd([[tnoremap <A-j> <C-\><C-n><C-w>h]])
-- vim.cmd([[tnoremap <A-k> <C-\><C-n><C-w>j]])
-- vim.cmd([[tnoremap <A-l> <C-\><C-n><C-w>k]])
-- vim.cmd([[tnoremap <A-;> <C-\><C-n><C-w>l]])

key.set("i", "<C-b>", "<ESC>^i", { desc = "beginning of line" })
key.set("i", "<C-e>", "<End>", { desc = "end of line" })

--
key.set("n", "<Esc>", ":noh <CR>", { desc = "clear highlights" })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
key.set("n", "k", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "down", expr = true })

key.set("n", "l", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "up", expr = true })

key.set("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
key.set("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- Editor ops
key.set("n", "<C-s>", "<cmd> w <CR>", { desc = "save file" })
key.set("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "copy whole file" })

key.set("n", "<leader>n", "<cmd> set nu! <CR>", { desc = "toggle line number" })
key.set("n", "<leader>rn", "<cmd> set rnu! <CR>", { desc = "toggle relative number" })

key.set("n", "<leader>l", "", { desc = "" })
key.set("n", "<leader>lz", "<cmd> Lazy<cr>", { desc = "Lazy" })

-- Buffers
key.set("n", "<leader>bc", "<cmd> enew <CR>", { desc = "Create buffer" })
key.set("n", "<leader>bn", "<cmd> bn <CR>", { desc = "Next buffer" })
key.set("n", "<leader>bp", "<cmd> bp <CR>", { desc = "Previous buffer" })
-- key.set("n", "<leader>ch", "<cmd> NvCheatsheet <CR>", { desc = "Mapping cheatsheet" })

-- file operations
key.set("n", "<leader>w", ":w<cr>", { desc = "Write File" })
key.set("n", "<leader>W", ":wa<cr>", { desc = "Write File" })
key.set("n", "<leader>n", ":bp<cr>", { desc = "Last buffer" })
key.set("n", "<leader>m", ":bn<cr>", { desc = "Next buffer" })
key.set("n", "<leader>q", ":bd<cr>", { desc = "Close File" })
key.set("n", "<leader>Q", ":bd!<cr>", { desc = "Force close File" })
key.set("n", "<leader>x", ":wqa<cr>", { desc = "Quit Neovim" })
key.set("n", "<leader>X", ":qa!<cr>", { desc = "Quit Neovim" })
key.set("n", "<leader>z", "<cmd> notify.dismiss()<CR>", { desc = "Dismiss notify" })

key.set("n", "-", require("oil").open, { desc = "Open parent directory" })
key.set("n", "<leader>e", ":Oil --float .<cr>", { desc = "Open parent directory" })

-- zoom
-- vim.cmd([[tnoremap <A-S-;> <C-\><C-n><C-w>>]])
-- vim.cmd([[inoremap <A-j> <C-w>h]])
-- vim.cmd([[inoremap <A-k> <C-w>j]])
-- vim.cmd([[inoremap <A-l> <C-w>k]])
-- vim.cmd([[inoremap <A-;> <C-w>l]])

--
-- M.general = {
--   i = {
--     -- go to  beginning and end
--     ["<C-b>"] = { "<ESC>^i", "beginning of line" },
--     ["<C-e>"] = { "<End>", "end of line" },
--   },
--
--   n = {
--     ["<Esc>"] = { ":noh <CR>", "clear highlights" },
--
--     ["<C-s>"] = { "<cmd> w <CR>", "save file" },
--
--     ["<C-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },
--
--     ["<leader>n"] = { "<cmd> set nu! <CR>", "toggle line number" },
--     ["<leader>rn"] = { "<cmd> set rnu! <CR>", "toggle relative number" },
--
--     -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
--     ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
--     ["l"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
--     ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
--     ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
--
--     -- new buffer
--     ["<leader>bn"] = { "<cmd> enew <CR>", "new buffer" },
--     ["<leader>ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },
--
--     ["<leader>w"] = { ":w<cr>", "Write File" },
--     ["<leader>q"] = { ":bd<cr>", "Close File" },
--     ["<leader>Q"] = { ":bd!<cr>", "Force close File" },
--     ["<leader>m"] = { ":bn<cr>", "Last buffer" },
--     ["<leader>x"] = { ":wq<cr>", "Quit Neovim" },
--     ["<leader>z"] = { "<cmd> notify.dismiss()<CR>", "Dismiss notify" },
--
--     -- Zoom
--     ["<A-z>"] = {
--       function()
--         vim.cmd "NeoZoomToggle"
--       end,
--       "Zoom",
--     },
--   },
--
--   t = {
--     ["<A-z>"] = {
--       function()
--         vim.cmd [[ ]]
--         vim.cmd "NeoZoomToggle"
--       end,
--       "Zoom",
--     },
--   },
--
--   v = {
--     ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
--     ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
--   },
--
--   x = {
--     ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move left", opts = { expr = true } },
--     ["l"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move down", opts = { expr = true } },
--     -- Don't copy the replaced text after pasting in visual mode
--     -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
--     ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "dont copy replaced text", opts = { silent = true } },
--   },
-- }

-- M.tabufline = {
--   plugin = true,
--
--   n = {
--     -- cycle through buffers
--     ["<TAB>"] = {
--       function()
--         require("nvchad_ui.tabufline").tabuflineNext()
--       end,
--       "goto next buffer",
--     },
--
--     ["<S-Tab>"] = {
--       function()
--         require("nvchad_ui.tabufline").tabuflinePrev()
--       end,
--       "goto prev buffer",
--     },
--
--     -- close buffer + hide terminal buffer
--     ["<leader>x"] = {
--       function()
--         require("nvchad_ui.tabufline").close_buffer()
--       end,
--       "close buffer",
--     },
--   },
-- }
--
-- M.blankline = {
--   plugin = true,
--
--   n = {
--     ["<leader>cc"] = {
--       function()
--         local ok, start = require("indent_blankline.utils").get_current_context(
--           vim.g.indent_blankline_context_patterns,
--           vim.g.indent_blankline_use_treesitter_scope
--         )
--
--         if ok then
--           vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
--           vim.cmd [[normal! _]]
--         end
--       end,
--
--       "Jump to current_context",
--     },
--   },
-- }

-- M.comment = {
--   plugin = true,
--   --
--   -- toggle comment in both modes
--   n = {
--     ["<leader>/"] = {
--       function()
--         require("Comment.api").toggle.linewise.current()
--       end,
--       "toggle comment",
--     },
--   },
--   --
--   v = {
--     ["<leader>/"] = {
--       "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
--       "toggle comment",
--     },
--   },
-- }

-- M.gitsigns = {
--   plugin = true,
--
--   n = {
--     -- Navigation through hunks
--     ["]c"] = {
--       function()
--         if vim.wo.diff then
--           return "]c"
--         end
--         vim.schedule(function()
--           require("gitsigns").next_hunk()
--         end)
--         return "<Ignore>"
--       end,
--       "Jump to next hunk",
--       opts = { expr = true },
--     },
--
--     ["[c"] = {
--       function()
--         if vim.wo.diff then
--           return "[c"
--         end
--         vim.schedule(function()
--           require("gitsigns").prev_hunk()
--         end)
--         return "<Ignore>"
--       end,
--       "Jump to prev hunk",
--       opts = { expr = true },
--     },
--
--     -- Actions
--     ["<leader>rh"] = {
--       function()
--         require("gitsigns").reset_hunk()
--       end,
--       "Reset hunk",
--     },
--
--     ["<leader>ph"] = {
--       function()
--         require("gitsigns").preview_hunk()
--       end,
--       "Preview hunk",
--     },
--
--     ["<leader>gb"] = {
--       function()
--         package.loaded.gitsigns.blame_line()
--       end,
--       "Blame line",
--     },
--
--     ["<leader>td"] = {
--       function()
--         require("gitsigns").toggle_deleted()
--       end,
--       "Toggle deleted",
--     },
--   },
-- }

-- M.NeoZoom = {
--   plugin = true,
--
--   n = {
--     ["<C-k>"] = {
--       function()
--         vim.cmd "NeoZoomToggle"
--       end,
--       "Zoom",
--     },
--     { silent = true, nowait = true },
--     -- vim.keymap.set("n", "<CR>", nd, { silent = true, nowait = true })
--   },
-- }

-- M.nvimtree = {
--   plugin = true,
--
--   n = {
--     -- toggle
--     ["<leader>n"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
--
--     -- focus
--     ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
--   },
-- }

-- return M
