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
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'tpope/vim-commentary'
  use 'ThePrimeagen/git-worktree.nvim'
  use 'honza/vim-snippets'
  use 'tpope/vim-fugitive'
  use "tami5/sqlite.lua"
  use {"akinsho/toggleterm.nvim"}
  use "github/copilot.vim"
  use {
    'neoclide/coc.nvim', 
    branch = 'release',
    run = ':CocInstall coc-tsserver coc-json coc-highlight coc-vetur coc-snippets'
  }

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
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim'} }
  }
  use {
    'sudormrfbin/cheatsheet.nvim',
    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  }
  use 'xiyaowong/telescope-emoji.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'camgraff/telescope-tmux.nvim'

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
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function() require'hop'.setup() end
  }
  
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  use {
    'akinsho/bufferline.nvim', 
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require("bufferline").setup{} end
  }

  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.opts)
    end
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
  -- use {
  --   "max397574/better-escape.nvim",
  --   config = function()
  --     require("better_escape").setup()
  --   end,
  -- }

end)
