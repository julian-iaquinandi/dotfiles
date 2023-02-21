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
	b = { ":e #<cr>", "Last" },
	h = { "<C-w>s", "Split below" },
	v = { "<C-w>v", "Split right" },
  m = { ":tabedit % <cr>", "Maximize" },
	n = { ":bn <cr>", "buffer next" },
	p = { ":bp <cr>", "buffer previous" },
	k = { ":resize -10<cr>", "Resize down" },
	l = { ":resize +10<cr>", "Resize up" },
	j = { ":vertical resize -10<cr>", "Resize up" },
	[";"] = { ":vertical resize +5<cr>", "Resize up" },
}

local debug = {
	name = " 🐛 Debug",
	d = { ":call vimspector#Launch()<cr>", "Launch" },
	r = { ":call vimspector#Reset()<cr>", "Reset" },
	c = { ":call vimspector#Continue()<cr>", "Continue" },
	f = { ":call vimspector#ToggleBreakpoint()<cr>", "Breakpoint" },
	k = { ":call <Plug>VimspectorStepInto<cr>", "Step Into" },
	l = { ":call <Plug>VimspectorStepOut<cr>", "Step Out" },
	[";"] = { ":call <Plug>VimspectorStepOver<cr>", "Step Over" },
}

local find = {
	name = " 🔎 Find",
	f = { ":Telescope find_files<cr>", "Files" },
	d = { ":Telescope git_files<cr>", "Git Files" },
	a = { ":Telescope live_grep<cr>", "In Files" },
	s = { ":Telescope buffers<cr>", "Buffers" },
	h = { ":Telescope help_tags<cr>", "Help Tags" },
	e = { ":Telescope emoji<cr>", "Emoji" },
	m = { ":Telescope media_files<cr>", "Media" },
	n = { ":Telescope noice<cr>", "Nofify History" },
	g = { ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "Git worktree" },
	r = { ":%s/", "Replace" },
	v = { ":Telescope neoclip default<cr>", "Clipboard" },
}

local git = {
	name = " ➕ Git",
	a = { ":Git add -A<cr>", "Git add all" },
	c = { ":Git commit<cr>", "Git commit" },
	f = { ":gitdiff //2", "Take left" },
	g = { ":gitdiff //3", "Take right" },
	i = { ":G<cr>", "Interactive status" },
	p = { ":Git push<cr>", "Git push" },
	s = { ":Git status<cr>", "Git status" },
	l = { ":Git log<cr>", "Git log" },
	h = { ":Gitsigns preview_hunk<cr>", "Next hunk" },
	[";"] = { ":Gitsigns next_hunk<cr>", "Next hunk" },
	j = { ":Gitsigns prev_hunk<cr>", "Next hunk" },
}

local jest = {
	name = " 🃏 Jest",
	j = { ":lua require'jester'.run()<cr>", "Run Closest" },
	f = { ":lua require'jester'.run_file()<cr>", "Run File" },
	l = { ":lua require'jester'.run_last()<cr>", "Run Last" },
	J = { ":lua require'jester'.debug()<cr>", "Debug closest" },
	F = { ":lua require'jester'.debug_file()<cr>", "Debug file" },
	L = { ":lua require'jester'.debug_last()<cr>", "Debug last" },
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
local writeBuffer = { ":w<cr>;", "Write buffer" }
local closeBuffer = { ":bd<cr>", "Close buffer" }
local forceCloseBuffer = { ":bd!<cr>", "Force Close buffer" }
local quitBuffer = { ":q<cr>", "Quit buffer" }
local navigationTree = { ":NvimTreeToggle<cr>", "Navigation" }
-- local navigationTreeFind = { ":NvimTreeFindFile<cr>", "Navigation" }
local navigationTelescope = { ":Telescope file_browser path=%:p:h<cr>", "Navigation" }
local lastBuffer = { "<C-^><cr>", "Files" }
-- local symbolOutline = { ":SymbolsOutline<cr>", "Symbol Outline" }

local wkMappings = {}

wkMappings["a"] = actions
wkMappings["b"] = buffers
wkMappings["d"] = debug
wkMappings["f"] = find
wkMappings["g"] = git
wkMappings["j"] = jest
wkMappings["n"] = navigationTelescope
wkMappings["m"] = lastBuffer
-- wkMappings["o"] = symbolOutline
wkMappings["p"] = openTelescopeFiles
wkMappings["q"] = closeBuffer
wkMappings["Q"] = forceCloseBuffer
wkMappings["t"] = trouble
wkMappings["w"] = writeBuffer
wkMappings["x"] = quitBuffer
wkMappings[","] = navigationTree

-- local wk = require("which-key")

-- wk.register(wkMappings, {
-- 	prefix = " ",
-- })


return {
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300

      local wk = require("which-key")

      wk.setup({})
      wk.register(wkMappings, {
        prefix = " ",
      })
    end,
  }
}
