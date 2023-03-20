return {

	{
		"folke/trouble.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},

	{ "ojroques/vim-oscyank", event = "VeryLazy" },

	--mini
	{
		"echasnovski/mini.nvim",
		version = false,
		event = "VeryLazy",
		config = function()
			-- require("mini.bracketed").setup()
			-- require("mini.comment").setup()
			-- require("mini.animate").setup({
			-- 	cursor = {
			-- 		enable = false,
			-- 	},
			-- })
			require("mini.cursorword").setup()
			require("mini.indentscope").setup()
			require("mini.pairs").setup()
			require("mini.starter").setup()
		end,
	},
}
