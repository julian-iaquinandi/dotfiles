return {
  {
    'nvim-treesitter/nvim-treesitter',
  },
  { 'kkharji/sqlite.lua' },
  { 
    "christoomey/vim-tmux-navigator",
    config = function() 
    end
  }
  {
    "folke/which-key.nvim",
    keys = {
      {
        "<leader>?w",
        function()
          vim.cmd("WhichKey")
        end,
        desc = "which-key all keymaps",
      },
      {
        "<leader>?q",
        function()
          local input = vim.fn.input("WhichKey: ")
          vim.cmd("WhichKey " .. input)
        end,
        desc = "which-key query lookup",
      },
    },
  },

  { "folke/neoconf.nvim", cmd = "Neoconf" },

  "folke/neodev.nvim",
  {
    "gbprod/yanky.nvim",
    enabled = true,
    event = "BufReadPost",
    config = function()
      require("telescope").load_extension("yank_history")
      require("yanky").setup({
        highlight = {
          timer = 150,
        },
        ring = {
          storage = jit.os:find("Windows") and "shada" or "sqlite",
        },
      })

      vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")

      vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
      vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

      vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
      vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

      vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
      vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
      vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
      vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")

      vim.keymap.set("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
      vim.keymap.set("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
      vim.keymap.set("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
      vim.keymap.set("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")

      vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)")
      vim.keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)")

      vim.keymap.set("n", "<leader>P", function()
        require("telescope").extensions.yank_history.yank_history({})
      end, { desc = "Paste from Yanky" })
    end,
  },
}
