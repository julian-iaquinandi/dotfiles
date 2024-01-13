-- local Util = require("util")
-- local file_sorter = require("config.telescope-sorter")

return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,

    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      -- "nvim-telescope/telescope-fzf-native.nvim",
      "nvim-lua/plenary.nvim",
      build = "make",
      config = function()
        -- local telescope = require("telescope")
        -- telescope.load_extension("fzf")
      end,
    },


    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      local fb_actions = require("telescope").extensions.file_browser.actions
      telescope.load_extension("file_browser")
      -- local fb_actions = require("file_browser.actions")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
            },
          },
          sorting_strategy = "ascending", -- display results top->bottom
          layout_config = {
            prompt_position = "top",      -- search bar at the top
            width = 0.9,
          },
        },
        file_browser = {
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
              ["<M-S-x>"] = fb_actions.remove,
              ["<C-S-a"] = fb_actions.rename,
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
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
      -- files
      -- { "<leader>p",  "<cmd> Telescope git_files<CR>",                                          desc = "find files" },
      -- { "<leader>ff", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", desc = "find git files" },
      -- { "<leader>fa", "<cmd> Telescope live_grep<CR>",                                          desc = "find all" },
      -- { "<leader>fo", "<cmd> Telescope buffers<CR>",                                            desc = "find old files" },
      -- { "<leader>F",  "<cmd> Telescope grep_string<CR>",                                        desc = "find current word" },
      --
      -- -- editor
      -- { "<leader>fb", "<cmd> Telescope buffers<CR>",                                            desc = "find buffers" },
      -- { "<leader>fh", "<cmd>Telescope help_tags<cr>",                                           desc = "find help pages" },
      -- { "<leader>fc", "<cmd>Telescope command_history<cr>",                                     desc = "find command history" },
      -- { "<leader>fC", "<cmd>Telescope commands<cr>",                                            desc = "find commands" },
      -- { "<leader>fk", "<cmd>Telescope keymaps<cr>",                                             desc = "find key maps" },
      --
      -- git
    --   { "<leader>gc", "<cmd> Telescope git_commits <CR>",                                       desc = "git commits" },
    --   { "<leader>gs", "<cmd> Telescope git_status <CR>",                                        desc = "git status" },
    --   { "<leader>gS", "<cmd> Telescope git_status <CR>",                                        desc = "git stash" },
    --   { "<leader>gb", "<cmd> Telescope git_branches<CR>",                                       desc = "git branches" },
    --   { "<leader>gg", ":LazyGit <CR>",                                                          desc = "Lazy Git" },
    --
    -- },

    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        -- file_sorter = file_sorter
      },
    },
  },
}
}


--   { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
--   { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
--
--   -- file browser
--
--   -- Files
--   -- { "<leader>p", Util.telescope("oldfiles", { cwd = vim.loop.cwd(), hidden = true }), desc = "recent files" },
--   -- { "<leader>P", "<cmd>Telescope oldfiles<cr>", desc = "recent files (system)" },
--
--   -- git
--   { "<leader>gc", "<cmd> Telescope git_commits <CR>", desc = "Git commits" },
--   { "<leader>gs", "<cmd> Telescope git_status <CR>", desc = "Git status" },
--   { "<leader>gg", ":LazyGit <CR>", desc = "Lazy Git" },
--
--   -- search
--   { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
--   { "<leader>sA", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", desc = "find all" },
--   { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
--   { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
--   { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
--   { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
--   { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
--   -- { "<leader>sf", Util.telescope("files"), desc = "Find Files (root dir)" },
--   -- { "<leader>sF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
--   -- { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
--   -- { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
--   { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
--   { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
--   { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
--   { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
--   { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
--   { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
--   { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
--   -- { "<leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
--   -- { "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
--   -- { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
--
--   -- {
--   --   "<leader>ss",
--   --   Util.telescope("lsp_document_symbols", {
--   --     symbols = {
--   --       "Class",
--   --       "Function",
--   --       "Method",
--   --       "Constructor",
--   --       "Interface",
--   --       "Module",
--   --       "Struct",
--   --       "Trait",
--   --       "Field",
--   --       "Property",
--   --     },
--   --   }),
--   --   desc = "Goto Symbol",
--   -- },
--
--   -- {
--   --   "<leader>sS",
--   --   Util.telescope("lsp_dynamic_workspace_symbols", {
--   --     symbols = {
--   --       "Class",
--   --       "Function",
--   --       "Method",
--   --       "Constructor",
--   --       "Interface",
--   --       "Module",
--   --       "Struct",
--   --       "Trait",
--   --       "Field",
--   --       "Property",
--   --     },
--   --   }),
--   --   desc = "Goto Symbol (Workspace)",
--   -- },
--
--   -- theme switcher
--   -- { "<leader>th", "<cmd> Telescope themes <CR>", desc = "nvchad themes" },
