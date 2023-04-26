local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local telescope = require("telescope")
			telescope.load_extension("command_palette")

			telescope.setup({
				extensions = {
					command_palette = {
						{
							"File",
							{ "entire selection (C-a)", ':call feedkeys("GVgg")' },
							{ "save current file (C-s)", ":w" },
							{ "save all files (C-A-s)", ":wa" },
							{ "quit (C-q)", ":qa" },
							{
								"file browser (C-i)",
								":lua require'telescope'.extensions.file_browser.file_browser()",
								1,
							},
							{ "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
							{ "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
							{ "files (C-f)", ":lua require('telescope.builtin').find_files()", 1 },
						},
						{
							"Help",
							{ "tips", ":help tips" },
							{ "cheatsheet", ":help index" },
							{ "tutorial", ":help tutor" },
							{ "summary", ":help summary" },
							{ "quick reference", ":help quickref" },
							{ "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
						},
						{
							"Vim",
							{ "reload vimrc", ":source $MYVIMRC" },
							{ "check health", ":checkhealth" },
							{ "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
							{ "commands", ":lua require('telescope.builtin').commands()" },
							{ "command history", ":lua require('telescope.builtin').command_history()" },
							{ "registers (A-e)", ":lua require('telescope.builtin').registers()" },
							{ "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
							{ "vim options", ":lua require('telescope.builtin').vim_options()" },
							{ "keymaps", ":lua require('telescope.builtin').keymaps()" },
							{ "buffers", ":Telescope buffers" },
							{ "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
							{ "paste mode", ":set paste!" },
							{ "cursor line", ":set cursorline!" },
							{ "cursor column", ":set cursorcolumn!" },
							{ "spell checker", ":set spell!" },
							{ "relative number", ":set relativenumber!" },
							{ "search highlighting (F12)", ":set hlsearch!" },
						},
					},
				},
			})
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
		config = function()
			require("nvim-tree").setup({
				view = {
					side = "right",
					width = 40,
				},
				update_focused_file = { enable = true },
			})
		end,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
	},

	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		config = function()
			require("leap").add_default_mappings()
		end,
	},

	{
		"folke/noice.nvim",
		enabled = false,
		event = "VimEnter",
		config = function()
			local _setup = require("custom.configs.noice").setup

			require("noice").setup(_setup)
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	{
		"JellyApple102/flote.nvim",
		event = "VeryLazy",
		config = function()
			require("flote").setup({
				q_to_quit = true,
				window_style = "minimal",
				window_border = "solid",
				window_title = true,
			})
		end,
	},

	{
		"nyngwang/NeoZoom.lua",
		event = "VeryLazy",
		config = function()
			require("neo-zoom").setup({
				winopts = {
					offset = {
						-- NOTE: you can omit `top` and/or `left` to center the floating window.
						top = 0,
						left = 0,
						width = 180,
						height = 0.95,
					},
					-- NOTE: check :help nvim_open_win() for possible border values.
					border = "rounded",
				},
				-- exclude_filetypes = { 'lspinfo', 'mason', 'lazy', 'fzf', 'qf' },
				-- exclude_buftypes = { "terminal" },
				presets = {
					{
						filetypes = { "dapui_.*", "dap-repl" },
						config = {
							top = 0.25,
							left = 0.6,
							width = 0.8,
							height = 0.85,
						},
						callbacks = {
							function()
								vim.wo.wrap = true
							end,
						},
					},
				},
				popup = {
					-- NOTE: Add popup-effect (replace the window on-zoom with a `[No Name]`).
					-- This way you won't see two windows of the same buffer
					-- got updated at the same time.
					enabled = true,
					exclude_filetypes = {},
					exclude_buftypes = {},
				},
			})
		end,
	},

	{

		"rmagatti/session-lens",
		dependencies = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
		config = function()
			require("session-lens").setup({})
			require("telescope").load_extension("session-lens")
		end,
	},

	{
		"LinArcX/telescope-command-palette.nvim",
		event = "VeryLazy",
	},

	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup()
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},

	{
		"folke/trouble.nvim",
		event = "VimEnter",
		config = function()
			require("trouble").setup({})
		end,
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	-- {
	-- 	"nikvdp/neomux",
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		"mhinz/neovim-remote",
	-- 	},
	-- },
	{
		"github/copilot.vim",
		event = "VimEnter",
	},

	-- {
	-- 	"christoomey/vim-tmux-navigator",
	-- 	event = "VimEnter",
	-- 	keys = {
	-- 		{ "<A-j>", ":<C-U>TmuxNavigateLeft", desc = "Nav Left" },
	-- 		{ "<A-k>", ":<C-U>TmuxNavigateDown", desc = "Nav Down" },
	-- 		{ "<A-l>", ":<C-U>TmuxNavigateUp", desc = "Nav Up" },
	-- 		{ "<A-;>", ":<C-U>TmuxNavigateRight", desc = "Nav Right" },
	-- 	},
	-- 	config = function()
	-- 		vim.cmd([[ let g:tmux_navigator_no_mappings = 1 ]])
	-- 	end,
	-- },
}

return plugins
