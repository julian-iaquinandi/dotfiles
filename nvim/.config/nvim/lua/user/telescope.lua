local telescope = require("telescope")
local trouble = require("trouble.providers.telescope")
local actions = require("telescope.actions")
require("telescope.builtin").buffers({ sort_lastused = true, ignore_current_buffer = true })

telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules", "dist" },
		mappings = {
			-- i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
			i = { ["<esc>"] = actions.close },
		},
	},
	pickers = {
		find_files = {
			theme = "ivy",
			hidden = "true",
			sort_lastused = true,
			sort_mru = true,
		},
		git_files = {
			theme = "ivy",
			hidden = "true",
			sort_lastused = true,
			sort_mru = true,
		},
		buffers = {
			theme = "ivy",
			sort_lastused = true,
			sort_mru = true,
		},
		-- git_worktree= {
		--   theme = "ivy",
		--   sort_lastused = true,
		--   sort_mru = true
		-- },
	},

	extensions = {
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
		-- fzf = {
		--   fuzzy = true,                    -- false will only do exact matching
		--   override_generic_sorter = true,  -- override the generic sorter
		--   override_file_sorter = true,     -- override the file sorter
		--   case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
		-- }
	},
})

-- telescope.buffers({
--   sort_lastused = true,
-- })

-- telescope.load_extension("git_worktree")
telescope.load_extension("emoji")
telescope.load_extension("media_files")
telescope.load_extension("file_browser")
-- telescope.load_extension("fzf")
-- telescope.load_extension("file_browser")
-- telescope.load_extension('dap')
