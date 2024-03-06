-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
--
local pickers = require 'utils.pickers'
local buffers = require 'utils.buffers'

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

------------------------------------------------------------- Global
--
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

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

-- Terminal commands
vim.api.nvim_set_keymap('n', '<leader>gs', ':lua show_command_output("git status")<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gl', ':lua show_command_output("dust")<CR>', opts)

-------------------------------------------------------------- Plugins
--
M = {}

M.which_key = {
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },

  -- general
  ['<leader>w'] = { '<cmd>w<cr>', 'write file' },
  ['<leader>W'] = { '<cmd> wa <cr>', 'write all files' },

  ['<leader>m'] = { '<cmd>bn<cr>', 'buffer next' },
  ['<leader>n'] = { '<cmd>bp<cr>', 'buffer previous' },

  -- pickers
  ['<leader>P'] = { pickers.invoke_command_pallete, '[P]icker command [p]allete' },
  ['<leader>l'] = { pickers.invoke_layout_picker, '[P]icker command [p]allete' },
  -- ['<leader>ai'] = { '<cmd>Gen<cr>', 'Gen AI' },
  -- ['<leader>al'] = { pickers.invoke_picker(require 'pickers.layouts'), 'Layout selector' },
  -- ['<leader>ao'] = { pickers.invoke_picker 'ollama', 'ollama' },
  -- ["<leader>ac"] = { pickers.invoke_picker("code-actions"), "code actions" },
  -- ["<leader>ap"] = { pickers.invoke_command_pallete, "command pallete" },
  -- ["<leader>vs"] = { "<cmd>lua WswapAndCycleWindow()<cr>", "swap window" },

  -- window/panes
  ['<leader>vs'] = { buffers.swap_buffer_and_resize, 'swap window' },
  -- ['<leader>vv'] = { '<cmd>lua layout0()<cr>', 'window layout 1' },
  ['<leader>vz'] = { '<cmd>lua zoom()<cr>', 'window zoom' },
}

-- editor

M.terminal = {
  { '<leader>th', '<cmd>ToggleTerm direction=horizontal size=15<cr>', desc = 'terminal horizontal' },
  { '<leader>tv', '<cmd>ToggleTerm direction=vertical size=15<cr>', desc = 'terminal vertical' },
}

M.persisted = {
  { '<leader>ss', '<cmd> Telescope persisted<CR>', desc = '[S]earch [S]essions' },
}

M.nvim_tree = {
  { '<leader>e', ':NvimTreeFindFileToggle!<cr>', desc = 'Explorer' },
  -- { "<leader>E", "<cmd>NvimTreeFindFile<cr>", desc = "Explorer (find file)" },
  -- { "<leader>e", "<leader>fe", desc = "Explorer", remap = true },
  -- { "<leader>E", "<leader>fE", desc = "Explorer (find file)", remap = true },
}

M.diffview = {
  { '<leader>gd', ':DiffviewOpen<cr>' },
  { '<leader>gF', ':DiffviewFileHistory<cr>' },
  { '<leader>gf', ':DiffviewFileHistory %<cr>' },
  { '<leader>gq', ':DiffviewClose<cr>' },
  { '<leader>gg', ':LazyGit<cr>' },
  -- { '<leader>gs', windows.show_command_output 'git status', desc = '[G]it Status' },
}

M.specture = {
  {
    '<leader>sr',
    function()
      require('spectre').open()
    end,
    desc = 'Replace in files (Spectre)',
  },
}

-- code

M.treesitter_context = {
  {
    '<leader>ut',
    function()
      local Util = require 'lazyvim.util'
      local tsc = require 'treesitter-context'
      tsc.toggle()
      if Util.inject.get_upvalue(tsc.toggle, 'enabled') then
        Util.info('Enabled Treesitter Context', { title = 'Option' })
      else
        Util.warn('Disabled Treesitter Context', { title = 'Option' })
      end
    end,
    desc = 'Toggle Treesitter Context',
  },
}

-- lsp

M.rust_analyzer = {
  { 'K', '<cmd>RustHoverActions<cr>', desc = 'Hover Actions (Rust)' },
  { '<leader>cR', '<cmd>RustCodeAction<cr>', desc = 'Code Action (Rust)' },
  { '<leader>dr', '<cmd>RustDebuggables<cr>', desc = 'Run Debuggables (Rust)' },
}

M.taplo = {
  {
    'K',
    function()
      if vim.fn.expand '%:t' == 'Cargo.toml' and require('crates').popup_available() then
        require('crates').show_popup()
      else
        vim.lsp.buf.hover()
      end
    end,
    desc = 'Show Crate Documentation',
  },
}

