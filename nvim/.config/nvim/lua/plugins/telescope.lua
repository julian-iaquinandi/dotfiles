return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim", 
      "nvim-lua/popup.nvim",
      "xiyaowong/telescope-emoji.nvim",
      "sudormrfbin/cheatsheet.nvim",
      "AckslD/nvim-neoclip.lua",
      "tami5/sqlite.lua",
      "nvim-telescope/telescope-file-browser.nvim",

      config = function()
        local telescope = require("telescope")
        telescope.load_extension("emoji")
        telescope.load_extension("file_browser")
        -- telescope.load_extension("noice")

        telescope.setup({
          extensions = function()
            local fb_actions = require("telescope").extensions.file_browser.actions

            return {
              file_browser = {
                theme = "ivy",
                -- disables netrw and use telescope-file-browser in its place
                hijack_netrw = true,
                mappings = {
                  ["i"] = {
                    ["<C-A-r>"] = fb_actions.rename,
                    ["<C-A-m>"] = fb_actions.move,
                    ["<C-A-y>"] = fb_actions.copy,
                    ["<C-A-d>"] = fb_actions.remove,
                    ["<C-A-n>"] = fb_actions.create,
                    ["<C-A-p>"] = fb_actions.create_from_prompt,
                    ["<C-A-e>"] = fb_actions.goto_home_dir,
                    ["<C-A-g>"] = fb_actions.goto_parent_dir,
                    ["<C-A-w>"] = fb_actions.goto_cwd,
                    ["<C-A-t>"] = fb_actions.change_cwd,
                    ["<C-A-h>"] = fb_actions.toggle_hidden,
                    -- your custom insert mode mappings
                  },
                  ["n"] = {
                    -- your custom normal mode mappings
                  },
                },
              },
            }
          end,

          pickers = {
            find_files = {
              theme = "ivy",
              hidden = "true",
              sort_lastused = true,
              sort_mru = true,
            },
            git_files = {
              theme = "ivy",
              hidden = "true",
              sort_lastused = true,
              sort_mru = true,
            },
            buffers = {
              theme = "ivy",
              sort_lastused = true,
              sort_mru = true,
            },
            -- git_worktree= {
            --   theme = "ivy",
            --   sort_lastused = true,
            --   sort_mru = true
            -- },
          }
        })
      end,
    },

    -- keys = {
    --   {
    --     "<leader>fp",
    --     function()
    --       require("telescope.builtin").find_files({
    --         cwd = require("lazy.core.config").options.root,
    --       })
    --     end,
    --     desc = "Find Plugin File",
    --   },
    -- },

    opts = function()
      local actions = require("telescope.actions")
      -- local trouble = require("trouble.providers.telescope")

      return {
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          winblend = 0,
          file_ignore_patterns = { "node_modules", "dist" },
          mappings = {
            -- n = { ["<c-t>"] = trouble.open_with_trouble },
            i = {
              ["<esc>"] = actions.close,
            --			      ["C-r"] = fb_actions.goto_home_dir
            },
          },
        }
      }
    end,
  },
}