require('basics')
require('colors')
require('telescope-config')
require('coc-config')
require('keybinds')
require('lualine').setup()
require'hop'.setup()

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

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
    'neoclide/coc.nvim', 
    branch = 'release',
    run = ':CocInstall coc-tsserver'
  }
  use 'folke/tokyonight.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'tpope/vim-commentary'
  use 'ThePrimeagen/git-worktree.nvim'
  use 'mhinz/vim-startify'
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
    }
    end
  }
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }

end)
