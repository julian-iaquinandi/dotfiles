local M = {}

M.setup = {
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},

	-- notify = {
	-- 	enabled = false,
	-- },

	-- cmdline = { -- Search on the bottom
	-- 	format = {
	-- 		search_down = {
	-- 			view = "cmdline",
	-- 		},
	-- 		search_up = {
	-- 			view = "cmdline",
	-- 		},
	-- 	},
	-- },
	-- routes = {
	-- 	{ -- show macro recording
	-- 		view = "notify",
	-- 		filter = { event = "msg_showmode" },
	-- 	},
	-- 	{
	-- 		filter = {
	-- 			event = "msg_show",
	-- 			kind = "",
	-- 			find = "written",
	-- 		},
	-- 		opts = { skip = true },
	-- 	},
	-- },
	-- views = { -- Show pallete with search
	-- 	cmdline_popup = {
	-- 		position = {
	-- 			row = 15,
	-- 			col = "50%",
	-- 		},
	-- 		size = {
	-- 			width = 60,
	-- 			height = "auto",
	-- 		},
	-- 	},
	-- 	popupmenu = {
	-- 		relative = "editor",
	-- 		position = {
	-- 			row = 18,
	-- 			col = "50%",
	-- 		},
	-- 		size = {
	-- 			width = 60,
	-- 			height = 10,
	-- 		},
	-- 		border = {
	-- 			style = "rounded",
	-- 			padding = { 0, 1 },
	-- 		},
	-- 		win_options = {
	-- 			winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
	-- 		},
	-- 	},
	-- },
}

return M
