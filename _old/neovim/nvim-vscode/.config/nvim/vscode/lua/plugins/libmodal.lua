local modes = require 'config.modes'

return { 
    {
        'Iron-E/nvim-libmodal',
        lazy = true, -- don't load until necessary
        event = "VeryLazy",
        config = function() -- load the plugin
            local libmodal = require 'libmodal'

            -- Register custom modes/layers
            modes.navigation(libmodal)

        end
    } 
}
