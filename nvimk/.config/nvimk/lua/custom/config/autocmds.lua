-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- persisted
local group = vim.api.nvim_create_augroup('PersistedHooks', {})

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'PersistedTelescopeLoadPre',
  group = group,
  callback = function(session)
    -- Save the currently loaded session using a global variable
    require('persisted').save { session = vim.g.persisted_loaded_session }

    -- Delete all of the open buffers
    vim.api.nvim_input '<ESC>:%bd!<CR>'
  end,
})
