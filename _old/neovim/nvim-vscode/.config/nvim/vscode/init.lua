require('config.keymaps')
require('config.options')

-- local macros = require('mine.persistent-macros')
-- macros.setup("/Users/juliani/.config/macros.json")

require("config.lazy")({
    defaults = {
        lazy = true,
    },
    performance = {
        cache = {
            enabled = true,
        },
    },
})