M.ruff_lsp = {
  {
    '<leader>co',
    function()
      vim.lsp.buf.code_action {
        apply = true,
        context = {
          only = { 'source.organizeImports' },
          diagnostics = {},
        },
      }
    end,
    desc = 'Organize Imports',
  },
}

-- debug

M.nvim_dap_python = {
  {
    '<leader>dPt',
    function()
      require('dap-python').test_method()
    end,
    desc = 'Debug Method',
    ft = 'python',
  },
  {
    '<leader>dPc',
    function()
      require('dap-python').test_class()
    end,
    desc = 'Debug Class',
    ft = 'python',
  },
}

M.venv_selector = {
  { '<leader>cv', '<cmd>:VenvSelect<cr>', desc = 'Select VirtualEnv' },
}

-- navigation

M.telescope = {
  { '<leader>p', '<cmd>Telescope find_files <cr>', 'Find files ' },
}

M.flash = {
  -- stylua: ignore
  { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  -- stylua: ignore
  { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  -- stylua: ignore
  { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  -- stylua: ignore
  { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  -- stylua: ignore
  { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
}

-- ui

M.trouble = {
  { '<leader>xx', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Document Diagnostics (Trouble)' },
  { '<leader>xX', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Workspace Diagnostics (Trouble)' },
  { '<leader>xL', '<cmd>TroubleToggle loclist<cr>', desc = 'Location List (Trouble)' },
  { '<leader>xQ', '<cmd>TroubleToggle quickfix<cr>', desc = 'Quickfix List (Trouble)' },
  {
    '[q',
    function()
      if require('trouble').is_open() then
        require('trouble').previous { skip_groups = true, jump = true }
      else
        local ok, err = pcall(vim.cmd.cprev)
        if not ok then
          vim.notify(err, vim.log.levels.ERROR)
        end
      end
    end,
    desc = 'Previous trouble/quickfix item',
  },
  {
    ']q',
    function()
      if require('trouble').is_open() then
        require('trouble').next { skip_groups = true, jump = true }
      else
        local ok, err = pcall(vim.cmd.cnext)
        if not ok then
          vim.notify(err, vim.log.levels.ERROR)
        end
      end
    end,
    desc = 'Next trouble/quickfix item',
  },
}
M.bufferline = {
  { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle pin' },
  { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete non-pinned buffers' },
  { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete other buffers' },
  { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete buffers to the right' },
  { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete buffers to the left' },
  { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
  { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
  { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev buffer' },
  { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next buffer' },
}

M.noice = {
  {
    '<S-Enter>',
    function()
      require('noice').redirect(vim.fn.getcmdline())
    end,
    mode = 'c',
    desc = 'Redirect Cmdline',
  },
  {
    '<leader>snl',
    function()
      require('noice').cmd 'last'
    end,
    desc = 'Noice Last Message',
  },
  {
    '<leader>snh',
    function()
      require('noice').cmd 'history'
    end,
    desc = 'Noice History',
  },
  {
    '<leader>sna',
    function()
      require('noice').cmd 'all'
    end,
    desc = 'Noice All',
  },
  {
    '<leader>snd',
    function()
      require('noice').cmd 'dismiss'
    end,
    desc = 'Dismiss All',
  },
  {
    '<c-f>',
    function()
      if not require('noice.lsp').scroll(4) then
        return '<c-f>'
      end
    end,
    silent = true,
    expr = true,
    desc = 'Scroll forward',
    mode = { 'i', 'n', 's' },
  },
  {
    '<c-b>',
    function()
      if not require('noice.lsp').scroll(-4) then
        return '<c-b>'
      end
    end,
    silent = true,
    expr = true,
    desc = 'Scroll backward',
    mode = { 'i', 'n', 's' },
  },
}

M.notify = {
  {
    '<leader>z',
    function()
      require('notify').dismiss { silent = true, pending = true }
    end,
    desc = 'Dismiss all Notifications',
  },
}

M.vim_illuninate = {
  { ']]', desc = 'Next Reference' },
  { '[[', desc = 'Prev Reference' },
}

M.edgy = {
  {
    '<leader>ue',
    function()
      require('edgy').toggle()
    end,
    desc = 'Edgy Toggle',
  },
  -- stylua: ignore
  { "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
}

M.outline = {
  { '<leader>o', '<cmd>Outline<CR>', desc = 'Toggle outline' },
}

return M
