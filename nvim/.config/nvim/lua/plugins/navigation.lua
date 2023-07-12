return {
  {
    "kevinhwang91/rnvimr",
    event = "VimEnter",
    keys = {
      {
        "<leader>e",
        ":RnvimrToggle<cr>",
        desc = "Leap to line under target and enter insert",
      },
    },
    config = function()
      vim.g.rnvimr_enable_ex = 1
      vim.g.rnvimr_enable_picker = 1
      vim.g.rnvimr_enable_bw = 1
    end,
  },
  -- {
  --   "stevearc/oil.nvim",
  --   event = "VimEnter",
  --   opts = {
  --     float = {
  --       -- Padding around the floating window
  --       padding = 4,
  --       max_width = 80,
  --       max_height = 40,
  --       border = "rounded",
  --       win_options = {
  --         winblend = 10,
  --       },
  --     },
  --     preview = {
  --       -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
  --       -- min_width and max_width can be a single value or a list of mixed integer/float types.
  --       -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
  --       max_width = 0.9,
  --       -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
  --       min_width = { 40, 0.4 },
  --       -- optionally define an integer/float for the exact width of the preview window
  --       width = 40,
  --       -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
  --       -- min_height and max_height can be a single value or a list of mixed integer/float types.
  --       -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
  --       max_height = 0.9,
  --       -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
  --       min_height = { 5, 0.1 },
  --       -- optionally define an integer/float for the exact height of the preview window
  --       height = 40,
  --       border = "rounded",
  --       win_options = {
  --         winblend = 0,
  --       },
  --     },
  --   },
  --   -- Optional dependencies
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  -- },

  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
    -- event = "VeryLazy",
    keys = {
      {
        "<leader>lu",
        function()
          require("local.leap-utils").insert_under_line()
        end,
        desc = "Leap to line under target and enter insert",
      },

      {
        "<leader>lo",
        function()
          require("local.leap-utils").insert_over_line()
        end,
        desc = "Leap to line over target and enter insert",
      },

      {
        "<leader>li",
        function()
          require("local.leap-utils").insert_at_line(true)
        end,
        desc = "Leap to line start and enter insert",
      },

      {
        "<leader>la",
        function()
          require("local.leap-utils").insert_at_line(false)
        end,
        desc = "Leap to line end and enter insert",
      },
    },
  },

  {
    "christoomey/vim-tmux-navigator",
    event = "VimEnter",
    keys = {
      { "<A-j>", "<cmd>TmuxNavigateLeft<cr>", "Nav Left" },
      { "<A-;>", ":<cmd>TmuxNavigateRight<cr>", "Nav Right" },
    },
  },
}
