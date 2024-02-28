-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- function OS()
--   return package.config:sub(1, 1) == "\\" and "win" or "unix"
-- end

-- if OS() == "win" then
vim.o.shell = "C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe"
-- end

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h11"
  vim.g.neovide_transparency = 0.9
end
