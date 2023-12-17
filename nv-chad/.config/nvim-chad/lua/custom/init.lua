vim.g.dap_virtual_text = true

-- vim.g:tmux_navigator_no_mappings = 1
vim.cmd([[noremap <silent> A-j :<C-U>TmuxNavigateLeft<cr>]])
vim.cmd([[noremap <silent> A-k :<C-U>TmuxNavigateDown<cr>]])
vim.cmd([[noremap <silent> A-l :<C-U>TmuxNavigateUp<cr>]])
vim.cmd([[noremap <silent> A-; :<C-U>TmuxNavigateRight<cr>]])
vim.cmd([[noremap <silent> A-h :<C-U>TmuxNavigatePrevious<cr>]])
