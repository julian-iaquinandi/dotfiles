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
		"gbprod/yanky.nvim",
		enabled = true,
		event = "BufReadPost",
		config = function()
			require("telescope").load_extension("yank_history")
			require("yanky").setup({
				highlight = {
					timer = 150,
				},
				ring = {
					storage = jit.os:find("Windows") and "shada" or "sqlite",
				},
			})

			-- vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
			--
			-- vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
			-- vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
			-- vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
			-- vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
			--
			-- vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
			-- vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
			--
			-- vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
			-- vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
			-- vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
			-- vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")
			--
			-- vim.keymap.set("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
			-- vim.keymap.set("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
			-- vim.keymap.set("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
			-- vim.keymap.set("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")
			--
			-- vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)")
			-- vim.keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)")
			--
			-- vim.keymap.set("n", "<leader>P", function()
			--   require("telescope").extensions.yank_history.yank_history({})
			-- end, { desc = "Paste from Yanky" })
		end,
	},

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
}
