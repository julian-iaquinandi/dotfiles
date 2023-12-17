local M = {}

M.general = {
  n = {
    ["<leader>w"] = { "<cmd> w <cr>", "FileOps - Write file" },
    ["<leader>W"] = { "<cmd> wa <cr>", "FileOps - Write all files" },
    ["<leader>x"] = { "<cmd> wqa <cr>", "FileOps - Write & quit" },
    ["<leader>X"] = { "<cmd> qa! <cr>", "FileOps - Quit!" },
    ["<leader>q"] = { "<cmd> bd <cr>", "FileOps - Close file" },

    ["<leader>p"] = { "<cmd> Telescope find_files <cr>", "Find files p" },
  }
}

M.Git = {
  n = {
    ["<leader>c"] = { "<cmd> Telescope git_commits<cr>", "find git commits" },
		["<leader>s"] = { "<cmd> Telescope git_status<cr>", "find git status" },
		["<leader>S"] = { "<cmd> Telescope git_stash<cr>", "find git stash" },
		["<leader>b"] = { "<cmd> Telescope git_branches<cr>", "find git branches" },
		["<leader>g"] = { "<cmd> LazyGit<cr>", "Lazy Git" },
  }
}

M.lazy = {
  plugin = true,
  n = {
    ["<leader>lz"] = { "<cmd> Lazy <cr>", "Lazy" },
    ["<leader>lg"] = { "<cmd> LazyGit <cr>", "LazyGit" },
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue the debugger"
    },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

return M
