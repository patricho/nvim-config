---@type LazySpec
return {
    {
        "coder/claudecode.nvim",
        dependencies = { "folke/snacks.nvim" },
        config = true,
        opts = {
            terminal = {
                provider = "none", -- No UI actions; server + tools remain available
            },
        },
        keys = {
            { "<leader>a", nil, desc = "AI/Claude Code" },
            -- { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
            -- { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
            -- { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
            -- { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
            -- { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
            { "<leader>aa", "<cmd>ClaudeCodeAdd %<cr>", desc = "Ask Claude about current buffer" },
            { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer to Claude" },
            { "<leader>aa", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Ask Claude about selection" },
            { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
            {
                "<leader>as",
                "<cmd>ClaudeCodeTreeAdd<cr>",
                desc = "Send file to Claude",
                ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
            },
            -- Diff management
            -- { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
            -- { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
        },
    },

    {
        'NickvanDyke/opencode.nvim',
        dependencies = {
            { 'folke/snacks.nvim', opts = { input = { enabled = true } } },
        },
        ---@type opencode.Opts
        opts = {
            -- Your configuration, if any — see lua/opencode/config.lua
        },
        keys = {
            -- TODO: Move to polish.lua
            { '<leader>oa', function() require('opencode').ask() end, desc = 'Ask opencode', },
            { '<leader>aa', function() require('opencode').ask() end, desc = 'Ask opencode', },
            { '<leader>ob', function() require('opencode').ask('@buffer: ') end, desc = 'Ask opencode about buffer', mode = 'n', },
            { '<leader>oB', function() require('opencode').ask('@buffers: ') end, desc = 'Ask opencode about open buffers', mode = 'n', },
            { '<leader>oc', function() require('opencode').ask('@cursor: ') end, desc = 'Ask opencode about this', mode = 'n', },
            { '<leader>oa', function() require('opencode').ask('@selection: ') end, desc = 'Ask opencode about selection', mode = 'v', },
            { '<leader>ae', function() require('opencode').ask('@selection: ') end, desc = 'Ask opencode about selection', mode = 'v', },
            { '<leader>ot', function() require('opencode').toggle() end, desc = 'Toggle embedded opencode', },
            { '<leader>on', function() require('opencode').command('session_new') end, desc = 'New session', },
            { '<leader>oy', function() require('opencode').command('messages_copy') end, desc = 'Copy last message', },
            { '<S-C-u>',    function() require('opencode').command('messages_half_page_up') end, desc = 'Scroll messages up', },
            { '<S-C-d>',    function() require('opencode').command('messages_half_page_down') end, desc = 'Scroll messages down', },
            { '<leader>op', function() require('opencode').select_prompt() end, desc = 'Select prompt', mode = { 'n', 'v', }, },
            -- -- Example: keymap for custom prompt
            -- { '<leader>oe', function() require('opencode').prompt("Explain @cursor and its context") end, desc = "Explain code near cursor", },
        },
        config = function()
        end
    },

    --[[{
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false,
        opts = {
            provider = "claude",
            providers = {
                claude = {
                    endpoint = "https://api.anthropic.com",
                    model = "claude-sonnet-4-20250514",
                    extra_request_body = {
                        temperature = 0,
                        max_tokens = 8192,
                    },
                },
                gemini = {
                    endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
                    model = "gemini-2.5-flash",
                    timeout = 30000,
                    temperature = 0,
                    max_tokens = 8192,
                    api_key_name = "GEMINI_API_KEY"
                },
                ollama = {
                    model = "qwen2.5-coder:latest",
                },
            },
            cursor_applying_provider = "gemini",
            behaviour = {
                enable_cursor_planning_mode = true,
            },
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            -- "echasnovski/mini.pick", -- for file_selector provider mini.pick
            -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
            -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
            -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            -- "zbirenbaum/copilot.lua", -- for providers='copilot'
            -- {
            --     -- support for image pasting
            --     "HakonHarnes/img-clip.nvim",
            --     event = "VeryLazy",
            --     opts = {
            --         -- recommended settings
            --         default = {
            --             embed_image_as_base64 = false,
            --             prompt_for_file_name = false,
            --             drag_and_drop = {
            --                 insert_mode = true,
            --             },
            --             -- required for Windows users
            --             use_absolute_path = true,
            --         },
            --     },
            -- },
            {
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "Avante" }, -- removed "markdown"
                },
                ft = { "Avante" },
            },
        },
    },]]--
}
