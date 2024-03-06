local keymaps = require 'config.keymaps'

local servers = {
  clangd = {},
  -- gopls = {},
  svelte = {},
  omnisharp = {},

  dockerls = {},
  docker_compose_language_service = {},

  pyright = {},
  ruff_lsp = {
    keys = keymaps.ruff_lsp,
  },

  yamlls = {
    -- Have to add this for yamlls to understand that we support line folding
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    },
    -- lazy-load schemastore when needed
    on_new_config = function(new_config)
      new_config.settings.yaml.schemas = vim.tbl_deep_extend('force', new_config.settings.yaml.schemas or {}, require('schemastore').yaml.schemas())
    end,
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        keyOrdering = false,
        format = {
          enable = true,
        },
        validate = true,
        schemaStore = {
          -- Must disable built-in schemaStore support to use
          -- schemas from SchemaStore.nvim plugin
          enable = false,
          -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
          url = '',
        },
      },
    },
  },
  -- added ts-tools for typescript

  jsonls = {
    -- lazy-load schemastore when needed
    on_new_config = function(new_config)
      new_config.settings.json.schemas = new_config.settings.json.schemas or {}
      vim.list_extend(new_config.settings.json.schemas, require('schemastore').json.schemas())
    end,
    settings = {
      json = {
        format = {
          enable = true,
        },
        validate = { enable = true },
      },
    },
  },

  eslint = {
    settings = {
      -- helps eslint find the eslintrc when it's placed in a subfolder instead of the cwd root
      workingDirectories = { mode = 'auto' },
    },
  },

  tailwindcss = {
    -- exclude a filetype from the default_config
    filetypes_exclude = { 'markdown' },
    -- add additional filetypes to the default_config
    filetypes_include = {},
    -- to fully override the default_config, change the below
    -- filetypes = {}
  },

  lua_ls = {
    -- cmd = {...},
    -- filetypes { ...},
    -- capabilities = {},
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        workspace = {
          checkThirdParty = false,
          -- Tells lua_ls where to find all the Lua files that you have loaded
          -- for your neovim configuration.
          library = {
            '${3rd}/luv/library',
            unpack(vim.api.nvim_get_runtime_file('', true)),
          },
          -- If lua_ls is really slow on your computer, you can try this instead:
          -- library = { vim.env.VIMRUNTIME },
        },
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },

  rust_analyzer = {
    keys = keymaps.rust_analyzer,
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        -- Add clippy lints for Rust.
        checkOnSave = {
          allFeatures = true,
          command = 'clippy',
          extraArgs = { '--no-deps' },
        },
        procMacro = {
          enable = true,
          ignored = {
            ['async-trait'] = { 'async_trait' },
            ['napi-derive'] = { 'napi' },
            ['async-recursion'] = { 'async_recursion' },
          },
        },
      },
    },
  },

  taplo = {
    keys = keymaps.taplo,
  },
}

local tools = {
  'stylua', -- Used to format lua code
  'codelldb',
  'hadolint',
  'prettier',
  'prettierd',
  'eslint',
  'eslint_d',
  'pylint',
}

