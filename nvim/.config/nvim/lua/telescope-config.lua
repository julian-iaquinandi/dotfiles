local telescope = require("telescope")

telescope.setup{
  pickers = {
    find_files = {
      theme = "ivy",
      hidden = "true"
    },
    git_files = {
      theme = "ivy",
      hidden = "true"
    },
    buffers = {
      theme = "ivy",
    },
    git_worktree= {
      theme = "ivy",
    },
  },

  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

-- telescope.buffers({
--   sort_lastused = true,
-- })

telescope.load_extension("git_worktree")
telescope.load_extension("emoji")
telescope.load_extension("media_files")
telescope.load_extension("fzf")
-- telescope.load_extension("file_browser")

