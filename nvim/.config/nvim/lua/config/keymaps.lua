-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.g.neovide_input_macos_option_key_is_meta = true

local opts = {
  noremap = true,
  silent = true,
}

-- local buffers = require("utils.buffers")
--

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

vim.api.nvim_set_keymap("n", "<leader>q", ":SmartQ<CR>", { desc = "close file", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>Q", ":SmartQ<CR>", { desc = "close file force", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sp", ":Gen<CR>", { desc = "[S]earch [P]rompts", noremap = true, silent = true })

vim.keymap.set("n", "<leader>y", "<Plug>OSCYankOperator", { desc = "yank to system" })
-- vim.keymap.set('n', '<leader>cc', '<leader>c_', {remap = true})
vim.keymap.set("v", "<leader>y", "<Plug>OSCYankVisual", { desc = "yank to system" })

vim.api.nvim_set_keymap(
  "n",
  "<leader>th",
  "<cmd>ToggleTerm direction=horizontal size=15<cr>",
  { desc = "terminal horizontal", noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>tv",
  "<cmd>ToggleTerm direction=vertical size=15<cr>",
  { desc = "terminal vertical", noremap = true, silent = true }
)

M = {}

M.smartq = {
  ["<leader>q"] = {
    "<cmd>SmartQ<cr>",
    "close file",
  },
  ["<leader>Q"] = {
    "<cmd>SmartQ!<cr>",
    "close file force",
  },
}

M.spectre = {
  ["<leader>sR"] = {
    function()
      require("spectre").open()
    end,
    "Replace in files (Spectre)",
  },
}

M.diffview = {
  { "<leader>Gd", ":DiffviewOpen<cr>" },
  { "<leader>GF", ":DiffviewFileHistory<cr>" },
  { "<leader>Gf", ":DiffviewFileHistory %<cr>" },
  { "<leader>Gq", ":DiffviewClose<cr>" },
  { "<leader>Gg", ":LazyGit<cr>" }, -- { '<leader>gs', windows.show_command_output 'git status', desc = '[G]it Status' },
}

M.trouble = {
  {
    "<leader>xx",
    "<cmd>TroubleToggle document_diagnostics<cr>",
    desc = "Document Diagnostics (Trouble)",
  },
  {
    "<leader>xX",
    "<cmd>TroubleToggle workspace_diagnostics<cr>",
    desc = "Workspace Diagnostics (Trouble)",
  },
  {
    "<leader>xL",
    "<cmd>TroubleToggle loclist<cr>",
    desc = "Location List (Trouble)",
  },
  {
    "<leader>xQ",
    "<cmd>TroubleToggle quickfix<cr>",
    desc = "Quickfix List (Trouble)",
  },
  {
    "[q",
    function()
      if require("trouble").is_open() then
        require("trouble").previous({
          skip_groups = true,
          jump = true,
        })
      else
        local ok, err = pcall(vim.cmd.cprev)
        if not ok then
          vim.notify(err, vim.log.levels.ERROR)
        end
      end
    end,
    desc = "Previous trouble/quickfix item",
  },
  {
    "]q",
    function()
      if require("trouble").is_open() then
        require("trouble").next({
          skip_groups = true,
          jump = true,
        })
      else
        local ok, err = pcall(vim.cmd.cnext)
        if not ok then
          vim.notify(err, vim.log.levels.ERROR)
        end
      end
    end,
    desc = "Next trouble/quickfix item",
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

M.flash = { -- stylua: ignore
  {
    "s",
    mode = { "n", "x", "o" },
    function()
      require("flash").jump()
    end,
    desc = "Flash",
  }, -- stylua: ignore
  {
    "S",
    mode = { "n", "o", "x" },
    function()
      require("flash").treesitter()
    end,
    desc = "Flash Treesitter",
  }, -- stylua: ignore
  {
    "r",
    mode = "o",
    function()
      require("flash").remote()
    end,
    desc = "Remote Flash",
  }, -- stylua: ignore
  {
    "R",
    mode = { "o", "x" },
    function()
      require("flash").treesitter_search()
    end,
    desc = "Treesitter Search",
  }, -- stylua: ignore
  {
    "<c-s>",
    mode = { "c" },
    function()
      require("flash").toggle()
    end,
    desc = "Toggle Flash Search",
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

-- M.notify = {
--   {
--     "<leader>z",
--     function()
--       require("notify").dismiss({
--         silent = true,
--         pending = true,
--       })
--     end,
--     desc = "Dismiss all Notifications",
--   },
-- }

-- M.outline = { {
--   "<leader>o",
--   "<cmd>Outline<CR>",
--   desc = "Toggle outline",
-- } }

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
