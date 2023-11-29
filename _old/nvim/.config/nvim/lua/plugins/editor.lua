return {
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({
        height = 15, -- height of the trouble list when position is top or bottom
      })
    end,
    keys = {
      { "<leader>xx", "", desc = "" },
      { "<leader>xX", "", desc = "" },
      { "<leader>xL", "", desc = "" },
      { "<leader>xQ", "", desc = "" },

      { "<leader>tt", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "document diagnostics (trouble)" },
      { "<leader>tT", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "workspace disagnostics (trouble)" },
      { "<leader>tL", "<cmd>TroubleToggle loclist<cr>", desc = "location list (trouble)" },
      { "<leader>tQ", "<cmd>TroubleToggle quickfix<cr>", desc = "quickfix list (trouble)" },

      { "gr", "<cmd>TroubleToggle lsp_references<cr>", desc = "go to referennce (trouble)" },
      { "gi", "<cmd>TroubleToggle lsp_implementations<cr>", desc = "go to reference (trouble)" },
      { "gs", "<cmd>TroubleToggle lsp_definitions<cr>", desc = "go to definitions (trouble)" },
      { "gt", "<cmd>TroubleToggle lsp_type_definitions<cr>", desc = "go to type (trouble)" },
    },
  },

  { "shaunsingh/oxocarbon.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },

  {
    "tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        style = "moon",
        sidebars = {
          "qf",
          "vista_kind",
          "terminal",
          "spectre_panel",
          "startuptime",
          "Outline",
        },
        on_colors = function(c) end,
        on_highlights = function(hl, c)
          hl.CursorLineNr = { fg = c.orange, bold = true }
          hl.LineNr = { fg = c.orange, bold = true }
          hl.LineNrAbove = { fg = c.fg_gutter }
          hl.LineNrBelow = { fg = c.fg_gutter }
          local prompt = "#2d3149"
          hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
          hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopePromptNormal = { bg = prompt }
          hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
          hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        end,
      }
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gbt", "<cmd> GitBlameToggle <CR>", desc = "git-blame toggle" },
      { "<leader>gbs", "<cmd> GitBlameCopySHA <CR>", desc = "git-blame copy sha" },
      { "<leader>gbc", "<cmd> GitBlameCopyCommitURL <CR>", desc = "git-blame copy file url" },
      { "<leader>gbf", "<cmd> GitBlameCopyFileURL <CR>", desc = "git-blame copy file url" },
    },
  },
}

-- {
--   "NvChad/nvterm",
--   -- init = function()
--   --   require("util.mappings").load "nvterm"
--   -- end,
--   config = function(_, opts)
--     require("base46.term")
--     require("nvterm").setup(opts)
--   end,
--   keys = {
--
--     ["<A-i>"] = {
--       function()
--         require("nvterm.terminal").toggle("float")
--       end,
--       desc = "toggle floating term",
--       mode = { "n", "t" },
--     },
--
--     ["<A-h>"] = {
--       function()
--         require("nvterm.terminal").toggle("horizontal")
--       end,
--       desc = "toggle horizontal term",
--       mode = { "n", "t" },
--     },
--
--     ["<A-v>"] = {
--       function()
--         require("nvterm.terminal").toggle("vertical")
--       end,
--       desc = "toggle vertical term",
--       mode = { "n", "t" },
--     },
--
--     -- new
--     ["<leader>i"] = {
--       function()
--         require("nvterm.terminal").new("float")
--       end,
--       desc = "new horizontal term",
--     },
--
--     ["<leader>h"] = {
--       function()
--         require("nvterm.terminal").new("horizontal")
--       end,
--       desc = "new horizontal term",
--     },
--
--     ["<leader>v"] = {
--       function()
--         require("nvterm.terminal").new("vertical")
--       end,
--       desc = "new vertical term",
--     },
--   },
-- },
