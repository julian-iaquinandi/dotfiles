-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Wrapping
vim.opt.wrap = true
vim.wo.linebreak = true -- Avoid breaking mid-word
vim.opt.breakindent = true -- Indent wrapped lines
vim.opt.showbreak = "⤷ " -- Add visual indicator for wrapped lines

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.cmd("Wrapwidth 80")
    vim.wo.colorcolumn = tostring(81) -- Highlight max_line_length

    vim.o.tabstop = 2 -- A TAB character looks like 4 spaces
    vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
    vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
    vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting
  end,
})

-- Setting for C# and Rust
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.cs", "*.rs" }, -- Patterns for C# and Rust files
  callback = function()
    vim.cmd("Wrapwidth 100")
    vim.wo.colorcolumn = tostring(101) -- Highlight max_line_length

    vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
    vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
    vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
    vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
  end,
})
