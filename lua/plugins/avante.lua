return {
  {
    "yetone/avante.nvim",
    enabled = True,
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      --provider = "chatgpt",
      --provider = "ollama",
      vendors = {
        ---@type AvanteProvider
        chatgpt = {
          endpoint = "https://api.openai.com/v1/chat/completions", -- The full endpoint of the provider
          model = "gpt-4o-mini", -- The model name to use with this provider
          api_key_name = "OPENAI_API_KEY", -- The name of the environment variable that contains the API key
          --- This function below will be used to parse in cURL arguments.
          --- It takes in the provider options as the first argument, followed by code_opts retrieved from given buffer.
          --- This code_opts include:
          --- - question: Input from the users
          --- - code_lang: the language of given code buffer
          --- - code_content: content of code buffer
          --- - selected_code_content: (optional) If given code content is selected in visual mode as context.
          ---@type fun(opts: AvanteProvider, code_opts: AvantePromptOptions): AvanteCurlOutput
          parse_curl_args = function(opts, code_opts)
            return {
              url = opts.endpoint,
              headers = {
                ["Accept"] = "application/json",
                ["Content-Type"] = "application/json",
                ["Authorization"] = "Bearer " .. os.getenv(opts.api_key_name),
              },
              body = {
                model = opts.model,
                messages = { -- you can make your own message, but this is very advanced
                  { role = "system", content = code_opts.system_prompt },
                  { role = "user", content = require("avante.providers.openai").get_user_message(code_opts) },
                },
                temperature = 0,
                max_tokens = 8192,
                stream = true, -- this will be set by default.
              },
            }
          end,
          --- This function will be used to parse incoming SSE stream
          --- It takes in the data stream as the first argument, followed by SSE event state, and opts
          --- retrieved from given buffer.
          --- This opts include:
          --- - on_chunk: (fun(chunk: string): any) this is invoked on parsing correct delta chunk
          --- - on_complete: (fun(err: string|nil): any) this is invoked on either complete call or error chunk
          ---@type fun(data_stream: string, event_state: string, opts: ResponseParser): nil
          parse_response_data = function(data_stream, event_state, opts)
            require("avante.providers").openai.parse_response(data_stream, event_state, opts)
          end,
          --- The following function SHOULD only be used when providers doesn't follow SSE spec [ADVANCED]
          --- this is mutually exclusive with parse_response_data
          ---@type fun(data: string, handler_opts: AvanteHandlerOptions): nil
          --parse_stream_data = function(data, handler_opts) end,
        },
        ---@type AvanteProvider
        ollama = {
          ["local"] = true,
          endpoint = "http://192.168.50.108:11434/v1",
          model = "codegemma",
          parse_curl_args = function(opts, code_opts)
            return {
              url = opts.endpoint .. "/chat/completions",
              headers = {
                ["Accept"] = "application/json",
                ["Content-Type"] = "application/json",
              },
              body = {
                model = opts.model,
                messages = require("avante.providers").copilot.parse_message(code_opts), -- you can make your own message, but this is very advanced
                max_tokens = 2048,
                stream = true,
              },
            }
          end,
          parse_response_data = function(data_stream, event_state, opts)
            require("avante.providers").openai.parse_response(data_stream, event_state, opts)
          end,
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      -- "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}
