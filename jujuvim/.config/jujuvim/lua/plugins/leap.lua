return {
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
    end,
    -- event = "VeryLazy",
    keys = {
      {
        "<leader>lu",
        function()
          require("local.leap-utils").insert_under_line()
        end,
        desc = "Leap to line under target and enter insert",
      },

      {
        "<leader>lo",
        function()
          require("local.leap-utils").insert_over_line()
        end,
        desc = "Leap to line over target and enter insert",
      },

      {
        "<leader>li",
        function()
          require("local.leap-utils").insert_at_line(true)
        end,
        desc = "Leap to line start and enter insert",
      },

      {
        "<leader>la", 
        function()
          require("local.leap-utils").insert_at_line(false)
        end,
        desc = "Leap to line end and enter insert",
      },
    },
  },
}
