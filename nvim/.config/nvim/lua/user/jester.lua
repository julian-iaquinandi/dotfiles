
local jester = require("jester")

jester.setup = {
  cmd = "jest -t '$result' -- $file", -- run command
  identifiers = {"test", "it"}, -- used to identify tests
  prepend = {"describe"}, -- prepend describe blocks
  expressions = {"call_expression"}, -- tree-sitter object used to scan for tests/describe blocks
  path_to_jest = 'jest', -- './node_modules/bin/jest' for debugging
  terminal_cmd = ":vsplit | terminal", -- used to spawn a terminal for running tests, for debugging refer to nvim-dap's config
  dap = { -- debug adapter configuration
    type = 'node2',
    request = 'launch',
    cwd = vim.fn.getcwd(),
    runtimeArgs = {'--inspect-brk', '$path_to_jest', '--no-coverage', '-t', '$result', '--', '$file'},
    args = { "--no-cache" },
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'},
    console = 'integratedTerminal',
    port = 9229,
    disableOptimisticBPs = true
  }
}
