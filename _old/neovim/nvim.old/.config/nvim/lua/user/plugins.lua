local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	use({
		"zbirenbaum/copilot.lua",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require("copilot").setup()
			end, 100)
		end,
	})

	-- Display
	use("folke/tokyonight.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("nvim-tree/nvim-web-devicons")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				-- extensions = { 'fugative' }
			})
		end,
	})
	use({
		"akinsho/bufferline.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	})

	-- Git
	-- use 'ThePrimeagen/git-worktree.nvim'
	use("tpope/vim-fugitive")
	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- Navigation
	use("christoomey/vim-tmux-navigator")
	-- use("ggandor/lightspeed.nvim")
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	})

	use({
		"ggandor/leap.nvim",
		keys = { "s", "S" },
		config = function()
			local leap = require("leap")
			leap.set_default_keymaps()
		end,
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" } },
	})
	use("xiyaowong/telescope-emoji.nvim")
	use("nvim-telescope/telescope-media-files.nvim")
	use({
		"sudormrfbin/cheatsheet.nvim",
		requires = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	})
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ "tami5/sqlite.lua", module = "sqlite" },
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("neoclip").setup()
		end,
	})

	use("jakelinnzy/autocmd-lua")

	-- LSP

	-- manage and install lsp servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	--  Config lsp servers
	use("neovim/nvim-lspconfig")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")

	-- Linting and formatting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	use("MunifTanjim/prettier.nvim")

	-- use "b0o/schemastore.nvim"
	--

	-- Completions/Snippets
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })

	-- Highlight
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
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
	})

	-- Menus
	use({
		"folke/noice.nvim",
		config = function()
			require("noice").setup()
		end,
		requires = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	})
	-- Debugging
	-- use 'puremourning/vimspector'
	-- use {
	--   "rcarriga/nvim-dap-ui",
	--   requires = {
	--     "mfussenegger/nvim-dap",
	--   },
	-- }
	-- use "Pocco81/DAPInstall.nvim"
	-- use "nvim-telescope/telescope-dap.nvim"
	-- use "theHamsta/nvim-dap-virtual-text"

	-- Tools
	use("tpope/vim-commentary")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("tami5/sqlite.lua")
	-- use 'github/copilot.vim'
	use("ojroques/vim-oscyank")
	use("pantharshit00/vim-prisma")
	-- use {
	--   'blackCauldron7/surround.nvim',
	--   config = function()
	--     require"surround".setup {mappings_style = "surround"}
	--   end
	-- }
end)
