return {
  {
    "David-Kunz/gen.nvim",
    cmd = { "Gen" },
    config = function()
      local gen = require("gen")
      gen.setup({
        model = "zephyr", -- The default model to use.
        display_mode = "float", -- The display mode. Can be "float" or "split".
        show_prompt = false, -- Shows the Prompt submitted to Ollama.
        show_model = false, -- Displays which model you are using at the beginning of your chat session.
        no_auto_close = false, -- Never closes the window automatically.
        init = function(options)
          pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
        end,
        -- Function to initialize Ollama
        -- command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
        command = [[powershell -Command "Invoke-RestMethod -Method Post -Uri http://localhost:11434/api/generate -ContentType 'application/json' -Body '{\""prompt\"": \""Hello, world!\"", \""model\"": \""zephyr\""}'"]],
        -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
        -- This can also be a lua function returning a command string, with options as the input parameter.
        -- The executed command must return a JSON object with { response, context }
        -- (context property is optional).
        debug = false,
      })
    end,
  },
}
