local null_ls_status_ok, null_ls = pcall(require, "null-ls")

if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
  diagnostics.eslint,
  code_actions.eslint,
  formatting.prettier,
  formatting.stylua,
}

local on_attach = function (client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
  end
end

null_ls.setup({
	debug = false,
	sources = sources,
  on_attach = on_attach
})

