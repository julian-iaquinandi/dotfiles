return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			run = ":TSUpdate",
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				"svelte",
				"react",
				"vue",
				"astro",
			},
		},
	},
	{ "kkharji/sqlite.lua" },
	{
		"christoomey/vim-tmux-navigator",
		config = function() end,
	},
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")

			local mappings = require("config.keymaps")
			wk.register(mappings, { prefix = "<leader>" })
		end,
	},

	{ "folke/neoconf.nvim", cmd = "Neoconf" },

	"folke/neodev.nvim",

	{
		"piersolenski/wtf.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			openai_model_id = "gpt-3.5-turbo",
		},
		hooks = {
			request_started = function()
				vim.cmd("hi StatusLine ctermbg=NONE ctermfg=yellow")
			end,
			request_finished = vim.schedule_wrap(function()
				vim.cmd("hi StatusLine ctermbg=NONE ctermfg=NONE")
			end),
		},
		keys = {
			{
				"gw",
				mode = { "n", "x" },
				function()
					require("wtf").ai()
				end,
				desc = "Debug diagnostic with AI",
			},
			{
				mode = { "n" },
				"gW",
				function()
					require("wtf").search()
				end,
				desc = "Search diagnostic with Google",
			},
		},
	},

	{
		"ojroques/nvim-osc52",
		config = function()
			require("osc52").setup({
				max_length = 0, -- Maximum length of selection (0 for no limit)
				silent = false, -- Disable message on successful copy
				trim = true, -- Trim surrounding whitespaces before copy
				tmux_passthrough = true, -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
			})
		end,
	},
}
