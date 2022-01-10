-- Escape normal mode + terminal swapping
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = false })
vim.api.nvim_set_keymap('t', 'jk', '<C-\\><C-n>', { noremap = false })
vim.api.nvim_set_keymap('i', 'jj', '<Esc> <C-w>j<cr>', { noremap = false })
vim.api.nvim_set_keymap('t', 'jj', '<C-\\><C-n> :sleep 20m <cr> <C-w>k<cr>', { noremap = false })
-- vim.api.nvim_set_keymap('i', 'jm', '<Esc> <C-w>j <C-\\><C-n> :tabedit %<cr>', { noremap = false })

-- Remap hjkl to jkl;
vim.api.nvim_set_keymap("n", "j", "h", {noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "j", {noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "l", "k", {noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ";", "l", {noremap = true, silent = true })

-- Nvim tmux movement keys
vim.g.tmux_navigator_save_on_switch = 1
vim.api.nvim_set_keymap("n", "<M-j>", ":TmuxNavigateLeft<cr>", {noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-k>", ":TmuxNavigateDown<cr>", {noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-l>", ":TmuxNavigateUp<cr>", {noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-;>", ":TmuxNavigateRight<cr>", {noremap = true, silent = true })

-- Coc
vim.api.nvim_set_keymap("n", "ga", "<Plug>(coc-codeaction-selected)", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "gt", "<Plug>(coc-type-definition)", {silent = true})
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", {silent = true})
vim.api.nvim_set_keymap("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})

vim.api.nvim_set_keymap('n', '<M-.>', "<Plug>(coc-codeaction-selected)", {})
vim.api.nvim_set_keymap("i", "<C-Space>", "coc#refresh()", { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<TAB>", "pumvisible() ? '<C-n>' : '<TAB>'", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<S-TAB>", "pumvisible() ? '<C-p>' : '<C-h>'", {noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "pumvisible() ? coc#_select_confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", {silent = true, expr = true, noremap = true})

-- vim.api.nvim_set_keymap("i", "<C-l>", "<Plug>(coc-snippets-expand)", {})
-- vim.api.nvim_set_keymap("v", "<C-j>", "<Plug>(coc-snippets-select)", {})
-- vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>(coc-snippets-expand-jump)", {})

-- hop
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'h', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'H', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})


-- Leader

local actions = {
  name = " 🚀 Actions |",
  a = { "<Plug>(coc-fix-current)", "AutoFix"},
  c = { "<Plug>(coc-codeaction-selected)", "Code action"},
  r = { "<Plug>(coc-rename)", "Rename symbol"},
  j = { ":call CocAction('diagnosticNext')<cr>", "Next error" },
  k = { ":call CocAction('diagnosticPrevious')<cr>", "Previous error" },
  m = { ":CocList marketplace<cr>", "Coc Marketplace" },
  l = { ":CocCommand eslint.executeAutofix<CR>", "Auto fix" },
  f = { ":CocCommand prettier.formatFile<CR>", "Format file" },
  g = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", "Git Worktree" },
  ["."] = { "<Plug>(coc-codeaction-selected)", "Code Actions" }
}

local buffers = {
  name = " 📁 Buffers",
  b = { ":e #<cr>", "Last"},
  h = { "<C-w>s", "Split below" },
  v = { "<C-w>v", "Split right" },
  m = { ":tabedit % <cr>", "Maximize" },
  n = { ":bn <cr>", "buffer next" },
  p = { ":bp <cr>", "buffer previous" },
  k = { ":resize -10<cr>", "Resize down" },
  l = { ":resize +10<cr>", "Resize up" },
  j = { ":vertical resize -10<cr>", "Resize up" },
  [';'] = { ":vertical resize +5<cr>", "Resize up" },
}

local debug = {
  name = " 🐛 Debug",
  q = { "<Plug>Vimspector#Launch()", "Launch Debug" },

  c = { ":call GotoWindow(g:vimspector_session_window.code",  "Debug Code" },
  t = { ":call GotoWindow(g:vimspector_session_window.tagpage",  "Debug Tagpage" },
  v = { ":call GotoWindow(g:vimspector_session_window.variables",  "Debug Variables" },
  w = { ":call GotoWindow(g:vimspector_session_window.watches",  "Debug Watches" },
  s = { ":call GotoWindow(g:vimspector_session_window.stack_trace",  "Debug Stacktrace" },
  o = { ":call GotoWindow(g:vimspector_session_window.output",  "Debug Output" },

  d = { ":call vimspector#Continue()", "Continue"},
  k = { "<Plug>VimspectorStepInto", "Step Into" },
  l = { "<Plug>StepOut", "Step Out"},
  [";"] = { "<Plug>VimspectorStepOver", "Step Over" },
  j = { "<Plug>VimspectorRestart", "Restart" },

  b = {
    b = { "<Plug>VimspectorToggleBreakpoint", "Toggle Breakpoint" },
    c = { "<Plug>VimspectorToggleConditionalBreakpoint", "Toggle Conditional Breakpoint" },
    d = { ":call vimspector#CleanLineVreakpoint()", "Clean line breakpoint" },
  }
}

local find = {
  name = " 🔎 Find",
  f = { ":Telescope find_files<cr>", "Files" },
  d = { ":Telescope git_files<cr>", "Git Files" },
  a = { ":Telescope live_grep<cr>", "In Files" },
  s = { ":Telescope buffers<cr>", "Buffers" },
  h = { ":Telescope help_tags<cr>", "Help Tags" },
  e = { ":Telescope emoji<cr>", "Emoji" },
  m = { ":Telescope media_files<cr>", "Emoji" },
  g = { ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "Git worktree" },
  t = {
    s = {":Telescope tmux sessions<cr>", "Tmux sessions"},
    w = {":Telescope tmux windows<cr>", "Tmux windows"},
    p = {":Telescope tmux pane_contents<cr>", "Tmux pane content"},
  },
  r = { ":%s/", "Replace" },
  v = { ":Telescope neoclip default<cr>", "Clipboard"}
}

local git = {
  name = " ➕ Git",
  f = { ":gitdiff //2", "Take left" },
  j = { ":gitdiff //3", "Take right" },
  c = { ":Git commit<cr>", "Git commit" },
  a = { ":Git add -A<cr>", "Git add all" },
  s = { ":Git status<cr>", "Git status" },
  p = { ":Git push<cr>", "Git push" },
  i = { ":G<cr>", "Interactive status"},
  l = { ":Git log<cr>", "Git log"},
}

local terminal = {
  name = " 💻 terminal",
  c = { ":sp<CR> :term<CR> :resize 20N<CR> i", "Create" },
  t = { ":ToggleTermToggleAll <cr>", "Toggle all " },
  j = { ":ToggleTerm size=15 direction=horizontal <cr>", "Open first" },
  k = { ":2ToggleTerm size=15 direction=horizontal <cr>", "Open second" },
  u = { ":TermExec cmd='npm start' <cr>", "Npm start first" },
  i = { ":2TermExec cmd='npm start' <cr>", "Npm start second" },
}

local wkMappings = {
  p = { ":Telescope find_files<cr>", "Files" },

  w = { ":w<cr>", "Write buffer" },
  q = { ":bd<cr>", "Close buffer" },
  Q = { ":bd!<cr>", "Force Close buffer" },
  x = { ":q<cr>", "Quit buffer" },

  n = { ":NERDTreeFind <CR>", "Navigation" },
  m = { "<C-^><cr>", "Files" },
  z = { ":Startify<cr>", "Startify" }
}

wkMappings["a"] = actions
wkMappings["b"] = buffers
wkMappings["d"] = debug
wkMappings["f"] = find
wkMappings["g"] = git
wkMappings["t"] = terminal

local wkOpts =  { prefix = "<leader>" }
local wk = require("which-key")

wk.register(wkMappings, wkOpts)

