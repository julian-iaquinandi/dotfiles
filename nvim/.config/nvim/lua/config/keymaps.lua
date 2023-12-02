local key = vim.keymap

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
key.set("n", "k", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "down", expr = true })
key.set("n", "l", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "up", expr = true })
key.set("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
key.set("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })

-- vim.g:tmux_navigator_no_mappings = 1
vim.cmd([[noremap <silent> A-j :<C-U>TmuxNavigateLeft<cr>]])
vim.cmd([[noremap <silent> A-k :<C-U>TmuxNavigateDown<cr>]])
vim.cmd([[noremap <silent> A-l :<C-U>TmuxNavigateUp<cr>]])
vim.cmd([[noremap <silent> A-; :<C-U>TmuxNavigateRight<cr>]])
vim.cmd([[noremap <silent> A-h :<C-U>TmuxNavigatePrevious<cr>]])

-- Editor ops
key.set("n", "<Esc>", ":noh <CR>", { desc = "clear highlights" })

-- copilot
key.set("n", "<C-S-j>", "<Plug>(copilot-next)", { desc = "copilot next" })
key.set("n", "<C-S-;>", "<Plug>(copilot-previous)", { desc = "copilot prev" })

-- clipboard
key.set("n", "<leader>y", "+y", { desc = "quit neovim" })
key.set("n", "<C-f>", "!tmux neww tmux-sessionizer<cr>", { desc = "open parent directory", silent = true })

key.set("n", "<A-h>", "<C-w><C-w><cr>", { desc = "move into diagnostic" })

-- which key mappings
return {
	["?"] = {
		name = "which",
		q = { "<cmd>WhichKey<cr>", "which-key query lookup" },
		w = { "<cmd>WhichKey<cr>", "which-key all keymaps" },
	},

	a = {
		c = { vim.lsp.buf.code_action, "code action" },
	},

	b = {
		name = "buffer",
		c = { "<cmd> enew <CR>", "create buffer" },
		d = { "<cmd> bd <CR>", "delete buffer" },
	},

	e = { ":NvimTreeToggle <CR>", "explorer toggle" },

	f = {
		name = "find",
		n = { "<cmd> NvimTreeToggle<cr>", "toggle file explorer" },
		f = { "<cmd> Telescope find_files<cr>", "find files" },
		a = { "<cmd> Telescope live_grep<cr>", "find all" },
		o = { "<cmd> Telescope oldfiles<cr>", "find old files" },
		h = { "<cmd> Telescope help_tags<cr>", "find help pages" },
		c = { "<cmd> Telescope command_history<cr>", "find command history" },
		C = { "<cmd> Telescope commands<cr>", "find commands" },
		k = { "<cmd> Telescope keymaps<cr>", "find key maps" },
	},

	g = {
		name = "git",
		c = { "<cmd> Telescope git_commits<cr>", "find git commits" },
		s = { "<cmd> Telescope git_status<cr>", "find git status" },
		S = { "<cmd> Telescope git_stash<cr>", "find git stash" },
		b = { "<cmd> Telescope git_branches<cr>", "find git branches" },
		g = { "<cmd> LazyGit<cr>", "Lazy Git" },
	},

	l = {
		name = "lazy",
		z = { "<cmd> Lazy<cr>", "Lazy" },
		d = { "<cmd> LazyDocker<cr>", "Lazy Docker" },
		g = { "<cmd> LazyGit<cr>", "Lazy Git" },
	},

	m = { "<cmd> bn <CR>", "next buffer" },
	n = { "<cmd> bp <CR>", "previous buffer" },

	p = { "<cmd> Telescope git_files<cr>", "find git files" },

	q = { "<cmd> bd <CR>", "quit file" },
	Q = { "<cmd> bd! <CR>", "quit file" },

	r = {
		name = "refactor",
		n = { vim.lsp.buf.rename, "rename" },
		s = { ":LspRestart<cr>" },
	},

	-- file ops
	w = { "<cmd> w <CR>", "write file" },
	W = { "<cmd> wa <CR>", "write all file" },
	x = { "<cmd> wqa <CR>", "quit all file" },
	X = { "<cmd> qa! <CR>", "quit all file" },
}

-- r = {
--   name = "refactor",
--   r = { "<Plug>(coc-codeaction-refactor)", "refactor" },
--   s = { "<Plug>(coc-codeaction-refactor-selected)", "refactor selected" },
--   n = { "<Plug>(coc-rename)", "rename" },
-- },

-- c = {
--   name = "coc",
--   a = { "<C-u>CocList diagnostics<cr>", "diagnostics" },
--   e = { "<C-u>CocList extensions<cr>", "extensions" },
--   c = { "<C-u>CocList commands<cr>", "commands" },
--   o = { "<C-u>CocList outline<cr>", "outline" },
--   s = { "<C-u>CocList -I symbols<cr>", "symbols" },
--   j = { "<C-u>CocNext<cr>", "next" },
--   k = { "<C-u>CocPrev<cr>", "prev" },
--   p = { "<C-u>CocListResume<cr>", "resume" },
-- },

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
