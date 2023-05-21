return {
  -- better increase/descrease
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
        },
      })
    end,
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
