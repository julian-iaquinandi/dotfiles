return {
  -- {
  --   "folke/noice.nvim",
  --   dependencies = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"},
  --   lazy = false,
    
  --   config = function()
  --     local noice = require("noice")
      
  --     noice.setup({
  --       presets = {
  --         -- you can enable a preset by setting it to true, or a table that will override the preset config
  --         -- you can also add custom presets that you can enable/disable with enabled=true
  --         bottom_search = false, -- use a classic bottom cmdline for search
  --         command_palette = false, -- position the cmdline and popupmenu together
  --         long_message_to_split = true, -- long messages will be sent to a split
  --         inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --       }
  --     })
  
  --   end
  -- }
}



-- local M = {
--   "folke/noice.nvim",
--   event = "VeryLazy",
-- }

-- function M.config()
--   local focused = true
--   vim.api.nvim_create_autocmd("FocusGained", {
--     callback = function()
--       focused = true
--     end,
--   })
--   vim.api.nvim_create_autocmd("FocusLost", {
--     callback = function()
--       focused = false
--     end,
--   })
--   require("noice").setup({
--     debug = false,
--     lsp = {
--       override = {
--         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--         ["vim.lsp.util.stylize_markdown"] = true,
--         ["cmp.entry.get_documentation"] = true,
--       },
--     },
--     routes = {
--       {
--         filter = {
--           cond = function()
--             return not focused
--           end,
--         },
--         view = "notify_send",
--         opts = { stop = false },
--       },
--       {
--         filter = {
--           event = "msg_show",
--           find = "%d+L, %d+B",
--         },
--         view = "mini",
--       },
--     },
--     presets = {
--       bottom_search = true,
--       command_palette = true,
--       long_message_to_split = true,
--       inc_rename = true,
--       cmdline_output_to_split = false,
--     },
--     commands = {
--       all = {
--         -- options for the message history that you get with `:Noice`
--         view = "split",
--         opts = { enter = true, format = "details" },
--         filter = {},
--       },
--     },
--     format = {
--       level = {
--         icons = false,
--       },
--     },
--   })

--   vim.api.nvim_create_autocmd("FileType", {
--     pattern = "markdown",
--     callback = function(event)
--       vim.schedule(function()
--         require("noice.text.markdown").keys(event.buf)
--       end)
--     end,
--   })
-- end

-- return M