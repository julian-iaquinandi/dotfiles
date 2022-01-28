local telescope = require("telescope")
local trouble = require("trouble.providers.telescope")

telescope.setup{
  defaults = {
    file_ignore_patterns = {"node_modules", "dist"},
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    }
  },
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
telescope.load_extension('dap')
