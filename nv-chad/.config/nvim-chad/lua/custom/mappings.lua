
local M = {}

M.Navigation = {
 n = {
   ["<A-j>"] = { ":<C-U>TmuxNavigateLeft<cr>", "focus left" },
   ["<A-k>"] = { ":<C-U>TmuxNavigateDown<cr>", "focus down" },
   ["<A-l>"] = { ":<C-U>TmuxNavigateUp<cr>", "focus up" },
   ["<A-;>"] = { ":<C-U><cmd> TmuxNavigateRigth<cr>", "focus right" },
   ["<leader>,"] = { "<cmd> bn <cr>", "next buffer"},
   ["<leader>n"] = { "<cmd> bp <cr>", "previous buffer"},

   --["f"] = {
   --  function()
   --    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
   --  end, "find forwards"
   -- },

   -- ["F"] = {
   --  function()
   --  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
   -- end, "find forwards"
   --}
 }
}


M.FileOps = {
  n = {
    ["<leader>w"] = { "<cmd> w <cr>", "write file" },
    ["<leader>W"] = { "<cmd> wa <cr>", "write all files" },
    ["<leader>x"] = { "<cmd> wqa <cr>", "write & quit" },
    ["<leader>X"] = { "<cmd> qa! <cr>", "force quit" },
    ["<leader>q"] = { "<cmd> bd <cr>", "close file" },
  }
}

M.Find = {
  n = {
    ["<leader>p"] = { "<cmd> Telescope git_files <cr>", "find files p" },
    ["P"] = { "<cmd>HopPasteChar1<cr>", "paste at position" },
    ["<leader>y"] = { "<cmd>HopYankChar1<cr>", "yank between positions" },
  }
}

M.Git = {
  n = {
    ["<leader>ga"] = { "<cmd> Git add -A <cr>", "git add all" },
    ["<leader>gc"] = { "<cmd> Git commit<cr>", "git commit" },
    ["<leader>gp"] = { "<cmd> Git push<cr>", "git commit" },
    ["<leader>gC"] = { "<cmd> Telescope git_commits<cr>", "git show commits" },
		["<leader>gs"] = { "<cmd> Telescope git_status<cr>", "git show status" },
		["<leader>gS"] = { "<cmd> Telescope git_stash<cr>", "git show stashes" },
		["<leader>gb"] = { "<cmd> Telescope git_branches<cr>", "git show branches" },
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
