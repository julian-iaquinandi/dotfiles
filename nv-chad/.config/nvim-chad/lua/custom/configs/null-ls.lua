local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
	sources = {
		-- typescript
		null_ls.builtins.diagnostics.eslint.with({
			filetypes = {
				"json",
				"svelte",
				"javascript",
				"typescript",
				"typescriptreact",
				"vue",
			},
		}),
		-- null_ls.builtins.formatting.prettierd,

		null_ls.builtins.formatting.prettier.with({
			extra_filetypes = { "svelte" },
			filetypes = {
				"html",
				"json",
				"svelte",
				"markdown",
				"css",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
			},
		}), -- js/ts formatter

		-- lua
		null_ls.builtins.formatting.stylua,

		-- python
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.ruff,

		-- csharp
		null_ls.builtins.formatting.csharpier,

		-- null_ls.builtins.lint.shellcheck,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
}

return opts
