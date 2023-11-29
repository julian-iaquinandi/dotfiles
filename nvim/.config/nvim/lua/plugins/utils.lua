return {
  {
    'nvim-treesitter/nvim-treesitter',
  },
  { 'kkharji/sqlite.lua' },
  { 
    "christoomey/vim-tmux-navigator",
    config = function() 
    end
  },
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")

      local mappings = {
        ["?"] = {
          name = "which",
          q = { "<cmd>WhichKey<cr>", "which-key query lookup" },
          w = { "<cmd>WhichKey<cr>", "which-key all keymaps" },
        },

        a = {
          c = { "<Plug>(coc-codeaction-cursor)", "code action cursor" },
          s = { "<Plug>(coc-codeaction-source)", "code action buffer" },
          a = { "<Plug>(coc-codeaction-selected)", "code action selected" },
          f = { "<Plug>(coc-fix-current)", "fix current" },
          l = { "<Plug>(coc-codeaction-line)", "code lens" },
        },

        b = {
          name = "buffer",
          c = { "<cmd> enew <CR>", "create buffer" },
          d = { "<cmd> bd <CR>", "delete buffer" },
        },

        c = {
          name = "coc",
          a = { "<C-u>CocList diagnostics<cr>", "diagnostics" },
          e = { "<C-u>CocList extensions<cr>", "extensions" },
          c = { "<C-u>CocList commands<cr>", "commands" },
          o = { "<C-u>CocList outline<cr>", "outline" },
          s = { "<C-u>CocList -I symbols<cr>", "symbols" },
          j = { "<C-u>CocNext<cr>", "next" },
          k = { "<C-u>CocPrev<cr>", "prev" },
          p = { "<C-u>CocListResume<cr>", "resume" },
        },

        f = {
          name = "find",
          n = { "<cmd> NvimTreeToggle<cr>", "toggle file explorer" },
          f = { "<cmd> Telescope find_files<cr>", "find files" },
          a = { "<cmd> Telescope live_grep<cr>", "find all" },
          o = { "<cmd> Telescope oldfiles<cr>", "find old files" },
          h = { "<cmd> Telescope help_tags<cr>", "find help pages" },
          c = { "<cmd> Telescope command_history<cr>", "find command history" },
          C = { "<cmd> Telescope commands<cr>", "find commands" },
          k = { "<cmd> Telescope keymaps<cr>", "find key maps" },
        },

        g = {
          name = "git",
          c = { "<cmd> Telescope git_commits<cr>", "find git commits" },
          s = { "<cmd> Telescope git_status<cr>", "find git status" },
          S = { "<cmd> Telescope git_stash<cr>", "find git stash" },
          b = { "<cmd> Telescope git_branches<cr>", "find git branches" },
          g = { "<cmd> LazyGit<cr>", "Lazy Git" },
        },

        l = {
          name = "lazy",
          z = { "<cmd> Lazy<cr>", "Lazy" },
          d = { "<cmd> LazyDocker<cr>", "Lazy Docker" },
          g = { "<cmd> LazyGit<cr>", "Lazy Git" },
        },

        p = { "<cmd> Telescope git_files<cr>", "find git files" },

        -- navigation
        m = { "<cmd> bn <CR>", "next buffer" },
        n = { "<cmd> bp <CR>", "previous buffer" },

        r = {
          name = "refactor",
          r = { "<Plug>(coc-codeaction-refactor)", "refactor" },
          s = { "<Plug>(coc-codeaction-refactor-selected)", "refactor selected" },
          n = { "<Plug>(coc-rename)", "rename" },
        },

        -- file ops
        w = { "<cmd> w <CR>", "write file" },
        W = { "<cmd> wa <CR>", "write all file" },
        q = { "<cmd> bd <CR>", "quit file" },
        Q = { "<cmd> bd! <CR>", "quit file" },
        x = { "<cmd> wqa <CR>", "quit all file" },
        X = { "<cmd> qa! <CR>", "quit all file"}
      }

      wk.register(mappings, { prefix = "<leader>" })
    end
  },

  { "folke/neoconf.nvim", cmd = "Neoconf" },

  "folke/neodev.nvim",
  {
    "gbprod/yanky.nvim",
    enabled = true,
    event = "BufReadPost",
    config = function()
      require("telescope").load_extension("yank_history")
      require("yanky").setup({
        highlight = {
          timer = 150,
        },
        ring = {
          storage = jit.os:find("Windows") and "shada" or "sqlite",
        },
      })

      -- vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
      --
      -- vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
      -- vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      -- vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
      -- vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
      --
      -- vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
      -- vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
      --
      -- vim.keymap.set("n", "]p", "<Plug>(YankyPutIndentAfterLinewise)")
      -- vim.keymap.set("n", "[p", "<Plug>(YankyPutIndentBeforeLinewise)")
      -- vim.keymap.set("n", "]P", "<Plug>(YankyPutIndentAfterLinewise)")
      -- vim.keymap.set("n", "[P", "<Plug>(YankyPutIndentBeforeLinewise)")
      --
      -- vim.keymap.set("n", ">p", "<Plug>(YankyPutIndentAfterShiftRight)")
      -- vim.keymap.set("n", "<p", "<Plug>(YankyPutIndentAfterShiftLeft)")
      -- vim.keymap.set("n", ">P", "<Plug>(YankyPutIndentBeforeShiftRight)")
      -- vim.keymap.set("n", "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)")
      --
      -- vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)")
      -- vim.keymap.set("n", "=P", "<Plug>(YankyPutBeforeFilter)")
      --
      -- vim.keymap.set("n", "<leader>P", function()
      --   require("telescope").extensions.yank_history.yank_history({})
      -- end, { desc = "Paste from Yanky" })
    end,
  },
}
