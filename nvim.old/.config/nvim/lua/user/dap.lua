vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='👉', texthl='', linehl='', numhl=''})

local dap = require('dap')
local dap_install = require("dap-install")
local dap_ui = require("dapui")
local dap_vtext = require("nvim-dap-virtual-text")

dap.defaults.fallback.terminal_win_cmd = '10split new'

-- Dap Ui
dap_ui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dap_ui.open()
  dap.repl.close()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dap_ui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dap_ui.close()
end

-- Dap Virtual text
dap_vtext.setup()

-- Node
dap_install.config("jsnode", {})
dap.configurations.javascript = {
  {
    type = 'node2',
    request = 'launch',
    program = '${workspaceFolder}/simple.js',

    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal'
  }
}

dap.configurations.typescript = {
  {
    name = 'Run',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
    outFiles = {"${workspaceFolder}/dist/**/*.js"},
  },

  -- {
  --   name = 'Attach to process',
  --   type = 'node2',
  --   request = 'attach',
  --   processId = require'dap.utils'.pick_process,
  -- },
}

dap_install.config("dnetcs", {})

dap.configurations.cs = {
  {
    type = "netcoredbg",
    name = "launch - netcoredbg",
    request = "launch",
    program = '${workspaceFolder}/bin/Debug/net6.0/api.news.dll',
    cwd = vim.fn.getcwd(),
    processId = function()
      local pgrep = vim.fn.system("pgrep -f 'dotnet bin/Debug/net6.0/api.news.dll'")
      return tonumber(pgrep)
    end,
    targetArchitecture = "x86_64"

    -- preLaunchTask = function()
    --   Term = vim.fn.termopen("dotnet bin/Debug/net6.0/api.news.ddl")
    -- end
  },
}



-- dap.configurations.cs = {
--   {
--     type = "netcoredbg",
--     name = "launch - netcoredbg",
--     request = "attach",
--     processId = function()
--       local pgrep = vim.fn.system("pgrep -f 'dotnet bin/Debug/net6.0/api.news.dll'")
--       return tonumber(pgrep)
--     end,
--     -- preLaunchTask = function()
--     --   Term = vim.fn.termopen("dotnet bin/Debug/net6.0/api.news.ddl")
--     -- end
--   },
-- }

-- dap.configurations.cs = {
--   {
--     type = "netcoredbg",
--     name = "launch - netcoredbg",
--     request = "launch",
--     program = function()
--         return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
--     end,
--   },
-- }

-- -- Chrome
-- dap.adapters.chrome = {
--   type = "executable",
--   command = "node",
--   args = {os.getenv("HOME") .. "/.config/nvim/debuggers/chrome/chromeDebug.js"} -- TODO adjust
-- }

-- dap.configurations.javascript = { -- change this to javascript if needed
--   {
--     type = "chrome",
--     request = "attach",
--     program = "${file}",
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = "inspector",
--     port = 9222,
--     webRoot = "${workspaceFolder}"
--   }
-- }

-- dap.configurations.typescript = { -- change to typescript if needed
--   {
--     type = "chrome",
--     request = "attach",
--     program = "${file}",
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = "inspector",
--     port = 9222,
--     webRoot = "${workspaceFolder}"
--   }
-- }

-- -- Lua
-- dap.configurations.lua = {
--   {
--     type = 'nlua',
--     request = 'attach',

--     name = "Attach to running Neovim instance",
--     host = function()

--       local value = vim.fn.input('Host [127.0.0.1]: ')
--       if value ~= "" then
--         return value
--       end
--       return '127.0.0.1'
--     end,
--     port = function()
--       local val = tonumber(vim.fn.input('Port: '))
--       assert(val, "Please provide a port number")
--       return val
--     end,
--   }
-- }

-- dap.adapters.nlua = function(callback, config)
--   callback({ type = 'server', host = config.host, port = config.port })
-- end
