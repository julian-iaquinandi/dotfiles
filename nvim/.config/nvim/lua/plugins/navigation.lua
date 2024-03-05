local pickers = require 'utils.pickers'
local buffers = require 'utils.buffers'

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
        ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },

        -- general
        ['<leader>w'] = { '<cmd>w<cr>', 'write file' },
        ['<leader>W'] = { '<cmd> wa <cr>', 'write all files' },

        ['<leader>m'] = { '<cmd>bn<cr>', 'buffer next' },
        ['<leader>n'] = { '<cmd>bp<cr>', 'buffer previous' },

        -- pickers
        ['<leader>P'] = { pickers.invoke_command_pallete, '[P]icker command [p]allete' },
        ['<leader>ai'] = { '<cmd>Gen<cr>', 'Gen AI' },
        -- ["<leader>ao"] = { pickers.invoke_picker("ollama"), "ollama" },
        -- ["<leader>ac"] = { pickers.invoke_picker("code-actions"), "code actions" },
        -- ["<leader>ap"] = { pickers.invoke_command_pallete, "command pallete" },
        -- ["<leader>vs"] = { "<cmd>lua WswapAndCycleWindow()<cr>", "swap window" },

        -- window/panes
        ['<leader>vs'] = { buffers.swap_buffer_and_resize, 'swap window' },
        ['<leader>vv'] = { '<cmd>lua layout0()<cr>', 'window layout 1' },
        ['<leader>vz'] = { '<cmd>lua zoom()<cr>', 'window zoom' },
      }
    end,
  },

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-telescope/telescope-file-browser.nvim' },

      -- Useful for getting pretty icons, but requires special font.
      --  If you already have a Nerd Font, or terminal set up with fallback fonts
      --  you can enable this
      -- { 'nvim-tree/nvim-web-devicons' }
    },

    keys = {
      { '<leader>p', '<cmd>Telescope find_files <cr>', 'Find files ' },
      -- { '<leader>fw', '<cmd>Telescope live_grep<cr>', 'Find in files' },
    },

    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            n = { ['q'] = require('telescope.actions').close },
            i = { ['<esc>'] = require('telescope.actions').close },
          },

          vimgrep_arguments = {
            'rg',
            '-L',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
          },

          -- prompt_prefix = ' ï€‚  ',
          -- selection_caret = '  ',
          -- entry_prefix = '  ',
          initial_mode = 'insert',
          selection_strategy = 'reset',
          sorting_strategy = 'ascending',
          layout_strategy = 'horizontal',
          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            -- height = 0.80,
            -- width = function(_, max_columns)
            --   local percentage = 0.5
            --   local max = 300
            --   return math.min(math.floor(percentage * max_columns), max)
            -- end,
            height = function(_, _, max_lines)
              local percentage = 0.5
              local min = 50
              return math.max(math.floor(percentage * max_lines), min)
            end,
            preview_cutoff = 120,
          },
          file_sorter = require('telescope.sorters').get_fuzzy_file,
          file_ignore_patterns = { 'node_modules' },
          generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
          path_display = { 'truncate' },
          winblend = 0,
          border = {},
          -- borderchars = { 'â”€', 'â”‚', 'â”€', 'â”‚', 'â•­', 'â•®', 'â•¯', 'â•°' },
          color_devicons = true,
          set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
          file_previewer = require('telescope.previewers').vim_buffer_cat.new,
          grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
          qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
        },

        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },

          persisted = {
            layout_config = { width = 0.55, height = 0.55 },
          },

          file_browser = {
            theme = 'ivy',
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
              ['i'] = {
                -- your custom insert mode mappings
              },
              ['n'] = {
                -- your custom normal mode mappings
              },
            },
          },
        },
      }

      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'persisted')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sb', ':Telescope file_browser<CR>', { desc = '[S]earch Files [B]rowser' })
      vim.keymap.set('n', '<leader>sv', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = '[S]earch Files [B]rowser' })
      vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set(
        'n',
        '<leader><leader>',
        ":lua require('telescope.builtin').buffers({ sort_lastused = true, ignore_current_buffer = true })<cr>",
        { desc = '[ ] Find existing buffers' }
      )

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    vscode = true,
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}
