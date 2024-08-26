-- bootstrap lazy.nvim, LazyVim and your plugins

if vim.g.vscode then
  -- VSCode extension
  require("vscode_init")
else
  require("config.lazy")
  require("utils.windows")
end
