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
key.set("n", "<leader>bc", "<cmd> enew <CR>", { desc = "create buffer" })
key.set("n", "<leader>bn", "<cmd> bn <CR>", { desc = "next buffer" })
key.set("n", "<leader>bp", "<cmd> bp <CR>", { desc = "previous buffer" })
-- key.set("n", "<leader>ch", "<cmd> NvCheatsheet <CR>", { desc = "Mapping cheatsheet" })

-- file operations
key.set("n", "<leader>w", ":w<cr>", { desc = "write file" })
key.set("n", "<leader>W", ":wa<cr>", { desc = "Write file" })
key.set("n", "<leader>n", ":bp<cr>", { desc = "last buffer" })
key.set("n", "<leader>m", ":bn<cr>", { desc = "next buffer" })
key.set("n", "<leader>q", ":bd<cr>", { desc = "close file" })
key.set("n", "<leader>Q", ":bd!<cr>", { desc = "force close file" })
key.set("n", "<leader>x", ":wqa<cr>", { desc = "quit neovim" })
key.set("n", "<leader>X", ":qa!<cr>", { desc = "quit neovim" })

key.set("n", "-", require("oil").open, { desc = "open parent directory" })
key.set("n", "<leader>e", ":Oil --float<cr>", { desc = "open parent directory" })

key.set("n", "<C-f>", "!tmux neww tmux-sessionizer<cr>", { desc = "open parent directory", silent = true })

key.set("n", "<C-o>", "<C-o>zz", { desc = "open parent directory", silent = true })
key.set("n", "<C-i>", "<C-i>zz", { desc = "open parent directory", silent = true })
