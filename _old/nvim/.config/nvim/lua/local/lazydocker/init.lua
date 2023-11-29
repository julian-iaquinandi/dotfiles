-- lazydocker/init.lua

local M = {}

function M.open_floating_window(user_width, user_height)
  -- Create a buffer and window for the floating terminal
  local buf = vim.api.nvim_create_buf(false, true)

  -- Set the window width and height based on user input or use default values
  local width = user_width or vim.api.nvim_get_option("columns") - 4
  local height = user_height or vim.api.nvim_get_option("lines") - 4

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = 2,
    row = 2,
    style = "minimal",
  })

  -- Start Lazy Docker
  local job_id = vim.fn.termopen("lazydocker")

  -- When 'q' is pressed in normal mode, close the window
  vim.api.nvim_buf_set_keymap(buf, "n", "q", ":close<CR>", { noremap = true, silent = true })

  -- When 'q' is pressed in Terminal-Job mode, send SIGINT, leave Terminal-Job mode, and close the window
  vim.api.nvim_buf_set_keymap(
    buf,
    "t",
    "q",
    "<C-\\><C-N>:call jobstop(" .. job_id .. ")<CR>:close<CR>",
    { noremap = true, silent = true }
  )

  -- Autoclose the window/buffer when the process ends
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

  -- Give the focus to the terminal
  vim.api.nvim_set_current_win(win)

  -- Switch to Insert mode after a small delay
  vim.defer_fn(function()
    vim.cmd("startinsert")
  end, 10)
end
return M
