return {
  {
    dir = "~/.config/nvim/lua/local_plugins/chat_manager",
    dependencies = {
      "CopilotC-Nvim/CopilotChat.nvim",
      "ibhagwan/fzf-lua",
    },
    config = function()
      local chat_manager = require("local_plugins.chat_manager")

      vim.api.nvim_create_user_command("ChatLoad", function(opts)
        chat_manager.load(opts.args)
      end, { nargs = "?" })

      vim.api.nvim_create_user_command("ChatSave", function(opts)
        chat_manager.save(opts.args)
      end, { nargs = 1 })

      vim.api.nvim_create_user_command("ChatDelete", function(opts)
        chat_manager.delete(opts.args)
      end, { nargs = 1 })
    end,
  },
}
