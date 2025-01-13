-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.g.neovide_input_macos_option_key_is_meta = true

local opts = {
  noremap = true,
  silent = true,
}

-- Move focus
vim.api.nvim_set_keymap("n", "<A-m>", "<C-w>h", opts)
vim.api.nvim_set_keymap("n", "<A-,>", "<C-w>j", opts)
vim.api.nvim_set_keymap("n", "<A-.>", "<C-w>k", opts)
vim.api.nvim_set_keymap("n", "<A-/>", "<C-w>l", opts)

vim.api.nvim_set_keymap("n", "<M-p>", "G", opts)
vim.api.nvim_set_keymap("n", "<M-u>", "gg", opts)
vim.api.nvim_set_keymap("n", "<M-i>", "<C-d>", opts)
vim.api.nvim_set_keymap("n", "<M-o>", "<C-u>", opts)

-- Exit insert mode
vim.api.nvim_set_keymap("i", "jk", "<ESC><C-w>w i", opts)
vim.api.nvim_set_keymap("i", "jj", "<ESC>", opts)
vim.api.nvim_set_keymap("i", "jl", "<C-\\><C-n><C-w>w :lua SwapBufferAndResize()<CR>", {
  noremap = true,
})
vim.api.nvim_set_keymap("i", "A-.", "<ESC>", opts)

-- .
function YankEntireDocument()
  -- Save the current cursor position
  local cursor_pos = vim.api.nvim_win_get_cursor(0)

  -- Yank the entire document
  vim.cmd("normal! ggVGy")

  -- Restore the cursor position
  vim.api.nvim_win_set_cursor(0, cursor_pos)
end

vim.api.nvim_set_keymap("n", "ya", "<cmd>lua YankEntireDocument()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>qr", ":%s/\t/  /g<CR>", { noremap = true, silent = true })

-- .

-- Exit terminal mode
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n><C-w>w", {
  noremap = true,
})
vim.api.nvim_set_keymap("t", "jj", "<C-\\><C-n>", {
  noremap = true,
})
vim.api.nvim_set_keymap("t", "jl", "<C-\\><C-n><C-w>w :lua SwapBufferAndResize()<CR>", {
  noremap = true,
})
vim.api.nvim_set_keymap("t", "jz", "<cmd>lua exitTerminalAndZoom()<cr>", {
  noremap = true,
  silent = true,
})

-- Yank
vim.keymap.set("n", "<leader>y", "<Plug>OSCYankOperator", { desc = "yank to system" })
-- vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
vim.keymap.set("v", "<leader>y", "<Plug>OSCYankVisual", { desc = "yank to system" })

M = {}

M.copilot = {
  {
    "<leader>at",
    "<cmd>ToggleRequirementsTag<cr>",
    desc = "Toggle Requirements Tag",
  },
}

M.rust_analyzer = {
  {
    "K",
    "<cmd>RustHoverActions<cr>",
    desc = "Hover Actions (Rust)",
  },
  {
    "<leader>cR",
    "<cmd>RustCodeAction<cr>",
    desc = "Code Action (Rust)",
  },
  {
    "<leader>dr",
    "<cmd>RustDebuggables<cr>",
    desc = "Run Debuggables (Rust)",
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
  { "<leader>G", group = "[G]it diff" },
  { "<leader>G_", hidden = true },
  { "<leader>W", "<cmd> wa <cr>", desc = "write all files" },
  { "<leader>c", group = "[c]ode" },
  { "<leader>c_", hidden = true },
  { "<leader>g", group = "[g]it" },
  { "<leader>g_", hidden = true },
  { "<leader>m", "<cmd>bn<cr>", desc = "buffer next" },
  { "<leader>n", "<cmd>bp<cr>", desc = "buffer previous" },
  { "<leader>s", group = "[s]earch" },
  -- { "<leader>sR", <function 1>, desc = "Replace in files (Spectre)" },
  { "<leader>s_", hidden = true },
  { "<leader>vz", "<cmd>lua zoom()<cr>", desc = "window zoom" },
  { "<leader>w", "<cmd>w<cr>", desc = "write file" },

  { "<leader>p", require("fzf-lua").files, desc = "Fzf Files" },
  { "<leader>P", require("fzf-lua").oldfiles, desc = "Recent Files" },
}

return M
