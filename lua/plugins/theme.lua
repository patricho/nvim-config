---@type LazySpec
return {
    {
        "metalelf0/black-metal-theme-neovim",
        lazy = false,
        priority = 1000,
        config = function()
            require("black-metal").setup({
                -- Can be one of: bathory | burzum | dark-funeral | darkthrone | emperor | gorgoroth | immortal | impaled-nazarene | khold | marduk | mayhem | nile | taake | thyrfing | venom | windir
                -- alt_bg = true,
                transparent = true,
            })
        end,
    },

    {
        "ptdewey/darkearth-nvim"
    },

    {
        "xero/miasma.nvim",
        config = function()
        end,
    },

    {
        "EdenEast/nightfox.nvim",
        config = function()
            require('nightfox').setup({
                options = {
                    transparent = true,
                }
            })
        end
    },

    {
        "shaunsingh/nord.nvim",
        config = function()
            vim.g.nord_disable_background  = true
        end
    },

    {
        "sainnhe/gruvbox-material",
        config = function()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_background = "soft"
            vim.g.gruvbox_material_transparent_background = 1
        end
    },

    {
        "vague2k/vague.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("vague").setup({
                colors = {
                    bg = "NONE",
                    line = "#181715", -- cursorline
                    visual = "#662200", -- selection
                    fg = "#cdcdcd", -- ordinary text
                    comment = "#5a5755", -- comments, indent lines, line numbers
                    floatBorder = "#494644",
                    search = "#d70000",

                    -- defaults:
                    -- fg = "#cdcdcd",
                    -- comment = "#606079",
                    -- floatBorder = "#878787",
                    -- builtin = "#b4d4cf", -- enums etc?
                    -- func = "#c48282",
                    -- string = "#e8b589",
                    -- number = "#e0a363",
                    -- property = "#c3c3d5",
                    -- constant = "#aeaed1",
                    -- parameter = "#bb9dbd",
                    -- error = "#d8647e",
                    -- warning = "#f3be7c",
                    -- hint = "#7e98e8",
                    -- operator = "#90a0b5",
                    -- keyword = "#6e94b2",
                    -- type = "#9bb4bc",
                    -- search = "#405065",
                    -- plus = "#7fa563",
                    -- delta = "#f3be7c",
                }
            })
        end
    },

    {
        "kaiuri/nvim-juliana",
        lazy = false,
        opts = {},
        config = function()
            require("nvim-juliana").setup({
                colors = {
                    bg1 = "NONE",
                    bg2 = "NONE",
                    bg3 = "NONE",
                }
            })
        end
    },

    {
        "webhooked/kanso.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("kanso").setup({
                commentStyle = { italic = true },
                transparent = true,
                theme = "zen",
                colors = {
                    palette = {
                    },
                    theme = {
                        all = {
                            syn = {
                                comment = "#5a5755",
                                operator = "#7a7775", -- plus minus equals
                                punct = "#7a7775", -- parenthesis, punctuation
                            },
                            ui = {
                                float = {
                                    bg = "none",
                                    bg_border = "none",
                                    fg_border  = "#494644",
                                },
                                pmenu = {
                                    bg = "none",
                                    bg_sel = "none",
                                    bg_sbar = "none",
                                    bg_thumb = "none",
                                },
                                cursor_line_nr_foreground = "#4a4745", -- line numbers etc
                                cursor_line_nr_active_foreground = "#6a6765", -- active line number
                                bg_p2      = "#181715", -- cursorline background
                                bg_visual  = "#662200", -- selection background
                                nontext    = "#5a5755",
                                special    = "#4a4745",
                                whitespace = "#2a2724",
                                indent_line = "#2a2724",
                                active_indent_line  = "#4a4745",
                            }
                        }
                    }
                },
            })
        end,
    },

    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                transparent = true,
                colors = {
                    palette = {
                        dragonBlack0 = "none",
                        dragonBlack1 = "none",
                        dragonBlack2 = "none",
                        dragonBlack3 = "none",
                        dragonBlack4 = "none",
                        dragonBlack5 = "none",
                        waveBlue1 = "none",
                        waveBlue2 = "none",
                    },
                    theme = {
                        ui = {
                            float = {
                                bg = "none",
                                bg_border = "none",
                            },
                            pmenu = {
                                bg = "none",
                                bg_sel = "none",
                                bg_sbar = "none",
                                bg_thumb = "none",
                            },
                        },
                        dragon = {
                            ui = {
                                bg_p2      = "#181715", -- cursorline background
                                bg_visual  = "#662200", -- selection background

                                nontext    = "#5a5755", -- line numbers etc
                                special    = "#494644", -- current indentation vertical lines
                                whitespace = "#2a2724", -- indendation vertical lines
                            }
                        }
                    }
                }
            })
        end
    },
}
