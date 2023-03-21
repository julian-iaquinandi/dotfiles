require('config.keymaps')
require('config.options')

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
