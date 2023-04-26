return {
  {
    "christoomey/vim-tmux-navigator",
    event = "VimEnter",
    keys = {
      { "<A-j>", "<cmd>TmuxNavigateLeft<cr>", "Nav Left" },
      { "<A-;>", ":<cmd>TmuxNavigateRight<cr>", "Nav Right" }
    } 
  }
}
