-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')


local opts = { noremap = true, silent = true }

-- Move focus
vim.api.nvim_set_keymap('n', '<A-m>', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<A-,>', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<A-.>', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<A-/>', '<C-w>l', opts)

-- Exit insert mode
vim.api.nvim_set_keymap('i', 'jk', '<ESC><C-w>w i', opts)
vim.api.nvim_set_keymap('i', 'jj', '<ESC>', opts)
vim.api.nvim_set_keymap('i', 'jl', '<C-\\><C-n><C-w>w :lua SwapBufferAndResize()<CR>', { noremap = true })

-- Exit terminal mode
vim.api.nvim_set_keymap('t', 'jk', '<C-\\><C-n><C-w>w', { noremap = true })
vim.api.nvim_set_keymap('t', 'jj', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('t', 'jl', '<C-\\><C-n><C-w>w :lua SwapBufferAndResize()<CR>', { noremap = true })
vim.api.nvim_set_keymap('t', 'jz', '<cmd>lua exitTerminalAndZoom()<cr>', { noremap = true, silent = true })

-- Remap movement keys
vim.api.nvim_set_keymap('n', 'j', 'h', opts)
vim.api.nvim_set_keymap('n', 'k', 'j', opts)
vim.api.nvim_set_keymap('n', 'l', 'k', opts)
vim.api.nvim_set_keymap('n', ';', 'l', opts)
