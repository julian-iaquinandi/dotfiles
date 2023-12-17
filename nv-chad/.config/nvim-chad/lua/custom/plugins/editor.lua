return {
  -- editor
	{ "JoosepAlviste/nvim-ts-context-commentstring" },

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

  {"christoomey/vim-tmux-navigator", event = "VeryLazy"}
}
