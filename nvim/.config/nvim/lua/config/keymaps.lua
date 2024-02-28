-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<A-m>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-,>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-.>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-/>", "<C-w>l", { noremap = true, silent = true })

-- return {
--   { "<A-m>", "<cmd><C-w>h", "focus left" },
--   { "<A-,>", "<cmd><C-w>j", "focus down" },
--   { "<A-.>", "<cmd><C-w>k", "focus up" },
--   { "<A-/>", "<cmd><C-w>l", "focus right" },
-- }
