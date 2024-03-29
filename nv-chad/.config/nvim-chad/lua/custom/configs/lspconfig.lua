local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("TS_add_missing_imports", { clear = true }),
	desc = "TS_add_missing_imports",
	pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
	callback = function()
		vim.cmd([[TSToolsAddMissingImports]])
		vim.cmd("write")
	end,
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "python" },
})

lspconfig.marksman.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "markdown", "md", "mdx" },
})

lspconfig["svelte"].setup({
	filetypes = { "svelte", "typescriptreact", "javascriptreact", "html" },
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)

		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.js", "*.ts" },
			callback = function(ctx)
				if client.name == "svelte" then
					client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
				end
			end,
		})
	end,
})

lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- local util = require "lspconfig/util"

-- local function organize_imports()
-- 	local params = {
-- 		command = "_typescript.organizeImports",
-- 		arguments = { vim.api.nvim_buf_get_name(0) },
-- 	}
-- 	vim.lsp.buf.execute_command(params)
-- end

-- function ADD_MISSING_IMPORTS()
-- 	vim.lsp.buf.code_action({
-- 		apply = true,
-- 		context = { only = { "source.addMissingImports.ts" } },
-- 	})
-- end
--
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = vim.api.nvim_create_augroup("ts_on_save", { clear = true }),
-- 	desc = "Organize and manage imports on TS file save",
-- 	pattern = { "*.ts", "*.tsx" },
-- 	callback = function()
-- 		-- ORGANIZE_IMPORTS()
-- 		ADD_MISSING_IMPORTS()
-- 		-- vim.defer_fn(function()
-- 		-- 	ORGANIZE_IMPORTS()
-- 		-- end, 100) -- 100 ms delay
-- 	end,
-- })
--
-- lspconfig.tsserver.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
-- 	init_options = {
-- 		preferences = {
-- 			disableSuggeestions = true,
-- 		},
-- 	},
-- 	commands = {
-- 		-- OrganizeImports = {
-- 		-- 	organize_imports,
-- 		-- 	description = "Organize Imports",
-- 		-- },
-- 	},
-- })

-- lspconfig.omnisharp.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = { "dotnet", "/home/kd/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
--   -- Enables support for reading code style, naming convention and analyzer
--   -- settings from .editorconfig.
--   enable_editorconfig_support = true,
--   -- If true, MSBuild project system will only load projects for files that
--   -- were opened in the editor. This setting is useful for big C# codebases
--   -- and allows for faster initialization of code navigation features only
--   -- for projects that are relevant to code that is being edited. With this
--   -- setting enabled OmniSharp may load fewer projects and may thus display
--   -- incomplete reference lists for symbols.
--   enable_ms_build_load_projects_on_demand = false,
--   -- Enables support for roslyn analyzers, code fixes and rulesets.
--   enable_roslyn_analyzers = false,
--   -- Specifies whether 'using' directives should be grouped and sorted during
--   -- document formatting.
--   organize_imports_on_format = true,
--   -- Enables support for showing unimported types and unimported extension
--   -- methods in completion lists. When committed, the appropriate using
--   -- directive will be added at the top of the current file. This option can
--   -- have a negative impact on initial completion responsiveness,
--   -- particularly for the first few completion sessions after opening a
--   -- solution.
--   enable_import_completion = true,
--   -- Specifies whether to include preview versions of the .NET SDK when
--   -- determining which version to use for project loading.
--   sdk_include_prereleases = true,
--   -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
--   -- true
--   analyze_open_documents_only = false,
-- })
