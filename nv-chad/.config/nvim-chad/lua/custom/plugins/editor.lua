return {
  -- editor
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
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

	{ "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" }, event = "VeryLazy" },

	{
		"nvim-tree/nvim-tree.lua",
		opts = function()
			return require("custom.configs.nvim-tree")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup(require("custom.configs.treesitter"))
		end,
	},

	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },

	{
		"smoka7/hop.nvim",
		version = "*",
		event = "VeryLazy",
		opts = {},
		config = function()
			local hop = require("hop")
			local directions = require("hop.hint").HintDirection

			hop.setup({})

			vim.keymap.set("", "s", function()
				hop.hint_char2()
			end, { remap = true })

			vim.keymap.set("", "f", function()
				hop.hint_char1({ current_line_only = true, direction = directions.AFTER_CURSOR })
			end, { remap = true })

      vim.keymap.set("", "F", function()
        hop.hint_char1({ current_line_only = true, reverse_direction = true, direction = directions.BEFORE_CURSOR })
      end, { remap = true })

			vim.keymap.set("", "t", function()
				hop.hint_char1({ current_line_only = true, hint_offset = -1, direction = directions.AFTER_CURSOR })
			end, { remap = true })

			vim.keymap.set("", "T", function()
				hop.hint_char1({ current_line_only = true, hint_offset = -1, direction = directions.BEFORE_CURSOR })
			end, { remap = true })
		end,
	},

	{
		"OlegGulevskyy/better-ts-errors.nvim",
		event = "BufRead",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = {
			keymaps = {
				toggle = "<leader>dd", -- default '<leader>dd'
				go_to_definition = "<leader>dx", -- default '<leader>dx'
			},
		},
	},

  {
    "tpope/vim-fugitive",
    event = "BufRead"
  },

  {
    "hedyhli/outline.nvim",
    event = "BufRead",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })

      require("outline").setup {
        -- Your setup opts here (leave empty to use defaults)
      }
    end,
  },
}
