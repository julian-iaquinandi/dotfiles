local M = {}

local fn = require 'utils.fn'
local telescope_ui = require 'utils.telescope'
-- local harpoon = require("harpoon")

local actions = {
  {
    space = 'layout_one',
    name = 'Main',
    command = 'lua layout_one()',
  },
  {
    space = 'layout_two',
    name = 'Zoom',
    command = 'lua zoom()',
  },
  {
    space = 'layout_three',
    name = 'close',
    command = 'lua close_all_splits_except_current()',
  },
  -- {
  --   space = 'spectre',
  --   name = 'find & replace',
  --   command = function()
  --     require('spectre').toggle()
  --   end,
  --   keymap = '<D-F>',
  -- },
}

M.actions = fn.imap(actions, function(action)
  return {
    name = action.space .. ': ' .. action.name,
    keymap = action.keymap,
    handler = function()
      fn.switch(action.space, {
        ['telescope'] = function()
          if action.name == 'resume' then
            require('telescope.builtin').resume {
              cache_index = 2,
            }
            return
          end
          if type(action.command) == 'string' then
            return vim.cmd('Telescope ' .. action.command)
          end

          action.command()
        end,
        ['ollama'] = function()
          if type(action.command) == 'string' then
            return vim.cmd('Gen ' .. action.command)
          end

          action.command()
        end,
        ['default'] = function()
          if type(action.command) == 'string' then
            return vim.cmd(action.command)
          end

          action.command()
        end,
      })
    end,
  }
end)

M.options = {
  prompt_title = function()
    return 'Layout selector'
  end,
  theme = require('telescope.themes').get_dropdown {
    layout_config = {
      height = 0.3,
    },
  },
}

return M
