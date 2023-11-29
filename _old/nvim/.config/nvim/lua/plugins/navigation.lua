return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
        use_libuv_file_watcher = true,
      },
      window = {
        position = "right",

        mappings = {
          ["<space>"] = "none",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_empty = "󰜌",
          folder_empty_open = "󰜌",
        },
        git_status = {
          symbols = {
            renamed = "󰁕",
            unstaged = "󰄱",
          },
        },
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)
      vim.api.nvim_create_autocmd("TermClose", {
        pattern = "*lazygit",
        callback = function()
          if package.loaded["neo-tree.sources.git_status"] then
            require("neo-tree.sources.git_status").refresh()
          end
        end,
      })
    end,
  },
  -- better increase/descrease
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
        },
      })
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
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

-- {
--   "kevinhwang91/rnvimr",
--   event = "VimEnter",
--   keys = {
--     {
--       "<leader>e",
--       ":RnvimrToggle<cr>",
--       desc = "Leap to line under target and enter insert",
--     },
--   },
--   config = function()
--     vim.g.rnvimr_enable_ex = 1
--     vim.g.rnvimr_enable_picker = 1
--     vim.g.rnvimr_enable_bw = 1
--   end,
-- },

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

-- {
--   "ggandor/leap.nvim",
--   config = function()
--     require("leap").add_default_mappings()
--   end,
--   -- event = "VeryLazy",
--   keys = {
--     {
--       "<leader>lu",
--       function()
--         require("local.leap-utils").insert_under_line()
--       end,
--       desc = "Leap to line under target and enter insert",
--     },
--
--     {
--       "<leader>lo",
--       function()
--         require("local.leap-utils").insert_over_line()
--       end,
--       desc = "Leap to line over target and enter insert",
--     },
--
--     {
--       "<leader>li",
--       function()
--         require("local.leap-utils").insert_at_line(true)
--       end,
--       desc = "Leap to line start and enter insert",
--     },
--
--     {
--       "<leader>la",
--       function()
--         require("local.leap-utils").insert_at_line(false)
--       end,
--       desc = "Leap to line end and enter insert",
--     },
--   },
-- },
