-- options
--
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymaps
--
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

local opts = {
  noremap = true,
  silent = true,
}

vim.api.nvim_set_keymap("n", "j", "h", opts)
vim.api.nvim_set_keymap("n", "k", "j", opts)
vim.api.nvim_set_keymap("n", "l", "k", opts)
vim.api.nvim_set_keymap("n", ";", "l", opts)

vim.api.nvim_set_keymap("n", "<A-o>", "<C-o>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-i>", "<C-i>", { noremap = true, silent = true })

-- plugins
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup("plugins")
require("lazy").setup({
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {{
        "s",
        mode = {"n", "x", "o"},
        function()
            require("flash").jump()
        end,
        desc = "Flash"
    }, {
        "S",
        mode = {"n", "o", "x"},
        function()
            require("flash").treesitter()
        end,
        desc = "Flash Treesitter"
    }, {
        "r",
        mode = "o",
        function()
            require("flash").remote()
        end,
        desc = "Remote Flash"
    }, {
        "R",
        mode = {"o", "x"},
        function()
            require("flash").treesitter_search()
        end,
        desc = "Treesitter Search"
    }, {
        "<c-s>",
        mode = {"c"},
        function()
            require("flash").toggle()
        end,
        desc = "Toggle Flash Search"
    }}
,
  },
  { -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup({
        n_lines = 500,
      })

      -- require('mini.braketed').setup()

      require("mini.surround").setup({
        mappings = {
          add = "<leader>sa", -- Add surrounding in Normal and Visual modes
          delete = "<leader>sd", -- Delete surrounding
          find = "<leader>sf", -- Find surrounding (to the right)
          find_left = "<leader>sF", -- Find surrounding (to the left)
          highlight = "<leader>sh", -- Highlight surrounding
          replace = "<leader>sr", -- Replace surrounding
          update_n_lines = "<leader>sn", -- Update `n_lines`

          suffix_last = "p", -- Suffix to search with "prev" method
          suffix_next = "n", -- Suffix to search with "next" method
        },
      })
    end,
  },
  {
    "monaqa/dial.nvim",
    keys = {
      {
        "<c-a>",
        mode = "n",
        function()
          require("dial.map").manipulate("increment", "normal")
        end,
        desc = "Increment",
      },
      {
        "<c-x>",
        mode = "n",
        function()
          require("dial.map").manipulate("decrement", "normal")
        end,
        desc = "Decrement",
      },
      {
        "g<c-a>",
        mode = "n",
        function()
          require("dial.map").manipulate("increment", "gnormal")
        end,
        desc = "Increment (jump)",
      },
      {
        "g<c-x>",
        mode = "n",
        function()
          require("dial.map").manipulate("decrement", "gnormal")
        end,
        desc = "Decrement (jump)",
      },
    },
  },
})
