vim.g.profile_loaders = true

require("config.autocmds")
require("config.options")

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

require("config.keymaps")