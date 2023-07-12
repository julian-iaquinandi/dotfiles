<<<<<<< HEAD
require('config.keymaps')
require('config.options')
require("config.lazy")({
    defaults = {
        lazy = true,
    },
    performance = {
        cache = {
            enabled = true,
        },
    },
})

-- local macros = require('mine.persistent-macros')
-- macros.setup("/Users/juliani/.config/macros.json")

vim.api.nvim_exec([[
    " THEME CHANGER
    function! SetCursorLineNrColorInsert(mode)
        " Insert mode: blue
        if a:mode == "i"
            call VSCodeNotify('nvim-theme.insert')

        " Replace mode: red
        elseif a:mode == "r"
            call VSCodeNotify('nvim-theme.replace')
        endif
    endfunction

    augroup CursorLineNrColorSwap
        autocmd!
        autocmd ModeChanged *:[vV\x16]* call VSCodeNotify('nvim-theme.visual')
        autocmd ModeChanged *:[R]* call VSCodeNotify('nvim-theme.replace')
        autocmd InsertEnter * call SetCursorLineNrColorInsert(v:insertmode)
        autocmd InsertLeave * call VSCodeNotify('nvim-theme.normal')
        autocmd CursorHold * call VSCodeNotify('nvim-theme.normal')
    augroup END
]], false)
=======
if vim.loader then
  vim.loader.enable()
  vim.schedule(function()
    vim.notify("nvim cache is enabled")
  end)
end

local debug = require("util.debug")

if vim.env.VIMCONFIG then
  return debug.switch(vim.env.VIMCONFIG)
end

-- require("util.profiler").start()

vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    vim.schedule(function()
      -- require("lazy.core.cache").inspect()
    end)
  end,
})

-- function OnSave()
--   vim.cmd("TSLspOrganizeSync")
--   vim.cmd("TSLspImportAll")
--   vim.cmd([[ normal :w<cr> ]])
-- end
--
-- vim.cmd([[
--   augroup on_file_write
--     autocmd!
--     autocmd BufWritePost * lua OnSave()
--   augroup END
-- ]])
--
-- vim.g.profile_loaders = true
require("config.lazy")

require("local.lazydocker") -- This should be correct if your file is at ~/.config/nvim/lua/lazydocker/init.lua
vim.api.nvim_command('command! LazyDocker lua require("local.lazydocker").open_floating_window()')

-- require("config.lazy")({
--   debug = false,
--   defaults = {
--     lazy = true,
--     -- cond = false,
--   },
--   performance = {
--     cache = {
--       enabled = true,
--     },
--   },
-- })

-- require("util.dashboard").setup()

-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",
--   callback = function()
--     require("config.env")
--     require("util").version()
--   end,
-- })
>>>>>>> d3840e1411779c8326a1449b0149f4465efd057c
