
vim.api.nvim_set_keymap('n', 'to', ':tabo<CR>', { noremap = true })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})

-- Movement keys
vim.api.nvim_set_keymap("n", "j", "h", {noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "j", {noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "l", "k", {noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ";", "l", {noremap = true, silent = true })

-- hop 

vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'h', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('n', 'H', "<cmd>lua require'hop'.hint_char2({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})


local wkMappings = { 
  a = {
    name = "Comments",
    a = { ":Commentary<cr>", "Comment" }
  },

  b = { 
    name = "Buffers",
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
  },

  e = {
    name = "Errors | Coc",
    n = { ":call CocAction('diagnosticNext')<cr>", "Next error" },
    p = { ":call CocAction('diagnosticPrevious')<cr>", "Previous error" },
    m = { ":CocList marketplace<cr>", "Coc Marketplace" },
    ['.'] = { ":CocCommand actions.open<cr>", "Code Action" },
    l = { ":CocCommand eslint.executeAutofix<CR>", "Auto fix" },
    r = { ":call <Plug>(coc-rename)<cr>", "Rename symbol" },
    f = { ":CocCommand prettier.formatFile<CR>", "Format file" },
    g = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", "Git Worktree" },
    g = { "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", "Git Worktree" },
  },

  f = {
    name = "Find",
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
  },

  g = {
    name = "Git",
    f = { ":gitdiff //2", "Take left" },
    j = { ":gitdiff //3", "Take right" },
    c = { ":Git commit<cr>", "Git commit" },
    a = { ":Git add -A<cr>", "Git add all" },
    s = { ":Git status<cr>", "Git status" },
    p = { ":Git push<cr>", "Git push" },
    i = { ":G<cr>", "Interactive status"},
    l = { ":Git log<cr>", "Git log"},
  },

  t = {
    name = "terminal",
    c = { ":sp<CR> :term<CR> :resize 20N<CR> i", "Create" },
    t = { ":ToggleTermToggleAll <cr>", "Toggle all " },
    j = { ":ToggleTerm size=15 direction=horizontal <cr>", "Open first" },
    k = { ":2ToggleTerm size=15 direction=horizontal <cr>", "Open second" },
    u = { ":TermExec cmd='npm start' <cr>", "Npm start first" },
    i = { ":2TermExec cmd='npm start' <cr>", "Npm start second" },
  },

  p = { ":Telescope find_files<cr>", "Files" },

  j = { "<C-w>h <cr>", "Focus left" },
  k = { "<C-w>j <cr>", "Focus down" },
  l = { "<C-w>k <cr>", "Focus up" },
  [';'] = { "<C-w>l <cr>", "Focus right" },

  w = { ":w<cr>", "Write buffer" },
  q = { ":bd<cr>", "Close buffer" },
  Q = { ":bd!<cr>", "Force Close buffer" },
  x = { ":q<cr>", "Quit buffer" },
  
  n = { ":Lexplore<CR> :vertical resize 30<CR>", "Navigation" },
  m = { "<C-^><cr>", "Files" },
  z = { ":Startify<cr>", "Startify" }
}

local wkOpts =  { prefix = "<leader>" }
local wk = require("which-key")

wk.register(wkMappings, wkOpts)


