return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "sql" },
    },
  },

  {

    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "powershell-editor-services",
      },
    },
  },

  {
    "TheLeoP/powershell.nvim",
    opts = {
      bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
    },
  },

  {
    "OlegGulevskyy/better-ts-errors.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = {
      keymaps = {
        toggle = "<leader>dd", -- default '<leader>dd'
        go_to_definition = "<leader>dx", -- default '<leader>dx'
      },
    },
  },
}
