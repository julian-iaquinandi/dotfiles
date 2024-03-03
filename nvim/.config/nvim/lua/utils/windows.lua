local M = {}

M.resize_windows = function()
  -- Resize the first window to 50
  vim.cmd("0wincmd |")
  vim.cmd("resize 50")

  -- Function to check if NvimTree is open
  local function isNvimTreeOpen()
    for _, win in pairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)):match("NvimTree") then
        return true, win
      end
    end
    return false, nil
  end

  local function isToggleTermOpen()
    local toggleTermBufs = vim.api.nvim_exec("ls!", true)
    return toggleTermBufs:match("ToggleTerm")
  end

  -- Check if NvimTree is open
  local isOpen, nvimTreeWin = isNvimTreeOpen()

  if isOpen then
    -- If NvimTree is open, focus the window and resize it
    vim.api.nvim_set_current_win(nvimTreeWin)
    vim.cmd("vertical resize 40")
  else
    -- If NvimTree is not open, open it and resize
    vim.cmd("NvimTreeOpen") -- This command might vary based on your NvimTree configuration
    -- Need to wait for NvimTree to open before resizing
    vim.defer_fn(function()
      local _, newNvimTreeWin = isNvimTreeOpen()
      if newNvimTreeWin then
        vim.api.nvim_set_current_win(newNvimTreeWin)
        vim.cmd("vertical resize 40")
      end
    end, 100) -- Adjust delay as needed
  end

  -- Toggle or resize ToggleTerm
  if isToggleTermOpen() then
    -- Assuming you have a horizontal toggle term with a specific ID
    -- Adjust the command as needed based on your toggleterm setup
    vim.cmd("ToggleTerm size=20 direction=horizontal")
  else
    vim.cmd("ToggleTerm direction=horizontal")
  end
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

_G.layout0 = M.resize_windows
_G.zoom = M.zoom
_G.exitTerminalAndZoom = M.exitTerminalAndZoom

return M
