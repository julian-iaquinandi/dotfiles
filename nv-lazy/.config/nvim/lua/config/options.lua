-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.fn.has("win32") == 1 or vim.fn.has("win32unix") == 1 then
  local powershell_options = {
    shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
  }

  for option, value in pairs(powershell_options) do
    vim.opt[option] = value
  end
  if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font,Segoe UI Emoji:h11"
    vim.g.neovide_transparency = 0.9
  end
end

if vim.fn.has("mac") == 1 then
  vim.opt.shell = "/bin/zsh"

  if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font:h16"
    vim.g.neovide_transparency = 0.9
  end
end
