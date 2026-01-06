---@type LazySpec
return {
    {
        'aaronik/treewalker.nvim',
        opts = {
            highlight_duration = 1000,
            highlight_group = 'YankHighlight'
        }
    },

    {
        'simrat39/rust-tools.nvim',
    },

    {
        "sphamba/smear-cursor.nvim",
        opts = {
            -- Snappier cursor                    -- Default  Range
            stiffness = 0.8,                      -- 0.6      [0, 1]
            trailing_stiffness = 0.6,             -- 0.45     [0, 1]
            stiffness_insert_mode = 0.7,          -- 0.5      [0, 1]
            trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
            damping = 0.95,                       -- 0.85     [0, 1]
            damping_insert_mode = 0.95,           -- 0.9      [0, 1]
            distance_stop_animating = 0.5,        -- 0.1      > 0
        },
    },

    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        "lukas-reineke/virt-column.nvim",
        config = function()
            local cwd = vim.fn.getcwd()
            local virtcolumn = "100" -- default

            -- Set different column widths based on project
            if string.find(cwd, "/rw/") then
                virtcolumn = "120"
            -- elseif string.find(cwd, "/my%-other%-project") then
            --     virtcolumn = "80"
            end

            require("virt-column").setup({
                char = "▕",
                virtcolumn = virtcolumn,
                highlight = "VirtColumn"
            })
        end,
        -- opts = {
        --     char = "▕" ,
        --     virtcolumn = "100",
        --     highlight = "VirtColumn"
        -- }
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

    -- Buggy atm: https://github.com/pmizio/typescript-tools.nvim/issues/369
    -- {
    --     "pmizio/typescript-tools.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --     opts = {},
    -- },

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
                    priority_weight = 100,
                    comparators = {
                        compare.score,
                        compare.exact,
                        compare.scopes,
                        compare.locality,
                        compare.offset,
                        compare.recently_used,
                        compare.kind,
                        compare.sort_text,
                        compare.length,
                        compare.order,
                    },
                },

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

                -- Configure source priorities (higher number = higher priority)
                sources = cmp.config.sources({
                    { name = 'nvim_lsp', priority = 800, max_item_count = 20 },
                    { name = 'luasnip', priority = 400, max_item_count = 10 },
                    { name = 'buffer', priority = 100, max_item_count = 20 },
                }),

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
