local noremapSilent = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
-- Escape normal mode + terminal swapping
keymap('i', 'jk', '<Esc>', { noremap = false })
keymap('t', 'jk', '<C-\\><C-n>', { noremap = false })

-- Remap hjkl to jkl;
keymap("n", "j", "h", noremapSilent)
keymap("n", "k", "j", noremapSilent)
keymap("n", "l", "k", noremapSilent)
keymap("n", ";", "l", noremapSilent)

-- Nvim Tmux movement keys
vim.g.tmux_navigator_save_on_switch = 1
keymap("n", "<M-j>", ":TmuxNavigateLeft<cr>", noremapSilent)
keymap("n", "<M-k>", ":TmuxNavigateDown<cr>", noremapSilent)
keymap("n", "<M-l>", ":TmuxNavigateUp<cr>", noremapSilent)
keymap("n", "<M-;>", ":TmuxNavigateRight<cr>", noremapSilent)

--
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

-- Snippets
keymap("n", "<C-J>", "<Plug>(vsnip-expand)", noremapSilent)

-- Copy
keymap("v", "c", "<Plug>OscYank<cr>", {noremap = true})
-- vim.api.nvim_set_keymap("n", "gy", ":normal y :normal v :normal gv ", noremapSilent)

-- lsp -- see lspconfig.lua
-- keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", noremapSilent)
-- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", noremapSilent)
-- keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", noremapSilent)
-- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", noremapSilent)
-- keymap("n", "gr", "<cmd>Trouble lsp_references<cr>", noremapSilent)
-- vim.api.nvim_set_keymap("n", "gl", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = 'rounded' })<CR>", noremapSilent)
-- keymap("n", "g;", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", noremapSilent)
-- keymap("n", "gj", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", noremapSilent)
-- keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", noremapSilent)
-- keymap("n", "gl", "<cmd>lua vim.lsp.buf.hover()<CR>", noremapSilent)
-- keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", noremapSilent)
