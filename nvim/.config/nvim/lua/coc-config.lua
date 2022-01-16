
vim.api.nvim_command([[autocmd CursorHold * silent call CocActionAsync('highlight')]])
vim.g.coc_global_extensions = {
  "coc-marketplace",
  "coc-snippets",
  "coc-json",
  -- "coc-volar",
  "coc-prettier",
  "coc-tsserver",
  "coc-eslint",
  "coc-pairs",
  "coc-highlight",
  "coc-sumneko-lua"
}

