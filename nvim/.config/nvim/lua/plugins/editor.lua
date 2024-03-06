-- local windows = require 'utils.windows'
local keymaps = require 'config.keymaps'
local enabled = require 'config.enabled'

return {
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  {
    'marklcrns/vim-smartq',
    enabled = enabled.vim_smartq,
    event = 'BufRead',
    key = {
      ['<leader>q'] = { '<cmd> SmartQ<cr>', 'close file' },
      ['<leader>Q'] = { '<cmd> SmartQ!<cr>', 'close file force' },
    },
  },

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    enabled = enabled.gitsigns,
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    enabled = enabled.mini,
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      -- require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      -- local statusline = require 'mini.statusline'
      -- statusline.setup()
      --
      -- -- You can configure sections in the statusline by overriding their
      -- -- default behavior. For example, here we set the section for
      -- -- cursor location to LINE:COLUMN
      -- ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return '%2l:%-2v'
      -- end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },

  {
    'zbirenbaum/copilot.lua',
    enabled = enabled.copilot,
    cmd = 'Copilot',
    build = ':Copilot auth',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },

  {
    'zbirenbaum/copilot-cmp',
    dependencies = 'copilot.lua',
    opts = {},
    config = function(_, opts)
      local copilot_cmp = require 'copilot_cmp'
      copilot_cmp.setup(opts)
      -- attach cmp source whenever copilot attaches
      -- fixes lazy-loading issues with the copilot cmp source
      require('lazyvim.util').lsp.on_attach(function(client)
        if client.name == 'copilot' then
          copilot_cmp._on_insert_enter {}
        end
      end)
    end,
  },

  {
    'olimorris/persisted.nvim',
    enabled = enabled.persisted,
    keys = keymaps.persisted,
    config = true,
    opts = {
      autosave = true,
      use_git_branch = true,
      autoload = true,
    },
  },

  {
    'nvim-pack/nvim-spectre',
    enabled = enabled.nvim_spectre,
    build = false,
    cmd = 'Spectre',
    opts = { open_cmd = 'noswapfile vnew' },
    -- stylua: ignore
    keys = keymaps.spectre
,
  },

  {
    'folke/trouble.nvim',
    enabled = enabled.trouble,
    cmd = { 'TroubleToggle', 'Trouble' },
    opts = { use_diagnostic_signs = true },
    keys = keymaps.trouble,
  },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    enabled = enabled.todo_comments,
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    enabled = enabled.comment,
    opts = {},
    event = 'BufEnter',
  },

  {
    'akinsho/toggleterm.nvim',
    enabled = enabled.toggleterm,
    event = 'VeryLazy',
    version = '*',
    config = true,
    opts = {
      size = function(term)
        if term.direction == 'horizontal' then
          return 20
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
    },
    keys = keymaps.terminal,
  },

  {
    'nvim-tree/nvim-tree.lua',
    enabled = enabled.nvim_tree,
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        -- update_focused_file = {
        --   enable = true,
        -- },
        view = {
          side = 'right',
          width = 40,
        },
      }
    end,
    keys = keymaps.nvim_tree,
  },

  {
    'sindrets/diffview.nvim',
    enabled = enabled.diffview,
    dependencies = {
      { 'kdheepak/lazygit.nvim' },
    },
    keys = keymaps.diffview,
  },
}
