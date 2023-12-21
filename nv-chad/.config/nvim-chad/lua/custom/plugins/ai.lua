return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = {
					auto_trigger = true,
					keymap = {
						accept = "<C-l>",
					},
				},
			})
		end,
	},

	-- {
	-- 	"gsuuon/model.nvim",
	--
	-- 	-- Don't need these if lazy = false
	-- 	cmd = { "M", "Model", "Mchat" },
	-- 	init = function()
	-- 		vim.filetype.add({
	-- 			extension = {
	-- 				mchat = "mchat",
	-- 			},
	-- 		})
	-- 	end,
	-- 	ft = "mchat",
	--
	-- 	keys = {
	-- 		{ "<C-m>d", ":Mdelete<cr>", mode = "n" },
	-- 		{ "<C-m>s", ":Mselect<cr>", mode = "n" },
	-- 		{ "<C-m><space>", ":Mchat<cr>", mode = "n" },
	-- 	},
	--
	-- 	config = function()
	-- 		require("model").setup({
	-- 			-- Define the provider and the model
	-- 			provider = "openai_chatgpt",
	-- 			models = {
	-- 				openai_chatgpt = {
	-- 					-- Set the API key (ensure it's set as an environment variable)
	-- 					api_key = vim.fn.getenv("OPENAI_API_KEY"),
	-- 					-- Define the model endpoint
	-- 					model = "gpt-4-1106-preview",
	-- 				},
	-- 			},
	-- 			-- Additional configurations can be added here
	-- 		})
	-- 	end,
	-- },

	-- {
	-- 	"github/copilot.vim",
	-- 	event = "VeryLazy",
	-- 	-- config = function()
	-- 	--   local copilot = require("copilot")
	-- 	--   copilot.setup(require("custom.configs.copilot"))
	-- 	-- end
	-- },

	-- {
	--   "David-Kunz/gen.nvim",
	--   event = "VeryLazy",
	--   opts = {
	--     model = "codellama:13b", -- The default model to use.
	--     display_mode = "float", -- The display mode. Can be "float" or "split".
	--     show_prompt = false, -- Shows the Prompt submitted to Ollama.
	--     show_model = false, -- Displays which model you are using at the beginning of your chat session.
	--     no_auto_close = false, -- Never closes the window automatically.
	--     init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
	--     -- Function to initialize Ollama
	--     command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
	--     -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
	--     -- This can also be a lua function returning a command string, with options as the input parameter.
	--     -- The executed command must return a JSON object with { response, context }
	--     -- (context property is optional).
	--     list_models = '<omitted lua function>', -- Retrieves a list of model names
	--     debug = false -- Prints errors and the command which is run.
	--   }
	-- },
	--
	--
	-- {
	--   'jpmcb/nvim-llama',
	--   event = "VeryLazy",
	--   config = function()
	--     require('nvim-llama').setup {
	--       debug = false,
	--       model = codellama
	--     }
	--   end
	-- },

	-- {
	--   "dreamsofcode-io/ChatGPT.nvim",
	--   event = "VeryLazy",
	--   dependencies = {
	--     "MunifTanjim/nui.nvim",
	--     "nvim-lua/plenary.nvim",
	--     "nvim-telescope/telescope.nvim"
	--   },
	--   config = function()
	--     require("chatgpt").setup({
	--       async_api_key_cmd = "pass show api/openai",
	--     })
	--   end,
	-- },
}
