-- n, v, i, t = mode names

local M = {}

-- Navigation
-- vim.cmd([[nnoremap <A-j> <C-w>h]])
-- vim.cmd([[nnoremap <A-k> <C-w>j]])
-- vim.cmd([[nnoremap <A-l> <C-w>k]])
-- vim.cmd([[nnoremap <A-;> <C-w>l]])
--
-- vim.cmd([[tnoremap <A-j> <C-\><C-n><C-w>h]])
-- vim.cmd([[tnoremap <A-k> <C-\><C-n><C-w>j]])
-- vim.cmd([[tnoremap <A-l> <C-\><C-n><C-w>k]])
-- vim.cmd([[tnoremap <A-;> <C-\><C-n><C-w>l]])

-- zoom

-- vim.cmd([[tnoremap <A-S-;> <C-\><C-n><C-w>>]])
-- vim.cmd([[inoremap <A-j> <C-w>h]])
-- vim.cmd([[inoremap <A-k> <C-w>j]])
-- vim.cmd([[inoremap <A-l> <C-w>k]])
-- vim.cmd([[inoremap <A-;> <C-w>l]])
--
M.general = {
	i = {
		-- go to  beginning and end
		["<C-b>"] = { "<ESC>^i", "beginning of line" },
		["<C-e>"] = { "<End>", "end of line" },
	},

	n = {
		["<Esc>"] = { ":noh <CR>", "clear highlights" },

		["<C-s>"] = { "<cmd> w <CR>", "save file" },

		["<C-c>"] = { "<cmd> %y+ <CR>", "copy whole file" },

		["<leader>n"] = { "<cmd> set nu! <CR>", "toggle line number" },
		["<leader>rn"] = { "<cmd> set rnu! <CR>", "toggle relative number" },

		-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
		["k"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },
		["l"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', opts = { expr = true } },
		["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', opts = { expr = true } },

		-- new buffer
		["<leader>bn"] = { "<cmd> enew <CR>", "new buffer" },
		["<leader>ch"] = { "<cmd> NvCheatsheet <CR>", "Mapping cheatsheet" },

		["<leader>w"] = { ":w<cr>", "Write File" },
		["<leader>q"] = { ":bd<cr>", "Close File" },
		["<leader>Q"] = { ":bd!<cr>", "Force close File" },
		["<leader>m"] = { ":bn<cr>", "Last buffer" },
		-- ["<leader>x"] = { ":qa<cr>", "Quit Neovim" },
		["<leader>z"] = { "<cmd> notify.dismiss()<CR>", "Dismiss notify" },

		-- Zoom
		["<A-z>"] = {
			function()
				vim.cmd("NeoZoomToggle")
			end,
			"Zoom",
		},

		["<leader>ce"] = {
			function()
				local chatgpt = require("chatgpt")
				chatgpt.edit_with_instructions()
			end,

			"Edit with GPT",
		},

		["<leader>co"] = { "<cmd> ChatGPT <CR>", "GPT Open" },
		["<leader>ci"] = { "<cmd> ChatGPTActAs <CR>", "GPT Act as" },

		["<leader>xx"] = { "<cmd> TroubleToggle<cr>", "Toggle Trouble" },
		["<leader>xw"] = { "<cmd> TroubleToggle workspace_diagnostics<cr>", "Toggle Trouble Workspace" },
		["<leader>xf"] = { "<cmd> TroubleToggle document_diagnostics<cr>", "Toggle Trouble File" },
	},

	t = {
		["<A-z>"] = {
			function()
				vim.cmd([[ ]])
				vim.cmd("NeoZoomToggle")
			end,
			"Zoom",
		},

		["<leader>ce"] = {
			function()
				local chatgpt = require("chatgpt")
				chatgpt.edit_with_instructions()
			end,

			"Edit with GPT",
		},
	},

	v = {
		["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move up", opts = { expr = true } },
		["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move down", opts = { expr = true } },
	},

	x = {
		["k"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "move left", opts = { expr = true } },
		["l"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "move down", opts = { expr = true } },
		-- Don't copy the replaced text after pasting in visual mode
		-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
		["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "dont copy replaced text", opts = { silent = true } },
	},
}

M.tabufline = {
	plugin = true,

	n = {
		-- cycle through buffers
		["<TAB>"] = {
			function()
				require("nvchad_ui.tabufline").tabuflineNext()
			end,
			"goto next buffer",
		},

		["<S-Tab>"] = {
			function()
				require("nvchad_ui.tabufline").tabuflinePrev()
			end,
			"goto prev buffer",
		},

		-- close buffer + hide terminal buffer
		["<leader>x"] = {
			function()
				require("nvchad_ui.tabufline").close_buffer()
			end,
			"close buffer",
		},
	},
}

M.comment = {
	plugin = true,

	-- toggle comment in both modes
	n = {
		["<leader>/"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			"toggle comment",
		},
	},

	v = {
		["<leader>/"] = {
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			"toggle comment",
		},
	},
}

M.lspconfig = {
	plugin = true,

	-- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions

	n = {
		["gD"] = {
			function()
				vim.lsp.buf.declaration()
			end,
			"lsp declaration",
		},

		["gd"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"lsp definition",
		},

		["K"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"lsp hover",
		},

		["gi"] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"lsp implementation",
		},

		["<leader>ls"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"lsp signature_help",
		},

		["<leader>D"] = {
			function()
				vim.lsp.buf.type_definition()
			end,
			"lsp definition type",
		},

		["<leader>ra"] = {
			function()
				require("nvchad_ui.renamer").open()
			end,
			"lsp rename",
		},

		["<leader>ca"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"lsp code_action",
		},

		["gr"] = {
			function()
				vim.lsp.buf.references()
			end,
			"lsp references",
		},

		["<leader>f"] = {
			function()
				vim.diagnostic.open_float({ border = "rounded" })
			end,
			"floating diagnostic",
		},

		["[d"] = {
			function()
				vim.diagnostic.goto_prev()
			end,
			"goto prev",
		},

		["]d"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			"goto_next",
		},

		-- ["<leader>q"] = {
		--   function()
		--     vim.diagnostic.setloclist()
		--   end,
		--   "diagnostic setloclist",
		-- },

		["<leader>fm"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"lsp formatting",
		},

		-- ["<leader>wa"] = {
		--   function()
		--     vim.lsp.buf.add_workspace_folder()
		--   end,
		--   "add workspace folder",
		-- },
		--
		-- ["<leader>wr"] = {
		--   function()
		--     vim.lsp.buf.remove_workspace_folder()
		--   end,
		--   "remove workspace folder",
		-- },
		--
		-- ["<leader>wl"] = {
		--   function()
		--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		--   end,
		--   "list workspace folders",
		-- },
	},
}

M.NeoZoom = {
	plugin = true,

	n = {
		["<C-k>"] = {
			function()
				vim.cmd("NeoZoomToggle")
			end,
			"Zoom",
		},
		{ silent = true, nowait = true },
		-- vim.keymap.set("n", "<CR>", nd, { silent = true, nowait = true })
	},
}

M.nvimtree = {
	plugin = true,

	n = {
		-- toggle
		["<leader>n"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

		-- focus
		["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
	},
}

M.telescope = {
	plugin = true,

	n = {
		-- find
		["<leader>p"] = { "<cmd> Telescope find_files <CR>", "find files" },
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "find files" },
		["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
		["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
		["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
		["<leader>ft"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
		["<leader>fs"] = { "<cmd> Telescope session-lens search_session <CR>", "pick session" },

		-- git
		["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
		["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
		["<leader>gl"] = { "<cmd> LazyGit <CR>", "Lazy Git" },

		-- theme switcher
		["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
	},
}

M.leap = {
	n = {
		["<leader>lu"] = {
			function()
				require("custom.configs.leap").insert_under_line()
			end,
		},

		["<leader>lo"] = {
			function()
				require("custom.configs.leap").insert_over_line()
			end,
		},

		["<leader>li"] = {
			function()
				require("custom.configs.leap").insert_at_line(true)
			end,
		},

		["<leader>la"] = {
			function()
				require("custom.configs.leap").insert_at_line(false)
			end,
		},
	},
}

M.nvterm = {
	plugin = true,

	t = {
		-- toggle in terminal mode
		["<A-i>"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"toggle floating term",
		},

		["<A-h>"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"toggle horizontal term",
		},

		["<A-v>"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"toggle vertical term",
		},
	},

	n = {
		-- toggle in normal mode
		["<A-i>"] = {
			function()
				require("nvterm.terminal").toggle("float")
			end,
			"toggle floating term",
		},

		["<A-h>"] = {
			function()
				require("nvterm.terminal").toggle("horizontal")
			end,
			"toggle horizontal term",
		},

		["<A-v>"] = {
			function()
				require("nvterm.terminal").toggle("vertical")
			end,
			"toggle vertical term",
		},

		-- new
		["<leader>i"] = {
			function()
				require("nvterm.terminal").new("float")
			end,
			"new horizontal term",
		},

		["<leader>h"] = {
			function()
				require("nvterm.terminal").new("horizontal")
			end,
			"new horizontal term",
		},

		["<leader>v"] = {
			function()
				require("nvterm.terminal").new("vertical")
			end,
			"new vertical term",
		},
	},
}

M.whichkey = {
	plugin = true,

	n = {
		["<leader>?w"] = {
			function()
				vim.cmd("WhichKey")
			end,
			"which-key all keymaps",
		},
		["<leader>?q"] = {
			function()
				local input = vim.fn.input("WhichKey: ")
				vim.cmd("WhichKey " .. input)
			end,
			"which-key query lookup",
		},
	},
}

M.blankline = {
	plugin = true,

	n = {
		["<leader>cc"] = {
			function()
				local ok, start = require("indent_blankline.utils").get_current_context(
					vim.g.indent_blankline_context_patterns,
					vim.g.indent_blankline_use_treesitter_scope
				)

				if ok then
					vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
					vim.cmd([[normal! _]])
				end
			end,

			"Jump to current_context",
		},
	},
}

M.gitsigns = {
	plugin = true,

	n = {
		-- Navigation through hunks
		["]c"] = {
			function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					require("gitsigns").next_hunk()
				end)
				return "<Ignore>"
			end,
			"Jump to next hunk",
			opts = { expr = true },
		},

		["[c"] = {
			function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					require("gitsigns").prev_hunk()
				end)
				return "<Ignore>"
			end,
			"Jump to prev hunk",
			opts = { expr = true },
		},

		-- Actions
		["<leader>rh"] = {
			function()
				require("gitsigns").reset_hunk()
			end,
			"Reset hunk",
		},

		["<leader>ph"] = {
			function()
				require("gitsigns").preview_hunk()
			end,
			"Preview hunk",
		},

		["<leader>gb"] = {
			function()
				package.loaded.gitsigns.blame_line()
			end,
			"Blame line",
		},

		["<leader>td"] = {
			function()
				require("gitsigns").toggle_deleted()
			end,
			"Toggle deleted",
		},
	},
}

M.chatGpt = {
	plugin = true,
}

return M
