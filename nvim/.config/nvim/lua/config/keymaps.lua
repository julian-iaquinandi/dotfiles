-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.g.neovide_input_macos_option_key_is_meta = true

local opts = {
  noremap = true,
  silent = true,
}

local set = vim.keymap.set

-- Movement remaps
set("n", ";", "<Right>", opts)
set("n", "l", "<Up>", opts)
set("n", "k", "<Down>", opts)
set("n", "j", "<Left>", opts)
set("n", "h", ";", opts)

set("v", ";", "<Right>", opts)
set("v", "l", "<Up>", opts)
set("v", "k", "<Down>", opts)
set("v", "j", "<Left>", opts)
set("v", "h", ";", opts)

-- Move focus
set("n", "<A-m>", "<C-w>h", opts)
set("n", "<A-,>", "<C-w>j", opts)
set("n", "<A-.>", "<C-w>k", opts)
set("n", "<A-/>", "<C-w>l", opts)

set("n", "<M-p>", "G", opts)
set("n", "<M-u>", "gg", opts)
set("n", "<M-i>", "<C-d>", opts)
set("n", "<M-o>", "<C-u>", opts)

-- Exit insert mode
set("i", "jk", "<ESC><C-w>w i", opts)
set("i", "jj", "<ESC>", opts)
set("i", "jl", "<C-\\><C-n><C-w>w :lua SwapBufferAndResize()<CR>", {
  noremap = true,
})
set("i", "A-.", "<ESC>", opts)

-- .
function YankEntireDocument()
  -- Save the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)

  -- Yank the entire document
  vim.cmd("normal! ggVGy")

  -- Restore the cursor position
  vim.api.nvim_win_set_cursor(0, cursor_pos)
end

set("n", "ya", "<cmd>lua YankEntireDocument()<CR>", { desc = "Yank all", noremap = true, silent = true })

set("n", "<leader>qr", ":%s/\t/  /g<CR>", { noremap = true, silent = true })

-- .

-- Exit terminal mode
set("t", "jk", "<C-\\><C-n><C-w>w", {
  noremap = true,
})

set("t", "jj", "<C-\\><C-n>", {
  noremap = true,
})

set("t", "jl", "<C-\\><C-n><C-w>w :lua SwapBufferAndResize()<CR>", {
  noremap = true,
})

set("t", "jz", "<cmd>lua exitTerminalAndZoom()<cr>", {
  noremap = true,
  silent = true,
})

-- Yank
set("n", "<leader>y", "<Plug>OSCYankOperator", { desc = "yank to system" })
-- vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
set("v", "<leader>y", "<Plug>OSCYankVisual", { desc = "yank to system" })

set("x", "<leader>;", [["_dP]])

M = {}

M.copilot = {
  {
    "<leader>at",
    "<cmd>ToggleRequirementsTag<cr>",
    desc = "Toggle Requirements Tag",
  },
}

M.noice = {
  {
    "<S-Enter>",
    function()
      require("noice").redirect(vim.fn.getcmdline())
    end,
    mode = "c",
    desc = "Redirect Cmdline",
  },
  {
    "<leader>snl",
    function()
      require("noice").cmd("last")
    end,
    desc = "Noice Last Message",
  },
  {
    "<leader>snh",
    function()
      require("noice").cmd("history")
    end,
    desc = "Noice History",
  },
  {
    "<leader>sna",
    function()
      require("noice").cmd("all")
    end,
    desc = "Noice All",
  },
  {
    "<leader>snd",
    function()
      require("noice").cmd("dismiss")
    end,
    desc = "Dismiss All",
  },
  {
    "<c-f>",
    function()
      if not require("noice.lsp").scroll(4) then
        return "<c-f>"
      end
    end,
    silent = true,
    expr = true,
    desc = "Scroll forward",
    mode = { "i", "n", "s" },
  },
  {
    "<c-b>",
    function()
      if not require("noice.lsp").scroll(-4) then
        return "<c-b>"
      end
    end,
    silent = true,
    expr = true,
    desc = "Scroll backward",
    mode = { "i", "n", "s" },
  },
}

M.which_key = {
  { "<leader>m", "<cmd>bn<cr>", desc = "buffer next" },
  { "<leader>n", "<cmd>bp<cr>", desc = "buffer previous" },
  { "<leader>p", require("fzf-lua").files, desc = "Fzf Files" },
  { "<leader>P", require("fzf-lua").oldfiles, desc = "Recent Files" },
  { "<leader>w", "<cmd>w<cr>", desc = "write file" },
}

return M
