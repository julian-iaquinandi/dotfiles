vim.g.profile_loaders = true

require("config.autocmds")
require("config.editor")

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