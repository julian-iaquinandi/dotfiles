local dap = require("dap")

dap.adapters["pwa-node"] = {
  type = "server",
  host = "127.0.0.1",
  port = 8123,
  executable = {
    command = "js-debug-adapter",
  }
}

for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
    },
  }
end

-- c#
dap.adapters.coreclr = {
	type = "executable",
	command = "/usr/bin/netcoredbg",
	args = { "--interpreter=vscode" },
}

dap.adapters.netcoredbg = {
	type = "executable",
	command = "/usr/bin/netcoredbg",
	args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/src/", "file")
		end,
	},
}
