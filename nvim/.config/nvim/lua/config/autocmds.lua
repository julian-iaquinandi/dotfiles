-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("ts_imports", { clear = true }),
  pattern = { "*.tsx,*.ts,*.svlete" },
  callback = function()
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.removeUnused.ts" },
        diagnostics = {},
      },
    })
  end,
})

-- Auto close

-- Close Neo-tree when CopilotChat opens
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "copilot-*",
  callback = function()
    -- Close Neo-tree with a small delay to avoid window ID issues
    vim.defer_fn(function()
      vim.cmd("Neotree close")
    end, 50) -- Delay by 50ms
  end,
})

-- Close CopilotChat when Neo-tree opens
-- table.insert(require("neo-tree").config.event_handlers, {
--   event = "neo_tree_window_after_open",
--   handler = function(args)
--     -- Only act if Neo-tree is opened on the right-hand side
--     -- if args.position == "right" then
--     -- Explicitly close CopilotChat
--     vim.cmd("CopilotChatClose") -- Replace this with the exact command for closing CopilotChat
--     -- end
--   end,
-- })
--

-- Softwrapping set via editorconfig

local function set_wrap_width()
  -- Retrieve the max_line_length from editorconfig
  local max_length = vim.bo.textwidth

  if max_length and max_length > 0 then
    vim.cmd("Wrapwidth " .. max_length)
  else
    vim.cmd("Wrapwidth 80")
  end

  vim.wo.colorcolumn = tostring(max_length + 1) -- Highlight max_line_length
  vim.wo.wrap = true
  vim.wo.linebreak = true -- Avoid breaking mid-word
  vim.opt.breakindent = true -- Indent wrapped lines
  vim.opt.showbreak = "⤷ " -- Add visual indicator for wrapped lines
end

-- Create an autocommand to set wrap width when entering a buffer
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = set_wrap_width,
})

-- stop window from being opened in neotree pane
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = "*",
--   callback = function()
--     -- Check if the current window is the NeoTree window
--     if vim.bo.filetype == "neo-tree" then
--       print("neotree")
--       -- Open a vertical split to the left
--       -- vim.cmd("wincmd h") -- Move to the left
--       -- vim.cmd("vsplit")   -- Create a vertical split
--     end
--   end,
-- })

-- Code actions
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   group = vim.api.nvim_create_augroup("ts_imports", { clear = true }),
--   pattern = { "*.tsx,*.ts,*.svelte" },
--   callback = function()
--     vim.lsp.buf.code_action({
--       apply = true,
--       context = {
--         only = { "source.removeUnused.ts" },
--         diagnostics = {},
--       },
--     })
--   end,
-- })

-- Requirements nvim chat with context tracking
-- local requirementsLoaded = false

-- function LoadRequirementsContext()
--   if not requirementsLoaded then
--     local req_file = vim.fn.getcwd() .. "/requirements.md"
--     if vim.fn.filereadable(req_file) == 1 then
--       local req_content = vim.fn.readfile(req_file)
--
--       vim.fn.CopilotChatPrepend(table.concat(req_content, "\n"))
--
--       vim.cmd("CopilotChatOpen")
--
--       -- require('CopilotChat').
--
--       requirementsLoaded = true -- Mark as loaded
--     else
--       print("No requirements.md file found!")
--     end
--   else
--     print("Requirements context already loaded!")
--   end
-- end
