return {
  -- neodev
  {
    "folke/neodev.nvim",
    opts = {
      debug = true,
      experimental = {
        pathStrict = true,
      },
      library = {
        runtime = "~/projects/neovim/runtime/",
      },
    },
  },

  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        -- "deno",
        "shfmt",
        "black",
        "isort",
        "flake8",
        "prettierd",
        "eslint_d"
      })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      ---@type lspconfig.options
      servers = {
        astro = {},
        ansiblels = {},
        bashls = {},
        clangd = {},
        denols = {},
        cssls = {},
        dockerls = {},
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        svelte = {},
        html = {},
        gopls = {},
        marksman = {},
        pyright = {},
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              procMacro = { enable = true },
              cargo = { allFeatures = true },
              checkOnSave = {
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          -- cmd = { "/home/folke/projects/lua-language-server/bin/lua-language-server" },
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  "--log-level=trace",
                },
              },
              diagnostics = {
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
        teal_ls = {},
        vimls = {},
        -- tailwindcss = {},
      },
      setup = {},
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      on_attach = function(client, bufnr)
        require("util.mappings").load("lspconfig", { buffer = bufnr })
      end
    end,

    opts = {
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
    },

    keys = {
      {
        "gD",
        function()
          vim.lsp.buf.declaration()
        end,
        desc = "lsp declaration",
      },

      {
        "gd",
        function()
          vim.lsp.buf.definition()
        end,
        desc = "lsp definition",
      },

      {
        "K",
        function()
          vim.lsp.buf.hover()
        end,
        desc = "lsp hover",
      },

      {
        "gi",
        function()
          vim.lsp.buf.implementation()
        end,
        desc = "lsp implementation",
      },

      {
        "<leader>ls",
        function()
          vim.lsp.buf.signature_help()
        end,
        desc = "lsp signature_help",
      },

      {
        "<leader>D",
        function()
          vim.lsp.buf.type_definition()
        end,
        desc = "lsp definition type",
      },

      {
        "<leader>ra",
        function()
          require("nvchad_ui.renamer").open()
        end,
        desc = "lsp rename",
      },

      {
        "<leader>ca",
        function()
          vim.lsp.buf.code_action()
        end,
        desc = "lsp code_action",
      },

      {
        "gr",
        function()
          vim.lsp.buf.references()
        end,
        desc = "lsp references",
      },

      {
        "<leader>f",
        function()
          vim.diagnostic.open_float { border = "rounded" }
        end,
        desc = "floating diagnostic",
      },

      {
        "[d",
        function()
          vim.diagnostic.goto_prev()
        end,
        desc = "goto prev",
      },

      {
        "]d",
        function()
          vim.diagnostic.goto_next()
        end,
        desc = "goto_next",
      },

      -- ["<leader>q"] = {
      --   function()
      --     vim.diagnostic.setloclist()
      --   end,
      --   "diagnostic setloclist",
      -- },

      {
        "<leader>bf",
        function()
          vim.lsp.buf.format { async = true }
        end,
        desc = "lsp formatting",
      },

      -- ["<leader>wa"] = {
      --   function()
      --     vim.lsp.buf.add_workspace_folder()
      --   end,
      --   "add workspace folder",
      -- },
      --
      -- ["<leader>wr"] = {
      --   function()
      --     vim.lsp.buf.remove_workspace_folder()
      --   end,
      --   "remove workspace folder",
      -- },
      --
      -- ["<leader>wl"] = {
      --   function()
      --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      --   end,
      --   "list workspace folders",
      -- },
    },
  },

  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require "null-ls"
      vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.markdownlint,
        nls.builtins.diagnostics.selene.with {
          condition = function(utils)
            return utils.root_has_file { "selene.toml" }
          end,
        },
        nls.builtins.formatting.isort,
        nls.builtins.formatting.black,
        nls.builtins.diagnostics.flake8,
        nls.builtins.diagnostics.luacheck.with {
          condition = function(utils)
            return utils.root_has_file { ".luacheckrc" }
          end,
        },
        nls.builtins.formatting.prettierd,
        nls.builtins.diagnostics.eslint_d,
      })
    end,
  },

  -- inlay hints
  {
    "lvimuser/lsp-inlayhints.nvim",
    event = "LspAttach",
    opts = {},
    config = function(_, opts)
      require("lsp-inlayhints").setup(opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("LspAttach_inlayhints", {}),
        callback = function(args)
          if not (args.data and args.data.client_id) then
            return
          end
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          require("lsp-inlayhints").on_attach(client, args.buf)
        end,
      })
    end,
  },
}
