local M = {}
local fzf = require("fzf-lua")

local chat_history_path = "/Users/juliani/.local/share/nvim/copilotchat_history/"

local function construct_full_path(file)
  -- print("File Con '" .. file .. "' loaded.")
  -- Ensure there is a single slash between the directory and the file name
  return chat_history_path .. (file:sub(1, 1) == "/" and file:sub(2) or file)
end

local function trim(s)
  return s:match("^%s*(.-)%s*$")
end

function M.load(file)
  if file == nil or file == "" then
    fzf.files({
      prompt = "Select chat file: ",
      cwd = chat_history_path,
      actions = {
        ["default"] = function(selected)
          print("Selected: " .. selected[1])
          local filename = selected[1]
          local filename_without_extension = filename:match("(.+)%..+")
          local trimmed_filename = trim(filename_without_extension)
          print("Filename without extension: " .. filename_without_extension)
          print("Trimmed filename: " .. trimmed_filename)
          vim.defer_fn(function()
            vim.cmd("CopilotChatLoad " .. trimmed_filename)
            print("Executed command: CopilotChatLoad " .. trimmed_filename)
          end, 100) -- Delay execution by 100 milliseconds
        end,
      },
    })
  else
    local filename_without_extension = file:match("(.+)%..+")
    local trimmed_filename = trim(filename_without_extension)
    print("Filename without extension: " .. filename_without_extension)
    print("Trimmed filename: " .. trimmed_filename)
    vim.defer_fn(function()
      vim.cmd("CopilotChatLoad " .. trimmed_filename)
      print("Executed command: CopilotChatLoad " .. trimmed_filename)
      print("File '" .. file .. "' loaded.")
    end, 100) -- Delay execution by 100 milliseconds
  end
end

function M.save(file)
  if file == nil or file == "" then
    print("No file specified.")
    return
  end

  vim.cmd("CopilotChatSave " .. file)
  print("File '" .. file .. "' saved.")
end

function M.delete(file)
  if file == nil or file == "" then
    print("No file specified.")
    return
  end
  local full_path = construct_full_path(file)
  -- Implement delete logic here
  print("File '" .. file .. "' deleted.")
end

return M
