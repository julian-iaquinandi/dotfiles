local function findReplaceWithWord()
  local word = vim.fn.expand("<cword>")
  local command = ":%s/" .. word .. "/"
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(command, true, false, true), "n", true)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("/g<Left><Left>", true, false, true), "n", true)
end

local function findAndReplace()
  local command = ":%s///g"
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(command, true, false, true), "n", true)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Left><Left><Left>", true, false, true), "n", true)
end

vim.keymap.set("n", "<leader>s;", findReplaceWithWord, { desc = "Search & Replace in buffer" })

vim.keymap.set("n", "<leader>s:", findAndReplace, { desc = "Search & Replace in buffer" })
