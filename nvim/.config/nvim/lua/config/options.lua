vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

vim.opt.colorcolumn = "80"

vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.foldcolumn = "0"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true

if vim.fn.has("nvim-0.8") == 1 then
	vim.opt.backup = true
	vim.opt.cmdheight = 0
	vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
end

-- if vim.g.neovide then
-- 	vim.opt.guifont = { "FiraCode Nerd Font Mono", "h9" }
-- 	vim.g.neovide_scale_factor = 0.3
-- end

-- vim.g.node_host_prog = "/Users/folke/.pnpm-global/5/node_modules/neovim/bin/cli.js"
-- vim.g.loaded_python3_provider = 0
-- vim.g.loaded_perl_provider = 0
-- vim.g.loaded_ruby_provider = 0
-- vim.g.loaded_node_provider = 0

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.cmd([[
let g:nvim_tree_auto_close=1
]])

-- vim.g.gitblame_enabled = 0

-- vim.cmd([[
--   let g:coc_global_extensions = ['coc-marketplace']
-- ]])

-- vim.g.coc_global_extensions = {
--     "coc-marketplace",
--     "coc-eslint",
--     "@raidou/coc-prettier-v3",
--     "coc-yaml",
--     "coc-json",
--     "@echemoo/coc-tailwindcss3",
--     "coc-emmet",
--     "coc-pairs",
--     "coc-react-refactor",
--     "@yaegassy/coc-marksman",
--     "@statiolake/coc-sumneko-lua",
--     "coc-tsserver"
-- }
