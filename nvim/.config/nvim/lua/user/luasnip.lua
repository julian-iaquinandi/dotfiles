local opts = {
  paths = {
    "~/.config/nvim/snippets/my-snippets",
    "~/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  -- include = {
  --   "global",
  --   "javascript",
  --   "vue"
  -- }
}

require("luasnip.loaders.from_vscode").load(opts)


