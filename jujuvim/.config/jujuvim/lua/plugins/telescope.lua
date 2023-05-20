return {
  {
    "telescope.nvim",

    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        local telescope = require("telescope")
        telescope.load_extension("fzf")
      end,
    },

    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
          sorting_strategy = "ascending", -- display results top->bottom
          layout_config = {
            prompt_position = "top", -- search bar at the top
          },

          layout_config = {
            width = 0.8,
            -- other layout configuration here
          },
        },
        -- pickers = {
        --   find_files = {
        --     theme = "cursor",
        --   }
        -- },
      })
    end,

    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      { "<leader>p", "<cmd>Telescope oldfiles<cr>", desc = "recent files" },
      { "<leader>ff", "<cmd> Telescope find_files <CR>", desc = "find files" },
      { "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", desc = "find all" },
      { "<leader>fw", "<cmd> Telescope live_grep <CR>", desc = "live grep" },
      { "<leader>fb", "<cmd> Telescope buffers <CR>", desc = "find buffers" },
      { "<leader>fh", "<cmd> Telescope help_tags <CR>", desc = "help page" },
      { "<leader>fo", "<cmd> Telescope oldfiles <CR>", desc = "find oldfiles" },
      { "<leader>ft", "<cmd> Telescope terms <CR>", desc = "pick hidden term" },
      { "<leader>fs", "<cmd> Telescope session-lens search_session <CR>", desc = "pick session" },

      -- git
      { "<leader>gc", "<cmd> Telescope git_commits <CR>", desc = "Git commits" },
      { "<leader>gs", "<cmd> Telescope git_status <CR>", desc = "Git status" },
      { "<leader>gl", "<cmd> LazyGit <CR>", desc = "Lazy Git" },

      -- theme switcher
      { "<leader>th", "<cmd> Telescope themes <CR>", desc = "nvchad themes" },
    },

    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
