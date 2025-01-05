local RequirementsTag = {
  enabled = true, -- Default state: enabled
}

function RequirementsTag.insert()
  local line = " > #file:./REQUIREMENTS.md"
  vim.api.nvim_put({ line }, "l", true, true) -- Insert the text below the current line
  vim.api.nvim_feedkeys("o", "n", true) -- Move to the next line in insert mode

  vim.schedule(function()
    vim.cmd("stopinsert") -- Exit insert mode
    vim.api.nvim_feedkeys("xi", "n", true) -- Move to the next line (insert mode again)
  end)
end

function RequirementsTag.detect()
  local total_lines = vim.api.nvim_buf_line_count(0)
  local last_lines = vim.api.nvim_buf_get_lines(0, math.max(0, total_lines - 3), total_lines, false)
  local search_string = "> #file:./REQUIREMENTS.md"

  for _, line in ipairs(last_lines) do
    if string.find(line, search_string, 1, true) then
      return true
    end
  end
  return false
end

function RequirementsTag.toggle()
  RequirementsTag.enabled = not RequirementsTag.enabled
  print("RequirementsTag is now " .. (RequirementsTag.enabled and "enabled" or "disabled"))
end

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "copilot-*",
  callback = function()
    if not RequirementsTag.enabled then
      return -- Exit early if the feature is disabled
    end
    if vim.bo.filetype == "copilot" then
      return -- Skip processing for Copilot buffers
    end
    if not RequirementsTag.detect() then
      RequirementsTag.insert()
    end
  end,
})

vim.api.nvim_create_user_command("ToggleRequirementsTag", function()
  RequirementsTag.toggle()
end, {})
