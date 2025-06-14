---@type LazySpec
return {
    {
        "lukas-reineke/virt-column.nvim",
        opts = {
            char = "▕" ,
            virtcolumn = "100",
            highlight = "VirtColumn"
        }
    },

    {
        "fnune/recall.nvim",
        config = function()
            require("recall").setup({})
        end
    },

    {
        'stevearc/quicker.nvim',
        event = "FileType qf",
        ---@module "quicker"
        ---@type quicker.SetupOptions
        opts = {
            follow = {
                enabled = true,
            },
        },
    },

    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    },

    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false,
        opts = {
            provider = "claude",
            claude = {
                endpoint = "https://api.anthropic.com",
                model = "claude-3-7-sonnet-20250219",
                temperature = 0,
                max_tokens = 8192,
            },
            gemini = {
                endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
                model = "gemini-2.5-flash-preview-04-17",
                timeout = 30000,
                temperature = 0,
                max_tokens = 8192,
                api_key_name = "GEMINI_API_KEY"
            },
            ollama = {
                model = "qwen2.5-coder:latest",
            },
            cursor_applying_provider = "ollama",
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
    },

    {
        'tzachar/local-highlight.nvim',
        config = function()
            require('local-highlight').setup({
                -- file_types = {'python', 'cpp'}, -- If this is given only attach to this
                -- disable_file_types = {'tex'}, -- OR attach to every filetype except:
                hlgroup = 'LocalHighlight',
                cw_hlgroup = nil,
                insert_mode = false,
                min_match_len = 1,
                max_match_len = math.huge,
                highlight_single_match = true,
                debounce_timeout = 100,
                animate = {
                    enabled = false
                }
            })
        end
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {
            modes = {
                search = {
                    enabled = false,
                }
            }
        },
        -- stylua: ignore
        keys = {
            -- NOTE: Defined in astrocore.lua instead
            -- { "<Leader>fj", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash jump" },
            -- { "S", mode = { "n", "x", u }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "onsails/lspkind.nvim",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            -- "hrsh7th/cmp-path",
            -- "hrsh7th/cmp-cmdline",
            -- "hrsh7th/cmp-emoji",
            -- "hrsh7th/cmp-omni",
            -- "hrsh7th/cmp-nvim-lsp-signature-help",
            -- "hrsh7th/cmp-nvim-lsp-document-symbol",
            -- "petertriho/cmp-git",
            -- "rcarriga/cmp-dap",
            -- "SergioRibera/cmp-dotenv",
            -- "Snikimonkd/cmp-go-pkgs",
            -- "David-Kunz/cmp-npm",
            -- "davidsierradz/cmp-conventionalcommits",
        },
        config = function(plugin, opts)
            require "astronvim.plugins.configs.cmp" (plugin, opts)

            local cmp = require("cmp")
            local compare = require('cmp.config.compare')

            local kind_icons = {
                Text = "",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰇽",
                Variable = "󰂡",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "󰅲",
            }

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                        -- For `mini.snippets` users:
                        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                        -- insert({ body = args.body }) -- Insert at cursor
                        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                        -- require("cmp.config").set_onetime({ sources = {} })
                    end,
                },

                sorting = {
                    priority_weight = 2,
                    comparators = {
                        compare.scopes,
                        compare.score,
                        compare.locality,
                        compare.offset,
                        compare.exact,
                        compare.recently_used,
                        compare.kind,
                        compare.sort_text,
                        compare.length,
                        compare.order,
                    },
                },

                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'luasnip' },
                }),

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered()
                },

                formatting = {
                    fields = { 'abbr', 'kind', 'menu' },
                    format = function(entry, vim_item)
                        vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind

                        vim_item.menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
                            latex_symbols = "[LaTeX]",
                        })[entry.source.name]

                        return vim_item
                    end
                },

                -- -- Configure source priorities (higher number = higher priority)
                -- sources = cmp.config.sources({
                --     { name = 'nvim_lsp', priority = 1000, max_item_count = 50 },
                -- }),

                docs = {
                    max_height = 40,
                    max_width = 180,
                    border = 'rounded',
                },

                -- Show completion details and documentation automatically
                view = {
                    docs = {
                        auto_open = true,
                    }
                },

                -- Keep the documentation window visible even after completion
                experimental = {
                    ghost_text = true,
                },
            })
        end,
        -- opts = function(_, opts)
        -- end
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            window = {
                position = "right",
                width = 70,
            },
        },
    },

    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "williamboman/mason-lspconfig.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            require("go").setup {
                lsp_inlay_hints = {
                    enable = true,
                    show_variable_name = true,
                },
            }
        end,
        event = { "CmdlineEnter" },
        ft = { "go", "gomod" },
        -- build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },

    {
        "kdheepak/lazygit.nvim",
        lazy = false,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
    },

    -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "rafamadriz/friendly-snippets"
        },
        config = function(plugin, opts)
            require "astronvim.plugins.configs.luasnip" (plugin, opts)
            -- add more custom luasnip configuration such as filetype extend or custom snippets
            local luasnip = require "luasnip"
            luasnip.filetype_extend("javascript", { "javascriptreact" })

            local config_path = vim.fn.stdpath("config")
            require("luasnip.loaders.from_lua").load({ paths = { config_path .. "/snippets" } })
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
