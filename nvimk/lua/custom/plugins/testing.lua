return {
  {
    'nvim-neotest/neotest',
    optional = true,
    dependencies = {
      'rouge8/neotest-rust',
      'nvim-neotest/neotest-python',
    },
    opts = {
      adapters = {
        ['neotest-rust'] = {},
        ['neotest-python'] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },
}
