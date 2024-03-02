local buffers = require("utils.buffers")
local pickers = require("utils.pickers")

-- local fn = require("utils.fn")

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

        -- pickers
        ["<leader>P"] = { pickers.invoke_command_pallete, "paste at position" },
        -- ["<leader>ao"] = { pickers.invoke_picker("ollama"), "ollama" },
        -- ["<leader>ac"] = { pickers.invoke_picker("code-actions"), "code actions" },
        -- ["<leader>ap"] = { pickers.invoke_command_pallete, "command pallete" },
        ["<leader>ai"] = { "<cmd>Gen<cr>", "command pallete" },
        -- ["<leader>vs"] = { "<cmd>lua WswapAndCycleWindow()<cr>", "swap window" },

        -- window/panes
        ["<leader>vs"] = { buffers.swap_buffer_and_resize, "swap window" },
      },
    },
  },
}
