require('config.keymaps')
require('config.options')
require('macroHelper')

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
