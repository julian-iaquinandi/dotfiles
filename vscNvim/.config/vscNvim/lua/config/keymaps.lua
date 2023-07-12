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

keyset("n", "<leader>h", function()
    vim.cmd([[:call VSCodeNotify("vscode-nvim-bridge.toast", "test, warning" )]])
end, { noremap = true, silent = true })

-- -- Keep the cursor in the middle when scrolling
keyset("n", "<C-d>", "<C-d>zz")
keyset("n", "<C-u>", "<C-u>zz")

-- -- Keep the cursor in the middle when searching
keyset("n", "n", "nzzzv")
keyset("n", "N", "Nzzzv")

