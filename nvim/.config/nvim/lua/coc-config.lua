vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", {silent = true})
vim.api.nvim_set_keymap("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})

vim.api.nvim_set_keymap("n", "ga", "<Plug>(coc-codeaction-line)", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gA", "<Plug>(coc-codeaction)", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gs", "<Plug>(coc-codeaction-cursor)", {silent = true, noremap = true})

vim.api.nvim_set_keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<TAB>", "pumvisible() ? '<C-n>' : '<TAB>'", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<S-TAB>", "pumvisible() ? '<C-p>' : '<C-h>'", {noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "pumvisible() ? coc#_select_confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", {silent = true, expr = true, noremap = true})

-- vim.api.nvim_set_keymap("i", "<C-l>", "<Plug>(coc-snippets-expand)", {})
-- vim.api.nvim_set_keymap("v", "<C-j>", "<Plug>(coc-snippets-select)", {})
-- vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>(coc-snippets-expand-jump)", {})

vim.api.nvim_command([[autocmd CursorHold * silent call CocActionAsync('highlight')]])
vim.g.coc_global_extensions = {
  "coc-snippets",
  "coc-json",
  "coc-volar",
  "coc-prettier",
  "coc-tsserver",
  "coc-eslint",
  "coc-pairs",
  "coc-highlight"
}

