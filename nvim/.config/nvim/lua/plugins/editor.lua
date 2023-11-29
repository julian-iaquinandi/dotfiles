return {
  { "github/copilot.vim" },

  -- theme
  {
    'zaldih/themery.nvim',
    config = function()
      require("themery").setup({
        themes = { "nightfox", "carbonfox", "dayfox", "duskfox", "terafox", "nordfox" }, -- Your list of installed colorschemes
        themeConfigFile = "~/.config/nvim/lua/config/theme.lua",                         -- Described below
        livePreview = true,                                                              -- Apply theme while browsing. Default to true.
      })
    end
  },
  { "EdenEast/nightfox.nvim" },

  -- comments
  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup()
    end
  },

  -- file tree
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require("nvim-tree").setup({
        -- actions = {
        --    open_file = {
        --      quit_on_open = true,
        --    },
        --  },
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
          side = 'right'
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
    }
  },

  -- status bar
  {
    'nvim-lualine/lualine.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true }
    },
    config = function()
      require('lualine').setup({

        tabline = {
          lualine_a = { 'branch' },
          lualine_b = { 'buffers' },
          lualine_c = { '' },
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'tabs' }
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
    end
  },

}
