function SwapBufferAndResize()
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
    print("No window to swap with.")
    return
  end

  -- Swap the buffers between the current and target windows.
  local current_buf = vim.api.nvim_win_get_buf(current_win)
  local target_buf = vim.api.nvim_win_get_buf(target_win)
  vim.api.nvim_win_set_buf(current_win, target_buf)
  vim.api.nvim_win_set_buf(target_win, current_buf)

  -- Swap sizes
  -- local cur_height = vim.api.nvim_win_get_height(current_win)
  -- local target_height = vim.api.nvim_win_get_height(target_win)
  -- vim.api.nvim_win_set_height(current_win, target_height)
  -- vim.api.nvim_win_set_height(target_win, cur_height)
end

_G.SwapBufferAndResize = SwapBufferAndResize
vim.api.nvim_set_keymap("n", "<leader>vs", ":lua SwapBufferAndResize()<CR>", { noremap = true, silent = true })

return {
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {

        -- general
        ["<leader>w"] = { "<cmd>w<cr>", "Write file" },
        ["<leader>W"] = { "<cmd> wa <cr>", "write all files" },
        -- ["<leader>xx"] = { "<cmd> wqa <cr>", "write & quit" },
        -- ["<leader>XX"] = { "<cmd> qa! <cr>", "force quit" },
        ["<leader>q"] = { "<cmd> SmartQ<cr>", "close file" },
        ["<leader>Q"] = { "<cmd> SmartQ!<cr>", "close file force" },
        ["<leader>xb"] = { "<cmd>%bd|e#<cr>", "close all buffers but current" },

        -- find
        ["<leader>P"] = { "<cmd>HopPasteChar1<cr>", "paste at position" },
        ["<leader>y"] = { "<cmd>HopYankChar1<cr>", "yank between positions" },

        ["<leader>th"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "terminal horizontal" },
        ["<leader>tv"] = { "<cmd>ToggleTerm direction=vertical<cr>", "terminal vertical" },

        -- ["<leader>vs"] = { "<cmd>lua WswapAndCycleWindow()<cr>", "swap window" },
      },
    },
  },
}
