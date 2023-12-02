return {
	{ "github/copilot.vim" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

	-- theme
	{
		"zaldih/themery.nvim",
		config = function()
			require("themery").setup({
				themes = { "nightfox", "carbonfox", "dayfox", "duskfox", "terafox", "nordfox" }, -- Your list of installed colorschemes
				themeConfigFile = "~/.config/nvim/lua/config/theme.lua", -- Described below
				livePreview = true, -- Apply theme while browsing. Default to true.
			})
		end,
	},
	{ "EdenEast/nightfox.nvim" },

	-- comments
	{
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup({
				hook = function()
					require("ts_context_commentstring").update_commentstring()
				end,
			})
		end,
	},

	-- file tree
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				-- actions = {
				-- 	open_file = {
				-- 		quit_on_open = true,
				-- 	},
				-- },
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 30,
					side = "right",
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
			})
		end,

		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "find files" },
		},
	},

	-- status bar
	{
		"nvim-lualine/lualine.nvim",
		requires = {
			{ "kyazdani42/nvim-web-devicons", opt = true },
		},
		config = function()
			require("lualine").setup({

				-- sections = {
				--   lualine_a = {'mode'},
				--   lualine_b = {'branch', 'diff', 'diagnostics'},
				--   lualine_c = {'filename', path = 1},
				--   lualine_x = {'encoding', 'fileformat', 'filetype'},
				--   lualine_y = {'progress'},
				--   lualine_z = {'location'}
				-- },

				tabline = {
					lualine_a = { "branch" },
					lualine_b = { "buffers" },
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "tabs" },
				},

				-- winbar = {
				--   lualine_a = {},
				--   lualine_b = {},
				--   lualine_c = {'filename'},
				--   lualine_x = {},
				--   lualine_y = {},
				--   lualine_z = {}
				-- },
			})
		end,
	},

	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				-- signs = {
				-- 	add = { text = "│" },
				-- 	change = { text = "│" },
				-- 	delete = { text = "_" },
				-- 	topdelete = { text = "‾" },
				-- 	changedelete = { text = "~" },
				-- 	untracked = { text = "┆" },
				-- },
				-- signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				-- numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				-- linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				-- word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				-- watch_gitdir = {
				-- 	follow_files = true,
				-- },
				-- attach_to_untracked = true,
				-- current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				-- current_line_blame_opts = {
				-- 	virt_text = true,
				-- 	virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				-- 	delay = 1000,
				-- 	ignore_whitespace = false,
				-- 	virt_text_priority = 100,
				-- },
				-- current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
				-- sign_priority = 6,
				-- update_debounce = 100,
				-- status_formatter = nil, -- Use default
				-- max_file_length = 40000, -- Disable if file is longer than this (in lines)
				-- preview_config = {
				-- 	-- Options passed to nvim_open_win
				-- 	border = "single",
				-- 	style = "minimal",
				-- 	relative = "cursor",
				-- 	row = 0,
				-- 	col = 1,
				-- },
				-- yadm = {
				-- 	enable = false,
				-- },
			})
		end,
	},
}
