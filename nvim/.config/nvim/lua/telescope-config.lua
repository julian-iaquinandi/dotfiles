local telescope = require("telescope")

telescope.setup{
  pickers = {
    find_files = {
      theme = "ivy",
    },
    git_files = {
      theme = "ivy",
    },
    buffers = {
      theme = "ivy",
    },
    git_worktree= {
      theme = "ivy",
    },

  }
}

telescope.load_extension("git_worktree")
telescope.load_extension("emoji")
telescope.load_extension("media_files")

