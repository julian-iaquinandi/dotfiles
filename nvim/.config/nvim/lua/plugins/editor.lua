return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme tokyonight]])
		end,
	},

	{ "ojroques/vim-oscyank", lazy = true },

	{ "tpope/vim-commentary", event = "VeryLazy" },

	{ "christoomey/vim-tmux-navigator" },

	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		dependencies = {
			"tpope/vim-repeat",
		},
		config = function()
			require("leap").add_default_mappings()
		end,
	},
}
