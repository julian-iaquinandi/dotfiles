-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.ignorecase = true
vim.opt.smartcase = true

---- Wrapping
vim.opt.wrap = true
vim.wo.linebreak = true -- Avoid breaking mid-word
vim.opt.breakindent = true -- Indent wrapped lines
vim.opt.showbreak = "⤷ " -- Add visual indicator for wrapped lines

local function set_buffer_options(wrapwidth, tabwidth, expandtab)
  vim.cmd("Wrapwidth " .. wrapwidth)
  vim.wo.colorcolumn = tostring(wrapwidth + 1) -- Automatically set colorcolumn to wrapwidth + 1
  vim.o.tabstop = tabwidth -- A TAB character looks like `tabwidth` spaces
  vim.o.shiftwidth = tabwidth -- Number of spaces inserted when indenting
  vim.o.softtabstop = tabwidth -- Spaces inserted instead of a TAB character
  vim.o.expandtab = expandtab -- true: TAB key inserts spaces
end

-- General settings for all files
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    set_buffer_options(80, 2, true)
  end,
})

-- Specific settings for C# and Rust files
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.cs", "*.rs" },
  callback = function()
    set_buffer_options(100, 4, true)
  end,
})
