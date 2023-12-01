local key = vim.keymap

-- Define the function to open a program in a slide-up terminal
-- local function open_in_term(cmd, on_exit)
-- 	-- Create a new window
-- 	vim.cmd("new")
-- 	-- Open a terminal
-- 	local shell_cmd = vim.o.shell .. " -c " .. cmd
-- 	if on_exit then
-- 		vim.fn.termopen(shell_cmd, { on_exit = on_exit, win = vim.fn.win_getid() })
-- 	else
-- 		vim.fn.termopen(shell_cmd)
-- 	end
-- 	-- Send window to bottom and start with small height
-- 	vim.cmd("wincmd J | resize 1")
-- 	-- Animate height to 66% - Note: This part might need a specific Lua implementation of the animate feature
-- 	vim.cmd("startinsert")
-- end
--
-- vim.api.nvim_set_keymap("n", "<leader>ld", '<Cmd>lua open_in_term("lazydocker")<CR>', { noremap = true, silent = true })

-- key.set('n', '<leader>ld', '<Cmd>lua open_in_term("lazydocker")<CR>', { noremap = true, silent = true })
-- key.set('n', '<leader>lg', '<Cmd>lua open_in_term("lazygit")<CR>', { noremap = true, silent = true })

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
key.set("n", "k", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "down", expr = true })
key.set("n", "l", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "up", expr = true })
key.set("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
key.set("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- Editor ops
key.set("n", "<Esc>", ":noh <CR>", { desc = "clear highlights" })

-- copilot
key.set("n", "<C-S-j>", "<Plug>(copilot-next)", { desc = "copilot next" })
key.set("n", "<C-S-;>", "<Plug>(copilot-previous)", { desc = "copilot prev" })

-- clipboard
key.set("n", "<leader>y", "+y", { desc = "quit neovim" })
key.set("n", "<C-f>", "!tmux neww tmux-sessionizer<cr>", { desc = "open parent directory", silent = true })

-- vim.g:tmux_navigator_no_mappings = 1
vim.cmd([[noremap <silent> A-j :<C-U>TmuxNavigateLeft<cr>]])
vim.cmd([[noremap <silent> A-k :<C-U>TmuxNavigateDown<cr>]])
vim.cmd([[noremap <silent> A-l :<C-U>TmuxNavigateUp<cr>]])
vim.cmd([[noremap <silent> A-; :<C-U>TmuxNavigateRight<cr>]])
vim.cmd([[noremap <silent> A-h :<C-U>TmuxNavigatePrevious<cr>]])

-- Map the function to a key combination

-- key.set("n", "<leader>n", "<cmd> set nu! <CR>", { desc = "toggle line number" })
-- key.set("n", "<leader>rn", "<cmd> set rnu! <CR>", { desc = "toggle relative number" })
--
-- key.set("n", "-", require("oil").open, { desc = "open parent directory" })
-- key.set("n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<cr>", { desc = "open explorer" })
--key.set("n", "<C-o>", "<C-o>zz", { desc = "open parent directory", silent = true })
--key.set("n", "<C-i>", "<C-i>zz", { desc = "open parent directory", silent = true })
--key.set("n", "<A-j> <C-w>h", { desc = "focus left", silent = true})
--key.set("n", "<A-;> <C-w>l", { desc = "focus right", silent = true})

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
