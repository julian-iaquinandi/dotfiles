local jester = require("jester")

jester.setup = {
  cmd = "jest -t '$result' -- $file", -- run command
  identifiers = {"test", "it", "spec"}, -- used to identify tests
  prepend = {"describe"}, -- prepend describe blocks
  expressions = {"call_expression"}, -- tree-sitter object used to scan for tests/describe blocks
  path_to_jest = "/home/kd/.nvm/versions/node/v17.3.1/bin/jest", -- './node_modules/bin/jest' for debugging
  terminal_cmd = ":vsplit | terminal", -- used to spawn a terminal for running tests, for debugging refer to nvim-dap's config
  -- dap = { runtimeArgs = {'yarn', 'run', '--inspect', '--inspect-brk', 'jest', '--no-coverage', '-t', '$result', '--', '$file'}}

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

-- nnoremap <leader>dd :TestNearest -strategy=jest<CR

-- JestStrategy(cmd)
--   let testName = matchlist(a:cmd, '\v -t ''(.*)''')[1]
--   let fileName = matchlist(a:cmd, '\v'' -- (.*)$')[1]
--   call luaeval("require'debugHelper'.debugJest([[" . testName . "]], [[" . fileName . "]])")
-- endfunction      
-- let g:test#custom_strategies = {'jest': function('JestStrategy')}
