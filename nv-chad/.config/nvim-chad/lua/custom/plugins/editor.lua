return {
  -- editor
	-- { "JoosepAlviste/nvim-ts-context-commentstring" },
  --
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   config = function()
  --     require("user.telescope")
  --     local actions = require("telescope.actions")
  --
  --     require("config")
  --
  --     require("telescope").setup({
  --       defaults = {
  --         mappings = {
  --           i = {
  --             ["<esc>"] = actions.close,
  --           },
  --         },
  --       },
  --     })
  --   end
  -- },

	{ "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" }, event = "VeryLazy"  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "custom.configs.nvim-tree"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup(require("custom.configs.treesitter"))
    end
  },

  {"christoomey/vim-tmux-navigator", event = "VeryLazy"},

  {
    'smoka7/hop.nvim',
    version = "*",
    event = "VeryLazy",
    opts = {},
    config = function()
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection
      hop.setup({})

      vim.keymap.set('', 's', function()
        hop.hint_char2()
      end, {remap=true})

      vim.keymap.set('', 'f', function()
        hop.hint_char1({ current_line_only = true })
      end, {remap=true})

      vim.keymap.set('', 't', function()
        hop.hint_char1({ current_line_only = true, hint_offset = -1 })
      end, {remap=true})

    end
  }
}

