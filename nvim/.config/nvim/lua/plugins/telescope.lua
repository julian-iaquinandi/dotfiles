return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>p", "<cmd>Telescope find_files <cr>", "Find files " },
      { "<leader>fw", "<cmd>Telescope live_grep<cr>", "Find in files" },
    },

    -- opts = {},

    config = function()
      -- require("telescope").load_extension("fzf")
      require("telescope").load_extension("persisted")

      require("telescope").setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          prompt_prefix = "   ",
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            -- height = 0.80,
            -- width = function(_, max_columns)
            --   local percentage = 0.5
            --   local max = 300
            --   return math.min(math.floor(percentage * max_columns), max)
            -- end,
            height = function(_, _, max_lines)
              local percentage = 0.5
              local min = 50
              return math.max(math.floor(percentage * max_lines), min)
            end,
            preview_cutoff = 120,
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          winblend = 0,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            n = { ["q"] = require("telescope.actions").close },
            i = { ["<esc>"] = require("telescope.actions").close },
          },
        },
        extensions = {
          persisted = {
            layout_config = { width = 0.55, height = 0.55 },
          },
        },
      })
    end,
    --
    -- extensions = {
    --   persisted = {
    --     layout_config = { width = 0.55, height = 0.55 },
    --   },
    -- },
  },
}
