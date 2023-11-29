return {
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

}
