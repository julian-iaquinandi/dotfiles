local M = {}

M.Navigation = {
 n = {
   ["<A-j>"] = { ":<C-U>TmuxNavigateLeft<cr>", "Focus left" },
   ["<A-k>"] = { ":<C-U>TmuxNavigateDown<cr>", "Focus down" },
   ["<A-l>"] = { ":<C-U>TmuxNavigateUp<cr>", "Focus up" },
   ["<A-;>"] = { ":<C-U><cmd> TmuxNavigateRigth<cr>", "Focus right" },
 }
}

M.FileOps = {
  n = {
    ["<leader>w"] = { "<cmd> w <cr>", "FileOps - Write file" },
    ["<leader>W"] = { "<cmd> wa <cr>", "FileOps - Write all files" },
    ["<leader>x"] = { "<cmd> wqa <cr>", "FileOps - Write & quit" },
    ["<leader>X"] = { "<cmd> qa! <cr>", "FileOps - Quit!" },
    ["<leader>q"] = { "<cmd> bd <cr>", "FileOps - Close file" },
  }
}

M.Find = {
  n = {
    ["<leader>p"] = { "<cmd> Telescope find_files <cr>", "Find files p" },
  }
}


M.Git = {
  n = {
    ["<leader>gc"] = { "<cmd> Telescope git_commits<cr>", "find git commits" },
		["<leader>gs"] = { "<cmd> Telescope git_status<cr>", "find git status" },
		["<leader>gS"] = { "<cmd> Telescope git_stash<cr>", "find git stash" },
		["<leader>gb"] = { "<cmd> Telescope git_branches<cr>", "find git branches" },
		["<leader>gg"] = { "<cmd> LazyGit<cr>", "Lazy Git" },
  }
}

M.Lazy = {
  -- plugin = true,
  n = {
    ["<leader>lz"] = { "<cmd> Lazy <cr>", "Lazy" },
    ["<leader>lg"] = { "<cmd> LazyGit <cr>", "LazyGit" },
  }
}

M.Dap = {
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

M.Crates = {
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
