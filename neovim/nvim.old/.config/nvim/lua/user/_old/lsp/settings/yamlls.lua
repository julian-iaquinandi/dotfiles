local schemas = require('schemastore').json.schemas()

local opts = {
  settings = {
    yaml = {
      schemas = schemas
    }
  }
}

return opts
