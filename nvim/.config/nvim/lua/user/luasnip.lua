local opts = {
  paths = {
    "~/.config/nvim/snippets/my-snippets",
    "~/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  include = {
    "global",
    "javascript"
  }
}

require("luasnip.loaders.from_vscode").load(opts)


