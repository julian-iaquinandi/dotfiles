local M = {}

local function is_terminal_buffer_open()
  -- Get the list of all buffer IDs
  local buffers = vim.api.nvim_list_bufs()

  -- Iterate through all buffers
  for _, buf in ipairs(buffers) do
    -- Check if the buffer type is 'terminal'
    if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
      -- A terminal buffer is found
      return true
    end
  end

  -- No terminal buffer is found
  return false
end

M.layout_one = function()
  -- Resize the first window to 50, but this might need adjustment based on your layout preferences
  vim.cmd("0wincmd |")
  vim.cmd("resize 50")

  -- Function to check if NvimTree is open and return its window
  local function isNvimTreeOpen()
    for _, win in pairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)):match("NvimTree") then
        return true, win
      end
    end
    return false, nil
  end

  -- Ensure NvimTree is open and resize it
  vim.cmd("NvimTreeOpen")
  vim.defer_fn(function()
    local _, nvimTreeWin = isNvimTreeOpen()
    if nvimTreeWin then
      vim.api.nvim_set_current_win(nvimTreeWin)
      vim.cmd("vertical resize 40")
    end
  end, 100) -- Adjust delay as needed

  if not is_terminal_buffer_open() then
    vim.cmd("ToggleTerm size=20 direction=horizontal")
  end

  -- NvimTree_1
end

if not _G.winZoomStates then
  _G.winZoomStates = {}
end

_G.winZoomState = {
  zoomedWinId = nil, -- ID of the currently zoomed window, if any
}

M.zoom = function(targetWinId)
  local currentWinId = vim.api.nvim_get_current_win()

  -- Determine the target window for zooming
  local winId = targetWinId or currentWinId

  -- Check if the target window is already zoomed
  if _G.winZoomState.zoomedWinId == winId then
    -- Unzoom the window
    vim.cmd("resize " .. _G.winZoomStates[winId].oldHeight)
    vim.cmd("vertical resize " .. _G.winZoomStates[winId].oldWidth)
    _G.winZoomState.zoomedWinId = nil -- Clear the zoomed window state
  else
    -- Zoom the target window
    if _G.winZoomState.zoomedWinId then
      -- First unzoom the currently zoomed window, if any
      local zoomedWinId = _G.winZoomState.zoomedWinId
      vim.cmd(zoomedWinId .. "wincmd =") -- Reset the layout
      vim.cmd("resize " .. _G.winZoomStates[zoomedWinId].oldHeight)
      vim.cmd("vertical resize " .. _G.winZoomStates[zoomedWinId].oldWidth)
    end
    -- Store current window size before zooming
    _G.winZoomStates[winId] = {
      oldWidth = vim.api.nvim_win_get_width(winId),
      oldHeight = vim.api.nvim_win_get_height(winId),
    }
    -- Maximize the target window
    vim.cmd(winId .. "wincmd _")
    vim.cmd(winId .. "wincmd |")
    _G.winZoomState.zoomedWinId = winId -- Update the zoomed window state
  end
end

M.exitTerminalMode = function()
  local keys = vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true)
  vim.api.nvim_feedkeys(keys, "n", true)
end

M.exitTerminalAndZoom = function()
  M.exitTerminalMode()
  M.zoom()
end

vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "*",
  callback = function()
    local currentWinId = vim.api.nvim_get_current_win()
    if _G.winZoomState.zoomedWinId and _G.winZoomState.zoomedWinId ~= currentWinId then
      -- Call the zoom toggle function for the new window
      zoom(currentWinId)
    end
  end,
})

M.show_command_output = function(cmd)
  -- Determine the window dimensions
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")

  -- Calculate the floating window size
  local win_height = math.ceil(height * 0.8 - 4)
  local win_width = math.ceil(width * 0.8)
  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  -- Define the buffer and window options
  local buf = vim.api.nvim_create_buf(false, true)
  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = "rounded",
  }

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Set up the terminal in the floating window to run the given command
  vim.api.nvim_command("term " .. cmd)

  -- Auto close the window on process exit
  vim.api.nvim_buf_attach(buf, false, {
    on_detach = function()
      vim.api.nvim_win_close(win, true)
    end,
  })
end

M.close_all_splits_except_current = function()
  -- Get the current window ID
  local current_win = vim.api.nvim_get_current_win()

  -- Get the list of all window IDs in the current tabpage
  local windows = vim.api.nvim_tabpage_list_wins(0)

  -- Iterate through all windows
  for _, win in ipairs(windows) do
    -- If the window is not the current window, close it
    if win ~= current_win then
      -- `true` means force closing without saving changes; change to `false` to prompt saving
      vim.api.nvim_win_close(win, true)
    end
  end
end

_G.layout_one = M.layout_one
_G.zoom = M.zoom
_G.exitTerminalAndZoom = M.exitTerminalAndZoom
_G.show_command_output = M.show_command_output
_G.close_all_splits_except_current = M.close_all_splits_except_current

return M
