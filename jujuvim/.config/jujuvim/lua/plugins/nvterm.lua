return {
  {
    "NvChad/nvterm",
    -- init = function()
    --   require("util.mappings").load "nvterm"
    -- end,
    config = function(_, opts)
      require("base46.term")
      require("nvterm").setup(opts)
    end,
    keys = {

      ["<A-i>"] = {
        function()
          require("nvterm.terminal").toggle("float")
        end,
        desc = "toggle floating term",
        mode = { "n", "t" },
      },

      ["<A-h>"] = {
        function()
          require("nvterm.terminal").toggle("horizontal")
        end,
        desc = "toggle horizontal term",
        mode = { "n", "t" },
      },

      ["<A-v>"] = {
        function()
          require("nvterm.terminal").toggle("vertical")
        end,
        desc = "toggle vertical term",
        mode = { "n", "t" },
      },

      -- new
      ["<leader>i"] = {
        function()
          require("nvterm.terminal").new("float")
        end,
        desc = "new horizontal term",
      },

      ["<leader>h"] = {
        function()
          require("nvterm.terminal").new("horizontal")
        end,
        desc = "new horizontal term",
      },

      ["<leader>v"] = {
        function()
          require("nvterm.terminal").new("vertical")
        end,
        desc = "new vertical term",
      },
    },
  },
}
