return {
    { "folke/neodev.nvim" },
    -- Copy / Paste
    { "ojroques/vim-oscyank", event = "VeryLazy" },

    -- Brackets
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    },

    -- Comments
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        config = function()
            require("Comment").setup()
        end,
    },

    -- Increment
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

    {
        "kensleDev/persistent-macros.nvim",
        event = "VeryLazy",
        config = function()
            require('persistent-macros').setup("C:\\Users\\Administrator\\.config\\macros.json")
        end
    }
}
