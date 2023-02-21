vim.g.profile_loaders = true

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