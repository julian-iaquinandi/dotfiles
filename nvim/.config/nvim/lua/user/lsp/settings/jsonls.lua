-- local default_schemas = nil

-- local status_ok, jsonls_settings = pcall(require, "nlspsettings.jsonls")
-- if not status_ok then
  -- default_schemas = jsonls_settings.get_default_schemas()
-- end

local schemas = require('schemastore').json.schemas()

-- local function extend(tab1, tab2)
--   for _, value in ipairs(tab2) do
--     table.insert(tab1, value)
--   end
--   return tab1
-- end

-- local extended_schemas = extend(schemas, default_schemas)

local opts = {
  settings = {
    json = {
      schemas = schemas,
    },
  },
  setup = {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
        end,
      },
    },
  },
}

return opts
