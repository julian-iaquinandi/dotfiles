local noremapSilent = { noremap = true, silent = true }
-- Escape normal mode + terminal swapping
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = false })
vim.api.nvim_set_keymap('t', 'jk', '<C-\\><C-n>', { noremap = false })

-- Remap hjkl to jkl;
vim.api.nvim_set_keymap("n", "j", "h", noremapSilent)
vim.api.nvim_set_keymap("n", "k", "j", noremapSilent)
vim.api.nvim_set_keymap("n", "l", "k", noremapSilent)
vim.api.nvim_set_keymap("n", ";", "l", noremapSilent)

-- Nvim Tmux movement keys
vim.g.tmux_navigator_save_on_switch = 1
vim.api.nvim_set_keymap("n", "<M-j>", ":TmuxNavigateLeft<cr>", noremapSilent)
vim.api.nvim_set_keymap("n", "<M-k>", ":TmuxNavigateDown<cr>", noremapSilent)
vim.api.nvim_set_keymap("n", "<M-l>", ":TmuxNavigateUp<cr>", noremapSilent)
vim.api.nvim_set_keymap("n", "<M-;>", ":TmuxNavigateRight<cr>", noremapSilent)

-- lsp
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", noremapSilent)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", noremapSilent)
vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", noremapSilent)
vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", noremapSilent)
vim.api.nvim_set_keymap("n", "gr", "<cmd>Trouble lsp_references<cr>", noremapSilent)
-- vim.api.nvim_set_keymap("n", "gl", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = 'rounded' })<CR>", noremapSilent)
vim.api.nvim_set_keymap("n", "g;", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded' })<CR>", noremapSilent)
vim.api.nvim_set_keymap("n", "gj", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded' })<CR>", noremapSilent)
vim.api.nvim_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", noremapSilent)
vim.api.nvim_set_keymap("n", "gl", "<cmd>lua vim.lsp.buf.hover()<CR>", noremapSilent)
vim.api.nvim_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", noremapSilent)
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

-- Snippets
vim.api.nvim_set_keymap("n", "<C-J>", "<Plug>(vsnip-expand)", noremapSilent)

-- Copy
vim.api.nvim_set_keymap("v", "c", "<Plug>OscYank<cr>", {noremap = true})
-- vim.api.nvim_set_keymap("n", "gy", ":normal y :normal v :normal gv ", noremapSilent)

-- Which Key
local actions = {
  name = " 🚀 Actions",
  a = { ":TSLspImportAll<CR>", "Import All" },
  d = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Diagnostic List" },
  f = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open float" },
  m = { ":LspInstallInfo<CR>", "Organise imports" },
  o = { ":TSLspOrganize<CR>", "Organise imports" },
  r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol" },
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
  d = { ":call vimspector#Launch()<cr>", "Launch"},
  r = { ":call vimspector#Reset()<cr>", "Reset"},
  c = { ":call vimspector#Continue()<cr>", "Continue"},
  f = { ":call vimspector#ToggleBreakpoint()<cr>", "Breakpoint"},
  k = { ":call <Plug>VimspectorStepInto<cr>", "Step Into"},
  l = { ":call <Plug>VimspectorStepOut<cr>", "Step Out"},
  [';'] = { ":call <Plug>VimspectorStepOver<cr>", "Step Over"},
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
  r = { ":%s/", "Replace" },
  v = { ":Telescope neoclip default<cr>", "Clipboard"}
}

local git = {
  name = " ➕ Git",
  a = { ":Git add -A<cr>", "Git add all" },
  c = { ":Git commit<cr>", "Git commit" },
  f = { ":gitdiff //2", "Take left" },
  g = { ":gitdiff //3", "Take right" },
  i = { ":G<cr>", "Interactive status"},
  p = { ":Git push<cr>", "Git push" },
  s = { ":Git status<cr>", "Git status" },
  l = { ":Git log<cr>", "Git log"},
  h = { ":Gitsigns preview_hunk<cr>", "Next hunk"},
  [";"] = { ":Gitsigns next_hunk<cr>", "Next hunk"},
  j = { ":Gitsigns prev_hunk<cr>", "Next hunk"},
}

local jest = {
  name = " 🃏 Jest",
  j = { ":lua require'jester'.run()<cr>", "Run Closest"},
  f = { ":lua require'jester'.run_file()<cr>", "Run File"},
  l = { ":lua require'jester'.run_last()<cr>", "Run Last"},
  J = { ":lua require'jester'.debug()<cr>", "Debug closest"},
  F =  { ":lua require'jester'.debug_file()<cr>", "Debug file"},
  L = { ":lua require'jester'.debug_last()<cr>", "Debug last"},
}

local trouble = {
  name = "⚠️  Trouble",
  t = { "<cmd>Trouble<cr>", "Trouble Toggle" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace diagnostics" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Document diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "Quickfix list" },
  l = { "<cmd>Trouble loclist<cr>", "Loc list" },
}

local openTelescopeFiles = { ":Telescope git_files<cr>", "Files(Git)" }
local writeBufferAndFormat = { ":w<cr>; lua vim.lsp.buf.formatting()<cr>", "Write buffer" }
local closeBuffer = { ":bd<cr>", "Close buffer" }
local forceCloseBuffer = { ":bd!<cr>", "Force Close buffer" }
local quitBuffer = { ":q<cr>", "Quit buffer" }
local navigationTree = { ":NvimTreeToggle<cr>", "Navigation" }
local navigationTreeFind = { ":NvimTreeFindFile<cr>", "Navigation" }
local lastBuffer = { "<C-^><cr>", "Files" }
-- local symbolOutline = { ":SymbolsOutline<cr>", "Symbol Outline" }

local wkMappings = {}

wkMappings["a"] = actions
wkMappings["b"] = buffers
wkMappings["d"] = debug
wkMappings["f"] = find
wkMappings["g"] = git
wkMappings["j"] = jest
wkMappings["n"] = navigationTreeFind
wkMappings["m"] = lastBuffer
-- wkMappings["o"] = symbolOutline
wkMappings["p"] = openTelescopeFiles
wkMappings["q"] = closeBuffer
wkMappings["Q"] = forceCloseBuffer
wkMappings["t"] = trouble
wkMappings["w"] = writeBufferAndFormat
wkMappings["x"] = quitBuffer
wkMappings[","] = navigationTree

local wk = require("which-key")

wk.register(wkMappings, {
  prefix = "<leader>"
})


-- local debug = {
--   name = " 🐛 Debug",
--   a = { ":lua require'debugHelper'.attach()<CR>", "Attach"},
--   q = { ":lua require'debugHelper'.attachToRemote()<CR>", "Attach remote"},

--   s = { ":lua require'dap'.close()<CR>", "Stop" },
--   d = { ":lua require'dap'.continue()<CR>", "Continue"},
--   f = { ":lua require'telescope'.extensions.dap.frames{}<cr>", "Telescoe frames" },

--   r = { ":lua require'dap'.disconnect();require'dap'.stop();require'dap'.run_last()<CR>", "Restart" },
--   t = { ":lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l", "Repl" },

--   k = { ":lua require'dap'.step_into()<CR>", "Step Into" },
--   l = { ":lua require'dap'.step_out()<CR>", "Step Out"},
--   [";"] = { ":lua require'dap'.step_over()<CR>", "Step Over" },

--   u = { ":lua require'dapui'.toggle() <cr>", "Toggle UI" },
--   i = { ":lua require'dap'.down()<CR>", "Down" },
--   o = { ":lua require'dap'.up()<CR>", "Up" },

--   h = { ":lua require'dap.ui.widgets'.hover()<CR>", "Hover" },
--     -- vnoremap <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
--   g = { ":lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>", "Scopes"},

--   b = {
--     b = { ":lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint"},
--     c = { ":lua require'dap'.set_exception_breakpoints({'all'})<CR>", "Conditional Breakpoint"}
--   },

-- }

