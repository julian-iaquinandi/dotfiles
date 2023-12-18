local M = {
  -- editor

	-- { "JoosepAlviste/nvim-ts-context-commentstring" },

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

  -- code
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

  -- lang tools
  
  -- rust
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require('rust-tools').setup(opts)
    end
  },

  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  -- svelte 
  {
    "leafOfTree/vim-svelte-plugin",
    ft = "svelte",
    config = function ()
      vim.g.vim_svelte_plugin_use_typescript = 1
    end
  },

  -- dap
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      require("dapui").setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },

  {
    "mfussenegger/nvim-dap",
    init = function()
      require "custom.configs.dap"
      -- require("core.utils").load_mappings("dap")
    end
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end
  },

  {
    "github/copilot.vim",
    event = "VeryLazy",
    -- config = function()
    --   local copilot = require("copilot")
    --   copilot.setup(require("custom.configs.copilot"))
    -- end
  },

  {
    "David-Kunz/gen.nvim",
    event = "VeryLazy",
    opts = {
      model = "codellama:13b", -- The default model to use.
      display_mode = "float", -- The display mode. Can be "float" or "split".
      show_prompt = false, -- Shows the Prompt submitted to Ollama.
      show_model = false, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = false, -- Never closes the window automatically.
      init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
      -- Function to initialize Ollama
      command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a lua function returning a command string, with options as the input parameter.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      list_models = '<omitted lua function>', -- Retrieves a list of model names
      debug = false -- Prints errors and the command which is run.
    }
  },


  {
    'jpmcb/nvim-llama',
    event = "VeryLazy",
    config = function()
      require('nvim-llama').setup {
        debug = false,
        model = codellama
      }
    end
  },

  -- {
  --   "dreamsofcode-io/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim"
  --   },
  --   config = function()
  --     require("chatgpt").setup({
  --       async_api_key_cmd = "pass show api/openai",
  --     })
  --   end,
  -- },
}

return M
