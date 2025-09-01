---@type LazySpec
return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            defaults = {
                -- layout_strategy = 'cursor',
                layout_config = {
                    horizontal = {
                        width = 0.95,
                        height = 0.95
                    },
                    vertical = {
                        width = 0.95,
                        height = 0.95
                    }
                },
            },
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
            },
        },
    },

    {
        "jmacadie/telescope-hierarchy.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },
            },
        },
        keys = {
            {
                "<leader>fhi",
                "<cmd>Telescope hierarchy incoming_calls<cr>",
                desc = "Find hierarchy calls (incoming)",
            },
            {
                "<leader>fho",
                "<cmd>Telescope hierarchy outgoing_calls<cr>",
                desc = "Find hierarchy calls (outgoing)",
            },
        },
        opts = {
            -- don't use `defaults = { }` here, do this in the main telescope spec
            extensions = {
                hierarchy = {
                    -- telescope-hierarchy.nvim config, see below
                },
                -- no other extensions here, they can have their own spec too
            },
        },
        config = function(_, opts)
            -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
            -- configs for us. We won't use data, as everything is in it's own namespace (telescope
            -- defaults, as well as each extension).
            require("telescope").setup(opts)
            require("telescope").load_extension("hierarchy")
        end,
    },

    {
        "smartpde/telescope-recent-files",
        opts = {
            extensions = {
                recent_files = {
                },
            },
        },
        config = function(_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("recent_files")
        end,
    },

    {
        "debugloop/telescope-undo.nvim",
        keys = {
            {
                "<Leader>fu",
                "<cmd>Telescope undo<cr>",
                desc = "Undo history",
            },
        },
        opts = {
            -- don't use `defaults = { }` here, do this in the main telescope spec
            extensions = {
                undo = {
                    -- telescope-undo.nvim config
                },
            },
        },
        config = function(_, opts)
            -- Calling telescope's setup from multiple specs does not hurt, it will happily merge the
            -- configs for us. We won't use data, as everything is in it's own namespace (telescope
            -- defaults, as well as each extension).
            require("telescope").setup(opts)
            require("telescope").load_extension("undo")
        end,
    },
}
