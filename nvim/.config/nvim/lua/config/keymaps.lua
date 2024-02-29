-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local opts = { noremap = true, silent = true }

-- Move focus
vim.api.nvim_set_keymap("n", "<A-m>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<A-,>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<A-.>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<A-/>", "<C-w>l", opts)

-- Exit insert mode
vim.api.nvim_set_keymap("i", "jk", "<ESC><C-w>w i", opts)
vim.api.nvim_set_keymap("i", "jj", "<ESC>", opts)
vim.api.nvim_set_keymap("i", "jl", "<C-\\><C-n><C-w>w :lua SwapBufferAndResize()<CR>", { noremap = true })

-- Exit terminal mode
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n><C-w>w", { noremap = true })
vim.api.nvim_set_keymap("t", "jj", "<C-\\><C-n>", { noremap = true })
vim.api.nvim_set_keymap("t", "jl", "<C-\\><C-n><C-w>w :lua SwapBufferAndResize()<CR>", { noremap = true })

-- Remap movement keys
vim.api.nvim_set_keymap("n", "j", "h", opts)
vim.api.nvim_set_keymap("n", "k", "j", opts)
vim.api.nvim_set_keymap("n", "l", "k", opts)
vim.api.nvim_set_keymap("n", ";", "l", opts)

-- return {
--   { "<A-m>", "<cmd><C-w>h", "focus left" },
--   { "<A-,>", "<cmd><C-w>j", "focus down" },
--   { "<A-.>", "<cmd><C-w>k", "focus up" },
--   { "<A-/>", "<cmd><C-w>l", "focus right" },
-- }
