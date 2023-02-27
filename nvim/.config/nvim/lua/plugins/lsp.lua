return {
	-- neodev
	-- {
	--   "folke/neodev.nvim",
	--   -- event = "VeryLazy",
	--   opts = {
	--     debug = true,
	--     experimental = {
	--       pathStrict = true,
	--     },
	--     -- library = {
	--     --   runtime = "~/projects/neovim/runtime/",
	--     -- },
	--   },
	-- },

	-- tools
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"jay-babu/mason-null-ls.nvim",
		},
		event = "VeryLazy",
		config = function()
			local mason = require("mason")
			mason.setup({})

			local masonlsp = require("mason-lspconfig")
			masonlsp.setup({
				ensure_installed = {
					"tsserver",
					"unocss",
				},
			})

			local masonNullLs = require("mason-null-ls")
			masonNullLs.setup({
				ensure_installed = {
					"prettierd",
					"eslint_d",
					"flake8",
					"markdownlint",
					"luacheck",
					"stylua",
					"black",
				},
			})

			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({})
			lspconfig.svelte.setup({})
			lspconfig.unocss.setup({})
			-- lspconfig.emmetls.setup({})
			lspconfig.eslint.setup({
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})

			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = false,
				})
		end,
	},

	-- null-ls
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		config = function()
			local nls = require("null-ls")
			nls.setup({
				debounce = 150,
				save_after_format = false,
				sources = {
					nls.builtins.formatting.prettierd,
					nls.builtins.formatting.prettierd.with({
						filetypes = { "html", "json", "svelte", "markdown", "css", "javascript", "javascriptreact" },
					}),
					nls.builtins.formatting.stylua,
					-- nls.builtins.formatting.fish_indent,
					-- nls.builtins.formatting.fixjson.with({ filetypes = { "jsonc" } }),
					nls.builtins.formatting.eslint_d,
					-- nls.builtins.diagnostics.shellcheck,
					-- nls.builtins.formatting.shfmt,
					nls.builtins.diagnostics.markdownlint,
					-- nls.builtins.diagnostics.luacheck,
					-- nls.builtins.formatting.prettierd.with({
					-- filetypes = { "markdown", "svelte" }, -- only runs `deno fmt` for markdown
					-- }),
					-- nls.builtins.diagnostics.selene.with({
					--   condition = function(utils)
					--     return utils.root_has_file({ "selene.toml" })
					--   end,
					-- }),
					nls.builtins.code_actions.gitsigns,
					-- nls.builtins.formatting.isort,
					nls.builtins.formatting.black,
					nls.builtins.diagnostics.flake8,
				},
				root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
			})
		end,
	},
}
