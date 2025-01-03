-- local cmp = require "cmp"

return {
	-- rust
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		opts = function()
			return require("custom.configs.rust-tools")
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},

	{
		"saecki/crates.nvim",
		ft = { "toml" },
		config = function(_, opts)
			local crates = require("crates")
			crates.setup(opts)
			require("cmp").setup.buffer({
				sources = { { name = "crates" } },
			})
			crates.show()
			require("core.utils").load_mappings("crates")
		end,
	},

	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},

	-- svelte
	{
		"leafOfTree/vim-svelte-plugin",
		ft = "svelte",
		config = function()
			vim.g.vim_svelte_plugin_use_typescript = 1
		end,
	},

	-- typescript
	-- {
	-- 	"pmizio/typescript-tools.nvim",
	-- 	event = "BufRead",
	-- 	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	-- 	opts = {},
	-- 	config = function()
	-- 		require("typescript-tools").setup({
	-- 			on_attach = function(client, bufnr)
	-- 				client.server_capabilities.semanticTokensProvider = nil -- this line do the trick
	-- 				-- ... rest of your on_attach function
	-- 			end,
	-- 		})
	-- 	end,
	-- },

	{
		"jose-elias-alvarez/typescript.nvim",
		event = "BufRead",
		ft = { "typescript", "typescriptreact", "typescript.tsx" },
		config = function()
			require("typescript").setup({
				server = {
					on_attach = function(client, bufnr)
						client.resolved_capabilities.document_formatting = false
						client.server_capabilities.semanticTokensProvider = nil -- this line do the trick
					end,
				},
			})
		end,
	},

	{
		"OlegGulevskyy/better-ts-errors.nvim",
		event = "BufRead",
		dependencies = { "MunifTanjim/nui.nvim" },
		config = {
			keymaps = {
				toggle = "<leader>dd", -- default '<leader>dd'
				go_to_definition = "<leader>dx", -- default '<leader>dx'
			},
		},
	},
}
