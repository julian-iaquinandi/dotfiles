local M = {}

local fn = require 'utils.fn'

M.prev_buffer = function()
  vim.cmd 'BufferLineCyclePrev'
end

M.next_buffer = function()
  vim.cmd 'BufferLineCycleNext'
end

M.head = function(tbl)
  return tbl[1]
end

M.close_buffer = function(bufnr)
  if vim.bo.buftype == 'terminal' then
    vim.cmd(vim.bo.buflisted and 'set nobl | enew' or 'hide')
  else
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    local bufhidden = vim.bo.bufhidden

    local bufinfo = M.head(vim.fn.getbufinfo(bufnr))

    if bufinfo and bufinfo.changed == 0 then
      M.prev_buffer()
      vim.cmd('confirm bd' .. bufnr)
      return
    end

    vim.notify 'save file, bruh!'
  end
end

M.is_focused_buffer = function(...)
  local bufname = vim.fn.expand '%'

  return fn.isome({ ... }, function(value)
    return value == bufname
  end)
end

M.is_not_focused_buffer = function(...)
  return not M.is_focused_buffer(...)
end

M.goto_first_buffer = function()
  vim.cmd 'BufferLineGoToBuffer 1'
end

M.swap_buffer_and_resize = function()
  local current_win = vim.api.nvim_get_current_win()
  local windows = vim.api.nvim_tabpage_list_wins(0)

  local target_win = nil
  for i, win in ipairs(windows) do
    if win == current_win then
      -- Determine the target window based on the position.
      target_win = (i < #windows) and windows[i + 1] or windows[i - 1]
      break
    end
  end

  if not target_win then
    print 'No window to swap with.'
    return
  end

  -- Swap the buffers between the current and target windows.
  local current_buf = vim.api.nvim_win_get_buf(current_win)
  local target_buf = vim.api.nvim_win_get_buf(target_win)
  vim.api.nvim_win_set_buf(current_win, target_buf)
  vim.api.nvim_win_set_buf(target_win, current_buf)
end

M.is_default_buffer = function()
  return M.is_not_focused_buffer('NvimTree_1', 'mind', 'spectre', 'gen.nvim', 'Neo-tree')
end

return M
