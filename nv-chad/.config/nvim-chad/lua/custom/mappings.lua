local M = {}

M.lsp = {
	n = {
		["<leader>aa"] = { ":lua vim.lsp.buf.code_action()<cr>", "lsp code action", opts = { silent = true } },
		["<leader>ar"] = { ":lua vim.lsp.buf.rename()<cr>", "lsp rename symbol" },
		["<leader>af"] = { ": lua vim.lsp.buf.format()<cr>", "lsp format document" },
	},
}

M.Navigation = {
	n = {
		["<A-j>"] = { ":<C-U>TmuxNavigateLeft<cr>", "focus left" },
		["<A-k>"] = { ":<C-U>TmuxNavigateDown<cr>", "focus down" },
		["<A-l>"] = { ":<C-U>TmuxNavigateUp<cr>", "focus up" },
		["<A-;>"] = { ":<C-U><cmd> TmuxNavigateRigth<cr>", "focus right" },
		["<leader>,"] = { "<cmd> bn <cr>", "next buffer" },
		["<leader>n"] = { "<cmd> bp <cr>", "previous buffer" },
	},
}

M.FileOps = {
	n = {
		["<leader>w"] = { "<cmd> w <cr>", "write file" },
		["<leader>W"] = { "<cmd> wa <cr>", "write all files" },
		["<leader>xx"] = { "<cmd> wqa <cr>", "write & quit" },
		["<leader>XX"] = { "<cmd> qa! <cr>", "force quit" },
		["<leader>q"] = { "<cmd> SmartQ<cr>", "close file" },
		["<leader>Q"] = { "<cmd> SmartQ!<cr>", "close file force" },
		["<leader>xb"] = { "<cmd>%bd|e#<cr>", "close all buffers but current" },
	},
}

M.Find = {
	n = {
		["<leader>p"] = { "<cmd> Telescope git_files <cr>", "find files p" },
		["P"] = { "<cmd>HopPasteChar1<cr>", "paste at position" },
		["<leader>y"] = { "<cmd>HopYankChar1<cr>", "yank between positions" },
	},
}

M.Git = {
	n = {
		["<leader>ga"] = { "<cmd> Git add -A <cr>", "git add all" },
		["<leader>gc"] = { "<cmd> Git commit<cr>", "git commit" },
		["<leader>gp"] = { "<cmd> Git push<cr>", "git commit" },
		["<leader>gC"] = { "<cmd> Telescope git_commits<cr>", "git show commits" },
		["<leader>gs"] = { "<cmd> Telescope git_status<cr>", "git show status" },
		["<leader>gS"] = { "<cmd> Telescope git_stash<cr>", "git show stashes" },
		["<leader>gb"] = { "<cmd> Telescope git_branches<cr>", "git show branches" },
		["<leader>gg"] = { "<cmd> Git add -A | Git commit <cr>", "Lazy Git" },
	},
}

M.Lazy = {
	-- plugin = true,
	n = {
		["<leader>lz"] = { "<cmd> Lazy <cr>", "Lazy" },
		["<leader>lg"] = { "<cmd> LazyGit <cr>", "LazyGit" },
	},
}

M.Dap = {
	plugin = true,
	n = {
		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
		["<leader>dr"] = {
			"<cmd> DapContinue <CR>",
			"Run or continue the debugger",
		},
		["<leader>dus"] = {
			function()
				local widgets = require("dap.ui.widgets")
				local sidebar = widgets.sidebar(widgets.scopes)
				sidebar.open()
			end,
			"Open debugging sidebar",
		},
	},
}

M.Crates = {
	plugin = true,
	n = {
		["<leader>rcu"] = {
			function()
				require("crates").upgrade_all_crates()
			end,
			"update crates",
		},
	},
}

return M
