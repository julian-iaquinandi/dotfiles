local Util = require 'lazyvim.util'
local keymaps = require 'config.keymaps'
local enabled = require 'config.enabled'

return {
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- Load the colorscheme here
      vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'stevearc/dressing.nvim',
    lazy = true,
    enabled = enabled.dressing,
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require('lazy').load { plugins = { 'dressing.nvim' } }
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require('lazy').load { plugins = { 'dressing.nvim' } }
        return vim.ui.input(...)
      end
    end,
  },

  {
    'akinsho/bufferline.nvim',
    enabled = enabled.bufferline,
    event = 'VeryLazy',
    keys = keymaps.bufferline,
    opts = {
      options = {
      -- stylua: ignore
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- stylua: ignore
      right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require('lazyvim.config').icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
          return vim.trim(ret)
        end,
        -- offsets = {
        --   {
        --     filetype = 'neo-tree',
        --     text = 'Neo-tree',
        --     highlight = 'Directory',
        --     text_align = 'left',
        --   },
        -- },
      },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd('BufAdd', {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    enalbed = enabled.lualine,
    event = 'VeryLazy',
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = ' '
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require 'lualine_require'
      lualine_require.require = require

      local icons = require('lazyvim.config').icons

      vim.o.laststatus = vim.g.lualine_laststatus

      return {
        options = {
          theme = 'auto',
          globalstatus = true,
          disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'starter' } },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },

          lualine_c = {
            Util.lualine.root_dir(),
            {
              'diagnostics',
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
            { Util.lualine.pretty_path() },
          },
          lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = Util.ui.fg("Statement"),
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = Util.ui.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = Util.ui.fg("Debug"),
          },
            {
              require('lazy.status').updates,
              cond = require('lazy.status').has_updates,
              color = Util.ui.fg 'Special',
            },
            {
              'diff',
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
            { 'progress', separator = ' ', padding = { left = 1, right = 0 } },
            { 'location', padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return ' ' .. os.date '%R'
            end,
          },
        },
        extensions = { 'neo-tree', 'lazy' },
      }
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    enalbed = enabled.indent_blankline,
    event = 'BufEnter',
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
      },
    },
    main = 'ibl',
  },

  {
    'echasnovski/mini.indentscope',
    enalbed = enabled.mini_indentscope,
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = 'BufEnter',
    opts = {
      -- symbol = "▏",
      symbol = '│',
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  {
    'folke/noice.nvim',
    enabled = enabled.noice,
    event = 'VeryLazy',
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      routes = {
        {
          filter = {
            event = 'msg_show',
            any = {
              { find = '%d+L, %d+B' },
              { find = '; after #%d+' },
              { find = '; before #%d+' },
            },
          },
          view = 'mini',
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
      },
    },
    -- stylua: ignore
    keys = keymaps.noice
,
  },

  {
    'rcarriga/nvim-notify',
    enabled = enabled.nvim_notify,
    keys = keymaps.notify,
    opts = {
      timeout = 2000,
      max_height = function()
        return math.floor(vim.o.lines * 0.75)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.75)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
      top_down = false,
      stages = 'fade',
    },
    init = function()
      -- when noice is not enabled, install notify on VeryLazy
      if not Util.has 'noice.nvim' then
        Util.on_very_lazy(function()
          vim.notify = require 'notify'
        end)
      end
    end,
  },

  { 'nvim-tree/nvim-web-devicons', enabled = enabled.nvim_web_devicons, lazy = true },

  { 'MunifTanjim/nui.nvim', enabled = enabled.nui },

  {
    'RRethy/vim-illuminate',
    enabled = enabled.vim_illuminate,
    event = 'BufEnter',
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { 'lsp' },
      },
    },
    config = function(_, opts)
      require('illuminate').configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set('n', key, function()
          require('illuminate')['goto_' .. dir .. '_reference'](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. ' Reference', buffer = buffer })
      end

      map(']]', 'next')
      map('[[', 'prev')

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map(']]', 'next', buffer)
          map('[[', 'prev', buffer)
        end,
      })
    end,
    keys = keymaps.vim_illuminate,
  },

  {
    'hedyhli/outline.nvim',
    enabled = enabled.outline,
    lazy = true,
    cmd = { 'Outline', 'OutlineOpen' },
    keys = keymaps.outline,
    opts = {
      -- Your setup opts here
    },
  },

  {
    'folke/edgy.nvim',
    enabled = enabled.edgy,
    event = 'VeryLazy',
    keys = keymaps.edgy,

    opts = function()
      local opts = {
        right = {
          {
            title = 'NvimTree_1',
            ft = 'Nvim-tree',
            -- filter = function(buf)
            --   return vim.b[buf].neo_tree_source == "filesystem"
            -- end,
            -- pinned = true,
            open = 'NvimTreeFindFileToggle!',
            size = { height = 0.5 },
          },

          {
            title = 'OUTLINE_1',
            ft = 'Outline',
            -- filter = function(buf)
            --   return vim.b[buf].neo_tree_source == "filesystem"
            -- end,
            -- pinned = true,
            open = 'OutlineOpen',
            size = { height = 0.5 },
          },

          -- { title = 'Neotest Summary', ft = 'neotest-summary' },
          -- {
          --   title = "Neo-Tree Git",
          --   ft = "neo-tree",
          --   filter = function(buf)
          --     return vim.b[buf].neo_tree_source == "git_status"
          --   end,
          --   pinned = true,
          --   open = "Neotree position=right git_status",
          -- },
        },

        -- bottom = {
        --   {
        --     ft = "toggleterm",
        --     size = { height = 0.3 },
        --     filter = function(buf, win)
        --       return vim.api.nvim_win_get_config(win).relative == ""
        --     end,
        --   },
        --   {
        --     ft = "noice",
        --     size = { height = 0.4 },
        --     filter = function(buf, win)
        --       return vim.api.nvim_win_get_config(win).relative == ""
        --     end,
        --   },
        --   -- {
        --   --   ft = "lazyterm",
        --   --   title = "LazyTerm",
        --   --   size = { height = 0.4 },
        --   --   filter = function(buf)
        --   --     return not vim.b[buf].lazyterm_cmd
        --   --   end,
        --   -- },
        --   "Trouble",
        --   {
        --     ft = "trouble",
        --     filter = function(buf, win)
        --       return vim.api.nvim_win_get_config(win).relative == ""
        --     end,
        --     size = { height = 30 },
        --   },
        --   { ft = "qf", title = "QuickFix" },
        --   {
        --     ft = "help",
        --     size = { height = 30 },
        --     -- don't open help files in edgy that we're editing
        --     filter = function(buf)
        --       return vim.bo[buf].buftype == "help"
        --     end,
        --   },
        --   { title = "Spectre", ft = "spectre_panel", size = { height = 0.4 } },
        --   { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
        -- },

        keys = {
          -- increase width
          ['<c-Right>'] = function(win)
            win:resize('width', 2)
          end,
          -- decrease width
          ['<c-Left>'] = function(win)
            win:resize('width', -2)
          end,
          -- increase height
          ['<c-Up>'] = function(win)
            win:resize('height', 2)
          end,
          -- decrease height
          ['<c-Down>'] = function(win)
            win:resize('height', -2)
          end,
        },
      }

      return opts
    end,
  },
}
