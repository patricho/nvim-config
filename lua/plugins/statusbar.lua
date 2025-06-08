---@type LazySpec
return {
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            animation = true,
            focus_on_close = "right",
            maximum_padding = 2,
            minimum_padding = 2,
            icons = {
                -- Configure the base icons on the bufferline.
                -- Valid options to display the buffer index and -number are `true`, "superscript" and "subscript"
                buffer_index = false,
                buffer_number = false,
                button = "",
                -- Enables / disables diagnostic symbols
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = {enabled = true, icon = ""},
                    [vim.diagnostic.severity.WARN] = {enabled = false},
                    [vim.diagnostic.severity.INFO] = {enabled = false},
                    [vim.diagnostic.severity.HINT] = {enabled = false},
                },
                gitsigns = {
                    added = {enabled = false, icon = "+"},
                    changed = {enabled = false, icon = "~"},
                    deleted = {enabled = false, icon = "-"},
                },
                filetype = {
                    -- Sets the icon"s highlight group.
                    -- If false, will use nvim-web-devicons colors
                    custom_colors = false,

                    -- Requires `nvim-web-devicons` if `true`
                    enabled = true,
                },
                separator = {left = "", right = ""},

                -- If true, add an additional separator at the end of the buffer list
                separator_at_end = false,

                -- Configure the icons on the bufferline when modified or pinned.
                -- Supports all the base icon options.
                modified = {button = "●"},
                pinned = {button = "", filename = true},

                -- -- Use a preconfigured buffer appearance— can be "default", "powerline", or "slanted"
                -- preset = "slanted",

                -- Configure the icons on the bufferline based on the visibility of a buffer.
                -- Supports all the base icon options, plus `modified` and `pinned`.
                alternate = {filetype = {enabled = false}},
                current = {buffer_index = false},
                inactive = {button = ""},
                visible = {modified = {buffer_number = false}},
            },
        },
    },

    {
        -- https://docs.astronvim.com/recipes/status/#replicate-visual-studio-code-winbar
        "rebelot/heirline.nvim",
        dependencies = {
            "f-person/git-blame.nvim",
            -- {
            --     "AstroNvim/astroui",
            --     ---@type AstroUIOpts
            --     opts = {
            --         icons = {
            --             Clock = "",
            --         },
            --     },
            -- },
        },
        opts = function(_, opts)
            local status = require("astroui.status")
            local gitblame = require('gitblame')
            local section = { "", "" }

            opts.statusline = {
                hl = { fg = "fg", bg = "#000000" },
                status.component.mode({ mode_text = { hl = { fg = "#000000" }, padding = { left = 1, right = 1 } }, surround = { separator = { "", "" } } }),
                status.component.git_branch({ git_branch = { padding = { left = 1, right = 1 }, hl = { bg = "#211e1c" } }, surround = { color = "#211e1c", separator = section } }),
                status.component.git_diff({ surround = { separator = section, color = "#211e1c" }, padding = { right = 1 } }),
                status.component.diagnostics({
                    ERROR = { icon = { kind = "DiagnosticError", padding = { left = 1, right = 1 } } },
                    WARN = { icon = { kind = "DiagnosticWarn", padding = { left = 1, right = 1 } } },
                    INFO = { icon = { kind = "DiagnosticInfo", padding = { left = 1, right = 1 } } },
                    HINT = { icon = { kind = "DiagnosticHint", padding = { left = 1, right = 1 } } },
                    surround = { separator = section, color = "#211e1c" },
                    padding = { right = 1 }
                }),
                status.component.fill(),
                status.component.cmd_info({
                    padding = { left = 1, right = 1 },
                    surround = { separator = section, color = "#211e1c" }
                }),
                status.component.fill(),
                status.component.builder({
                    {
                        condition = function()
                            return gitblame.is_blame_text_available()
                        end,
                        provider = function()
                            return gitblame.get_current_blame_text()
                        end,
                        update = {
                            "CursorHold",
                            callback = vim.schedule_wrap(function()
                                vim.cmd("redrawstatus")
                            end),
                        },
                    },
                    hl = { bg = "#211e1c", fg = "#808080" },
                    surround = { separator = section, color = "#211e1c" },
                    padding = { left = 1, right = 1 }
                }),
                status.component.file_info({
                    file_icon = { hl = { fg = "fg" }, padding = { left = 0 } },
                    padding = { left = 1, right = 1 },
                    surround = { separator = section, color = "#211e1c" }
                }),
                status.component.lsp({
                    padding = { left = 1, right = 1 },
                    surround = { separator = section, color = "#211e1c" },
                    lsp_client_names = { icon = { padding = { left = 0, right = 1 } } }
                }),
                status.component.treesitter({
                    padding = { left = 1, right = 1 },
                    surround = { separator = section, color = "#211e1c" }
                }),
                status.component.builder({
                    -- %l = current line number
                    -- %L = number of lines in the buffer
                    -- %c = column number
                    -- %P = percentage through file of displayed window
                    provider = " 󰦨 %l:%c ",
                    hl = { bg = "#211e1c", fg = "#808080" },
                    surround = { separator = section, color = "#211e1c" },
                }),
                status.component.mode({ padding = { left = 1, right = 1 }, surround = { separator = { "", "" } } }),
            }

            opts.winbar = {
                {
                    -- show the path to the file relative to the working directory
                    status.component.separated_path({
                        path_func = status.provider.filename({ modify = ":.:h" }),
                        hl = { fg = '#666666' },
                    }),

                    -- add the file name and icon
                    status.component.file_info({ -- add file_info to breadcrumbs
                        file_icon = {
                            hl = { fg = "#333333" },
                            padding = { left = 0 },
                        },
                        filename = {},
                        filetype = false,
                        file_modified = false,
                        file_read_only = false,
                        hl = { fg = "#888888" },
                        surround = false,
                        update = "BufEnter",
                    }),

                    -- show the breadcrumbs
                    status.component.breadcrumbs({
                        icon = { fg = '#333333' },
                        hl = { fg = '#666666' }, --status.hl.get_attributes("winbar"),
                        prefix = true,
                        padding = { left = 0 },
                    }),

                    -- -- background left over
                    -- status.component.fill({
                    --     hl = { bg = "#000000" }
                    -- }),
                },
            }
        end,
    },

    {
        "f-person/git-blame.nvim",
        event = "VeryLazy",
        opts = {
            enabled = true,
            message_template = " <summary> [<author> <date>]",
            date_format = "%Y-%m-%d",
            message_when_not_committed = "",
            display_virtual_text = 0, -- Disable virtual text, just show in heirline
            delay = 100,
            schedule_event = "CursorMoved",
        },
    }
}
