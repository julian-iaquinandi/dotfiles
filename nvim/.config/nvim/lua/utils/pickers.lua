local M = {}

local fn = require 'utils.fn'

local buffers = require 'utils.buffers'

M.invoke_command_pallete = function()
  local bufname = vim.fn.expand '%'
  local menu = fn.switch(bufname, {
    -- ['neo-tree filesystem [1]'] = function()
    --   return require 'pickers.neo-tree'
    -- end,
    ['default'] = function()
      return require 'pickers.command-palette'
    end,
  })
  require('utils.picker').make(menu)
end

M.invoke_layout_picker = function()
  local bufname = vim.fn.expand '%'
  local menu = fn.switch(bufname, {
    -- ['neo-tree filesystem [1]'] = function()
    --   return require 'pickers.neo-tree'
    -- end,
    ['default'] = function()
      return require 'pickers.layouts'
    end,
  })
  require('utils.picker').make(menu)
end

M.invoke_picker = function(picker)
  if buffers.is_default_buffer() then
    local menu = require('pickers.' .. picker)
    menu.toggle()
  end
end

return M
