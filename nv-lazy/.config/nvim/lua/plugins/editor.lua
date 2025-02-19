local Util = require("lazyvim.util")

return {
  { "marklcrns/vim-smartq", event = "BufRead" },

  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
    keys = {
      { "<A-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Go to the previous pane" },
      { "<A-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Got to the left pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Got to the down pane" },
      { "<A-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Got to the up pane" },
      { "<A-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Got to the right pane" },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        -- update_focused_file = {
        --   enable = true,
        -- },
        view = {
          side = "right",
          width = 40,
        },
      })
    end,
    keys = {
      { "<leader>e", ":NvimTreeFindFileToggle!<cr>", desc = "Explorer" },
      -- { "<leader>E", "<cmd>NvimTreeFindFile<cr>", desc = "Explorer (find file)" },
      -- { "<leader>e", "<leader>fe", desc = "Explorer", remap = true },
      -- { "<leader>E", "<leader>fE", desc = "Explorer (find file)", remap = true },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    disable = true,
    --   opts = {
    --     position = "right",
    --   },
    --
    --   keys = {
    --     {
    --       "<leader>fe",
    --       function()
    --         require("neo-tree.command").execute({ toggle = true, dir = Util.root(), position = "right" })
    --       end,
    --       desc = "Explorer NeoTree (root dir)",
    --     },
    --     {
    --       "<leader>fE",
    --       function()
    --         require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd(), position = "right" })
    --       end,
    --       desc = "Explorer NeoTree (cwd)",
    --     },
    --     { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
    --     { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    --     {
    --       "<leader>ge",
    --       function()
    --         require("neo-tree.command").execute({ source = "git_status", toggle = true, position = "right" })
    --       end,
    --       desc = "Git explorer",
    --     },
    --     {
    --       "<leader>be",
    --       function()
    --         require("neo-tree.command").execute({ source = "buffers", toggle = true, position = "right" })
    --       end,
    --       desc = "Buffer explorer",
    --     },
    --   },
  },

  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    version = "*",
    config = true,
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 20
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
    },
    keys = {
      { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "terminal horizontal" },
      { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "terminal vertical" },
    },
  },

  "dhruvasagar/vim-zoom",
}
