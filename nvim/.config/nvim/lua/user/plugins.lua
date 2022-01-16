local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'ThePrimeagen/git-worktree.nvim'
  use 'honza/vim-snippets'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'tami5/sqlite.lua'
  use 'github/copilot.vim'
  use 'prettier/vim-prettier'
  use 'christoomey/vim-tmux-navigator'
  use 'puremourning/vimspector'
  use 'ggandor/lightspeed.nvim'
  use 'ojroques/vim-oscyank'


  -- use {
  --   'neoclide/coc.nvim',
  --   branch = 'release'
  -- }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'hrsh7th/cmp-nvim-lsp'
  use "b0o/schemastore.nvim"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"

  -- Completions
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'saadparwaiz1/cmp_luasnip' }

  -- Snippets
  use { 'L3MON4D3/Luasnip' }
  use { "rafamadriz/friendly-snippets" }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained",
        context_commentstring = {
          enable = true
        },
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        }
      }
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('lualine').setup({
        -- extensions = { 'fugative' }
      })
    end
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require("bufferline").setup{} end
  }

	use {
			'kyazdani42/nvim-tree.lua',
			requires = {
				'kyazdani42/nvim-web-devicons', -- optional, for file icon
			},
			config = function() require'nvim-tree'.setup {} end
	}

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'xiyaowong/telescope-emoji.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use {
    'sudormrfbin/cheatsheet.nvim',
    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  }
  use {
    "AckslD/nvim-neoclip.lua",
    requires = {
      {'tami5/sqlite.lua', module = 'sqlite'},
      {'nvim-telescope/telescope.nvim'}
    },
    config = function()
      require('neoclip').setup()
    end
  }
  -- use 'nvim-telescope/telescope-file-browser.nvim'

  use {
    'blackCauldron7/surround.nvim',
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }

  use {
    'folke/which-key.nvim',
    config = function() require("which-key").setup() end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }


  -- use {"preservim/nerdtree",
  --   requires = {
  --     'Xuyuanp/nerdtree-git-plugin',
  --     'kyazdani42/nvim-web-devicons'
  --   }
  -- }



end)
