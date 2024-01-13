return {
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {

        -- general
        ["<leader>w"] = { "<cmd>w<cr>", "Write file" },
        ["<leader>W"] = { "<cmd> wa <cr>", "write all files" },
        -- ["<leader>xx"] = { "<cmd> wqa <cr>", "write & quit" },
        -- ["<leader>XX"] = { "<cmd> qa! <cr>", "force quit" },
        ["<leader>q"] = { "<cmd> SmartQ<cr>", "close file" },
        ["<leader>Q"] = { "<cmd> SmartQ!<cr>", "close file force" },
        ["<leader>xb"] = { "<cmd>%bd|e#<cr>", "close all buffers but current" },

        -- find
        ["<leader>p"] = { "<cmd> Telescope git_files <cr>", "find files p" },
        ["<leader>P"] = { "<cmd>HopPasteChar1<cr>", "paste at position" },
        ["<leader>y"] = { "<cmd>HopYankChar1<cr>", "yank between positions" },
      },
    },
  },
}
