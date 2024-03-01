local group = vim.api.nvim_create_augroup("PersistedHooks", {})

vim.api.nvim_create_autocmd({ "User" }, {
  pattern = "PersistedTelescopeLoadPre",
  group = group,
  callback = function(session)
    -- Save the currently loaded session using a global variable
    require("persisted").save({ session = vim.g.persisted_loaded_session })

    -- Delete all of the open buffers
    vim.api.nvim_input("<ESC>:%bd!<CR>")
  end,
})

return {
  -- add better session management
  {
    "olimorris/persisted.nvim",
    config = true,
  },

  {
    "folke/persistence.nvim",
    enabled = false,
  },
}
