return {
  -- lsp + formatting + linting
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",

        "lua-language-server",

        "typescript-language-server",
        "eslint-lsp",
        "prettierd",
        "svelte-language-server",

        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",

        "marksman",

        "omnisharp",
        "csharpier",

        "xmlformatter",

        "yamlfix",

        "emmet-ls"
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      local cmp = require "cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },

}
