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

-- vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
--   noremap = true,
-- })

-- Remap movement keys
vim.api.nvim_set_keymap("n", "j", "h", opts)
vim.api.nvim_set_keymap("n", "k", "j", opts)
vim.api.nvim_set_keymap("n", "l", "k", opts)
vim.api.nvim_set_keymap("n", ";", "l", opts)

--
vim.api.nvim_set_keymap("n", "<leader>q", ":SmartQ<CR>", { desc = "close file", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>Q", ":SmartQ<CR>", { desc = "close file force", noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sp", ":Gen<CR>", { desc = "[S]earch [P]rompts", noremap = true, silent = true })

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

M.general = {}

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
--

M.telescope = { { "<leader>p", "<cmd>Telescope find_files <cr>", "Find files " } }

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

-- ui

M.bufferline = {
  {
    "<leader>bp",
    "<Cmd>BufferLineTogglePin<CR>",
    desc = "Toggle pin",
  },
  {
    "<leader>bP",
    "<Cmd>BufferLineGroupClose ungrouped<CR>",
    desc = "Delete non-pinned buffers",
  },
  {
    "<leader>bo",
    "<Cmd>BufferLineCloseOthers<CR>",
    desc = "Delete other buffers",
  },
  {
    "<leader>br",
    "<Cmd>BufferLineCloseRight<CR>",
    desc = "Delete buffers to the right",
  },
  {
    "<leader>bl",
    "<Cmd>BufferLineCloseLeft<CR>",
    desc = "Delete buffers to the left",
  },
  {
    "<S-h>",
    "<cmd>BufferLineCyclePrev<cr>",
    desc = "Prev buffer",
  },
  {
    "<S-l>",
    "<cmd>BufferLineCycleNext<cr>",
    desc = "Next buffer",
  },
  {
    "[b",
    "<cmd>BufferLineCyclePrev<cr>",
    desc = "Prev buffer",
  },
  {
    "]b",
    "<cmd>BufferLineCycleNext<cr>",
    desc = "Next buffer",
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

M.notify = {
  {
    "<leader>z",
    function()
      require("notify").dismiss({
        silent = true,
        pending = true,
      })
    end,
    desc = "Dismiss all Notifications",
  },
}

-- M.vim_illuninate = { {
--   "]]",
--   desc = "Next Reference",
-- }, {
--   "[[",
--   desc = "Prev Reference",
-- } }

M.outline = { {
  "<leader>o",
  "<cmd>Outline<CR>",
  desc = "Toggle outline",
} }

M.search = function(builtin)
  return {
    { "<leader>sh", builtin.help_tags, {
      desc = "[S]earch [H]elp",
    } },
    { "<leader>sk", builtin.keymaps, {
      desc = "[S]earch [K]eymaps",
    } },
    { "<leader>sf", builtin.find_files, {
      desc = "[S]earch [F]iles",
    } },
    { "<leader>sb", ":Telescope file_browser<CR>", {
      desc = "[S]earch Files [B]rowser",
    } },
    {
      "<leader>sv",
      ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      {
        desc = "[S]earch Files [B]rowser",
      },
    },
    { "<leader>st", builtin.builtin, {
      desc = "[S]earch [S]elect Telescope",
    } },
    { "<leader>sw", builtin.grep_string, {
      desc = "[S]earch current [W]ord",
    } },
    { "<leader>sg", builtin.live_grep, {
      desc = "[S]earch by [G]rep",
    } },
    { "<leader>sd", builtin.diagnostics, {
      desc = "[S]earch [D]iagnostics",
    } },
    { "<leader>sr", builtin.resume, {
      desc = "[S]earch [R]esume",
    } },
    { "<leader>s.", builtin.oldfiles, {
      desc = '[S]earch Recent Files ("." for repeat)',
    } },
    { "<leader>sp", ":Gen<cr>", {
      desc = "[S]earch [P]rompts",
    } },
    {
      "<leader><leader>",
      ":lua require('telescope.builtin').buffers({ sort_lastused = true, ignore_current_buffer = true })<cr>",
      {
        desc = "[ ] Find existing buffers",
      },
    },
  }
end

M.which_key = {
  ["<leader>c"] = {
    name = "[c]ode",
    _ = "which_key_ignore",
  },
  ["<leader>s"] = {
    name = "[s]earch",
    _ = "which_key_ignore",
  },
  ["<leader>g"] = {
    name = "[g]it",
    _ = "which_key_ignore",
  },
  ["<leader>G"] = {
    name = "[G]it diff",
    _ = "which_key_ignore",
  },

  -- general
  ["<leader>w"] = { "<cmd>w<cr>", "write file" },
  ["<leader>W"] = { "<cmd> wa <cr>", "write all files" },

  ["<leader>m"] = { "<cmd>bn<cr>", "buffer next" },
  ["<leader>n"] = { "<cmd>bp<cr>", "buffer previous" },

  -- ["<leader>q"] = M.smartq["<leader>q"],
  -- ["<leader>Q"] = M.smartq["<leader>Q"],
  --
  -- ["<leader>th"] = M.terminal["<leader>th"],
  -- ["<leader>tv"] = M.terminal["<leader>tv"],

  ["<leader>sR"] = M.spectre["<leader>sR"],

  -- ["<leader>vs"] = { buffers.swap_buffer_and_resize, "swap window" },
  -- ["<leader>vv"] = { "<cmd>lua layout0()<cr>", "window layout 1" },
  ["<leader>vz"] = { "<cmd>lua zoom()<cr>", "window zoom" },

  -- ["<leader>Gd"] = M.diffview["Gd"],
  -- ["<leader>GF"] = M.diffview["GF"],
  -- ["<leader>Gf"] = M.diffview["Gf"],
  -- ["<leader>Gq"] = M.diffview["Gq"],
  -- ["<leader>Gg"] = M.diffview["Gg"],
  -- { '<leader>gs', windows.show_command_output 'git status', desc = '[G]it Status' },
}

-- override

return M

-- M.terminal = {
--   {
--     "<leader>th",
--     "<cmd>ToggleTerm direction=horizontal size=15<cr>",
--     desc = "terminal horizontal",
--   },
--   {
--     "<leader>tv",
--     "<cmd>ToggleTerm direction=vertical size=15<cr>",
--     desc = "terminal vertical",
--   },
-- }
-- pickers
-- ['<leader>P'] = {pickers.invoke_command_pallete, '[P]icker command [p]allete'},
-- ['<leader>l'] = {pickers.invoke_layout_picker, '[P]icker command [p]allete'},
-- ['<leader>ai'] = { '<cmd>Gen<cr>', 'Gen AI' },
-- ['<leader>al'] = { pickers.invoke_picker(require 'pickers.layouts'), 'Layout selector' },
-- ['<leader>ao'] = { pickers.invoke_picker 'ollama', 'ollama' },
-- ["<leader>ac"] = { pickers.invoke_picker("code-actions"), "code actions" },
-- ["<leader>ap"] = { pickers.invoke_command_pallete, "command pallete" },
-- ["<leader>vs"] = { "<cmd>lua WswapAndCycleWindow()<cr>", "swap window" },

-- window/panes
-- ['<leader>vs'] = {buffers.swap_buffer_and_resize, 'swap window'},
-- ['<leader>vv'] = { '<cmd>lua layout0()<cr>', 'window layout 1' },
-- ['<leader>vz'] = {'<cmd>lua zoom()<cr>', 'window zoom'}

-- code

-- M.treesitter_context = {
--   {
--     "<leader>ut",
--     function()
--       local Util = require("lazyvim.util")
--       local tsc = require("treesitter-context")
--       tsc.toggle()
--       if Util.inject.get_upvalue(tsc.toggle, "enabled") then
--         Util.info("Enabled Treesitter Context", {
--           title = "Option",
--         })
--       else
--         Util.warn("Disabled Treesitter Context", {
--           title = "Option",
--         })
--       end
--     end,
--     desc = "Toggle Treesitter Context",
--   },
-- }
