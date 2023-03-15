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

	{
		"nvim-treesitter/nvim-treesitter",
		-- run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				context_commentstring = {
					enable = true,
				},
				highlight = {
					enable = true,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},

	-- floating winbar
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		config = function()
			local colors = require("tokyonight.colors").setup()
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { guibg = "#FC56B1", guifg = colors.black },
						InclineNormalNC = { guifg = "#FC56B1", guibg = colors.black },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
			})
		end,
	},

	-- auto-resize windows
	{
		"anuvyklack/windows.nvim",
		event = "WinNew",
		dependencies = {
			{ "anuvyklack/middleclass" },
			{ "anuvyklack/animation.nvim", enabled = false },
		},
		keys = { { "<leader>Z", "<cmd>WindowsMaximize<cr>", desc = "Zoom" } },
		config = function()
			vim.o.winwidth = 5
			vim.o.equalalways = false
			require("windows").setup({
				animation = { enable = false, duration = 150 },
			})
		end,
	},

	-- scrollbar
	{
		"petertriho/nvim-scrollbar",
		event = "BufReadPost",
		config = function()
			local scrollbar = require("scrollbar")
			local colors = require("tokyonight.colors").setup()
			scrollbar.setup({
				handle = { color = colors.bg_highlight },
				excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify" },
				marks = {
					Search = { color = colors.orange },
					Error = { color = colors.error },
					Warn = { color = colors.warning },
					Info = { color = colors.info },
					Hint = { color = colors.hint },
					Misc = { color = colors.purple },
				},
			})
		end,
	},

	-- style windows with different colorschemes
	-- {
	--   "folke/styler.nvim",
	--   -- event = "VeryLazy",
	--   opts = {
	--     themes = {
	--       markdown = { colorscheme = "tokyonight-storm" },
	--       help = { colorscheme = "oxocarbon", background = "dark" },
	--     },
	--   },
	-- },

	{
		"akinsho/bufferline.nvim",
		event = "VimEnter",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				sections = {
					lualine_x = {
						{
							require("noice").api.statusline.mode.get,
							cond = require("noice").api.statusline.mode.has,
							color = { fg = "#ff9e64" },
						},
					},
				},
				-- extensions = { 'fugative' }
			})
		end,
	},

	-- colorizer
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = {
			filetypes = { "*", "!lazy" },
			buftype = { "*", "!prompt", "!nofile" },
			user_default_options = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = false, -- "Name" codes like Blue
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				AARRGGBB = false, -- 0xAARRGGBB hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				-- Available modes: foreground, background
				-- Available modes for `mode`: foreground, background,  virtualtext
				mode = "background", -- Set the display mode.
				virtualtext = "■",
			},
		},
	},
}
