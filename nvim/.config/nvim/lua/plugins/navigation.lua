local keymaps = require("config.keymaps")
local enabled = require("config.enabled")

return {
  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    enabled = enabled.which_key,
    event = "VeryLazy", -- Sets the loading event to 'VimEnter'
    keys = keymaps.which_key,
  },

  {
    "folke/flash.nvim",
    enabled = enabled.flash,
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = keymaps.flash,
  },

  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      require("nvim-tmux-navigation").setup({
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = "<M-m>",
          down = "<M-,>",
          up = "<M-.>",
          right = "<M-.>",
          last_active = "<C-\\>",
          next = "<C-Space>",
        },
      })
    end,
  },

  {
    "ojroques/vim-oscyank",
  },
}
