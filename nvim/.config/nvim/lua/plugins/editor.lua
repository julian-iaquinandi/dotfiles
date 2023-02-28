return {
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
	},

	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- Comments
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
		end,
	},

	-- Git
	{
		"tpope/vim-fugitive",
		-- event = "VeryLazy"
		cmd = "Git",
	},

	-- better diffing
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		config = true,
		-- keys = { { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView" } },
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Navigation
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },

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

	-- {
	-- 	"ray-x/sad.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("sad").setup({})
	-- 	end,
	-- },
}