return {
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      -- Brief Aside: **What is LSP?**
      --
      -- LSP is an acronym you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself
          -- many times.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          map('<leader>sD', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>sy', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          map('<leader>cr', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP Specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, tools)
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,

    keys = {
      {
        '<leader>co',
        function()
          vim.lsp.buf.code_action {
            apply = true,
            context = {
              only = { 'source.organizeImports.ts' },
              diagnostics = {},
            },
          }
        end,
        desc = 'Organize Imports',
      },
      {
        '<leader>cR',
        function()
          vim.lsp.buf.code_action {
            apply = true,
            context = {
              only = { 'source.removeUnused.ts' },
              diagnostics = {},
            },
          }
        end,
        desc = 'Remove Unused Imports',
      },
    },

    setup = {
      rust_analyzer = function(_, opts)
        local rust_tools_opts = require('lazyvim.util').opts 'rust-tools.nvim'
        require('rust-tools').setup(vim.tbl_deep_extend('force', rust_tools_opts or {}, { server = opts }))
        return true
      end,

      eslint = function()
        local function get_client(buf)
          return require('lazyvim.util').lsp.get_clients({ name = 'eslint', bufnr = buf })[1]
        end

        local formatter = require('lazyvim.util').lsp.formatter {
          name = 'eslint: lsp',
          primary = false,
          priority = 200,
          filter = 'eslint',
        }

        -- Use EslintFixAll on Neovim < 0.10.0
        if not pcall(require, 'vim.lsp._dynamic') then
          formatter.name = 'eslint: EslintFixAll'
          formatter.sources = function(buf)
            local client = get_client(buf)
            return client and { 'eslint' } or {}
          end
          formatter.format = function(buf)
            local client = get_client(buf)
            if client then
              local diag = vim.diagnostic.get(buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
              if #diag > 0 then
                vim.cmd 'EslintFixAll'
              end
            end
          end
        end

        -- register the formatter with LazyVim
        require('lazyvim.util').format.register(formatter)
      end,

      tailwindcss = function(_, opts)
        local tw = require 'lspconfig.server_configurations.tailwindcss'
        opts.filetypes = opts.filetypes or {}

        -- Add default filetypes
        vim.list_extend(opts.filetypes, tw.default_config.filetypes)

        -- Remove excluded filetypes
        --- @param ft string
        opts.filetypes = vim.tbl_filter(function(ft)
          return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
        end, opts.filetypes)

        -- Add additional filetypes
        vim.list_extend(opts.filetypes, opts.filetypes_include or {})
      end,

      yamlls = function()
        -- Neovim < 0.10 does not have dynamic registration for formatting
        if vim.fn.has 'nvim-0.10' == 0 then
          require('lazyvim.util').lsp.on_attach(function(client, _)
            if client.name == 'yamlls' then
              client.server_capabilities.documentFormattingProvider = true
            end
          end)
        end
      end,

      ruff_lsp = function()
        require('lazyvim.util').lsp.on_attach(function(client, _)
          if client.name == 'ruff_lsp' then
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end
        end)
      end,
    },

    settings = {
      completions = {
        completeFunctionCalls = true,
      },
    },
  },

  -- Typescript

  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },

  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },

  -- Rust

  {
    'Saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {
      src = {
        cmp = { enabled = true },
      },
    },
  },

  {
    'simrat39/rust-tools.nvim',
    lazy = true,
    opts = function()
      local ok, mason_registry = pcall(require, 'mason-registry')
      local adapter ---@type any
      if ok then
        -- rust tools configuration for debugging support
        local codelldb = mason_registry.get_package 'codelldb'
        local extension_path = codelldb:get_install_path() .. '/extension/'
        local codelldb_path = extension_path .. 'adapter/codelldb'
        local liblldb_path = ''
        if vim.loop.os_uname().sysname:find 'Windows' then
          liblldb_path = extension_path .. 'lldb\\bin\\liblldb.dll'
        elseif vim.fn.has 'mac' == 1 then
          liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
        else
          liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
        end
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
      end
      return {
        dap = {
          adapter = adapter,
        },
        tools = {
          on_initialized = function()
            vim.cmd [[
                augroup RustLSP
                  autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                  autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                  autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                augroup END
              ]]
          end,
        },
      }
    end,
    config = function() end,
  },

  {
    'rouge8/neotest-rust',
  },

  -- tailwind
  { 'roobert/tailwindcss-colorizer-cmp.nvim', config = true },

  -- json
  {
    'b0o/SchemaStore.nvim',
    lazy = true,
    version = false, -- last release is way too old
  },

  -- python
  {
    'linux-cultist/venv-selector.nvim',
    cmd = 'VenvSelect',
    opts = function(_, opts)
      if require('lazyvim.util').has 'nvim-dap-python' then
        opts.dap_enabled = true
      end
      return vim.tbl_deep_extend('force', opts, {
        name = {
          'venv',
          '.venv',
          'env',
          '.env',
        },
      })
    end,
    keys = keymaps.venv_selector,
  },
}
