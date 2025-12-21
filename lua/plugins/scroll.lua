---@type LazySpec
return {
    {
        'gorbit99/codewindow.nvim',
        config = function()
            local codewindow = require('codewindow')
            codewindow.setup({
                active_in_terminals = false, -- Should the minimap activate for terminal buffers
                auto_enable = true, -- Automatically open the minimap when entering a (non-excluded) buffer (accepts a table of filetypes)
                exclude_filetypes = { 'help' }, -- Choose certain filetypes to not show minimap on
                max_minimap_height = nil, -- The maximum height the minimap can take (including borders)
                max_lines = nil, -- If auto_enable is true, don't open the minimap for buffers which have more than this many lines.
                minimap_width = 9, -- The width of the text part of the minimap
                use_lsp = true, -- Use the builtin LSP to show errors and warnings
                use_treesitter = true, -- Use nvim-treesitter to highlight the code
                use_git = true, -- Show small dots to indicate git additions and deletions
                width_multiplier = 6, -- How many characters one dot represents
                z_index = 1, -- The z-index the floating window will be on
                show_cursor = true, -- Show the cursor position in the minimap
                screen_bounds = 'background', -- How the visible area is displayed, "lines": lines above and below, "background": background color
                window_border = 'single', -- The border style of the floating window (accepts all usual options)
                relative = 'editor', -- What will be the minimap be placed relative to, "win": the current window, "editor": the entire editor
                events = { 'TextChanged', 'InsertLeave', 'DiagnosticChanged', 'FileWritePost' } -- Events that update the code window
            })
            vim.api.nvim_set_hl(0, 'CodewindowBorder', {fg = '#444444'})
            vim.api.nvim_set_hl(0, 'CodewindowBoundsBackground', {bg = '#333333'})
            -- codewindow.apply_default_keybinds()
        end,
    },

    --[[ ---@module "neominimap.config.meta"
    {
        "Isrothy/neominimap.nvim",
        version = "v3.x.x",
        lazy = false,
        -- Optional. You can also set your own keybindings
        keys = {
            -- -- Global Minimap Controls
            -- { "<leader>nm", "<cmd>Neominimap Toggle<cr>", desc = "Toggle global minimap" },
            -- { "<leader>no", "<cmd>Neominimap Enable<cr>", desc = "Enable global minimap" },
            -- { "<leader>nc", "<cmd>Neominimap Disable<cr>", desc = "Disable global minimap" },
            -- { "<leader>nr", "<cmd>Neominimap Refresh<cr>", desc = "Refresh global minimap" },
            --
            -- -- Window-Specific Minimap Controls
            -- { "<leader>nwt", "<cmd>Neominimap WinToggle<cr>", desc = "Toggle minimap for current window" },
            -- { "<leader>nwr", "<cmd>Neominimap WinRefresh<cr>", desc = "Refresh minimap for current window" },
            -- { "<leader>nwo", "<cmd>Neominimap WinEnable<cr>", desc = "Enable minimap for current window" },
            -- { "<leader>nwc", "<cmd>Neominimap WinDisable<cr>", desc = "Disable minimap for current window" },
            --
            -- -- Tab-Specific Minimap Controls
            -- { "<leader>ntt", "<cmd>Neominimap TabToggle<cr>", desc = "Toggle minimap for current tab" },
            -- { "<leader>ntr", "<cmd>Neominimap TabRefresh<cr>", desc = "Refresh minimap for current tab" },
            -- { "<leader>nto", "<cmd>Neominimap TabEnable<cr>", desc = "Enable minimap for current tab" },
            -- { "<leader>ntc", "<cmd>Neominimap TabDisable<cr>", desc = "Disable minimap for current tab" },
            --
            -- -- Buffer-Specific Minimap Controls
            -- { "<leader>nbt", "<cmd>Neominimap BufToggle<cr>", desc = "Toggle minimap for current buffer" },
            -- { "<leader>nbr", "<cmd>Neominimap BufRefresh<cr>", desc = "Refresh minimap for current buffer" },
            -- { "<leader>nbo", "<cmd>Neominimap BufEnable<cr>", desc = "Enable minimap for current buffer" },
            -- { "<leader>nbc", "<cmd>Neominimap BufDisable<cr>", desc = "Disable minimap for current buffer" },
            --
            -- ---Focus Controls
            -- { "<leader>nf", "<cmd>Neominimap Focus<cr>", desc = "Focus on minimap" },
            -- { "<leader>nu", "<cmd>Neominimap Unfocus<cr>", desc = "Unfocus minimap" },
            -- { "<leader>ns", "<cmd>Neominimap ToggleFocus<cr>", desc = "Switch focus on minimap" },
        },
        init = function()
            -- The following options are recommended when layout == "float"
            vim.opt.wrap = false
            vim.opt.sidescrolloff = 36 -- Set a large value

            --- Put your configuration here
            ---@type Neominimap.UserConfig
            vim.g.neominimap = {
                auto_enable = true,

                -- How many columns a dot should span
                x_multiplier = 4, ---@type integer

                -- How many rows a dot should span
                y_multiplier = 1, ---@type integer

                -- For performance, when text changes, the minimap is refreshed after a certain delay.
                -- Set the delay in milliseconds
                delay = 500, ---@type integer

                --- Either `split` or `float`
                --- When layout is set to `float`, minimaps will be created in floating windows attached to all suitable windows.
                --- When layout is set to `split`, the minimap will be created in one split window per tab.
                layout = "split", ---@type Neominimap.Config.LayoutType
            }
        end,
    }, ]]

    {
        "karb94/neoscroll.nvim",
        opts = {
            mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
            hide_cursor = true,          -- Hide cursor while scrolling
            stop_eof = true,             -- Stop at <EOF> when scrolling downwards
            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            easing_function = 'cubic',
            duration_multiplier = 1.0,   -- Global duration multiplier
            pre_hook = nil,              -- Function to run before the scrolling animation starts
            post_hook = nil,             -- Function to run after the scrolling animation ends
            performance_mode = false,    -- Disable "Performance Mode" on all buffers.
        },
        config = function (_, opts)
            neoscroll = require('neoscroll')

            neoscroll.setup(opts)

            local keymap = {
                ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 90 }) end;
                ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 90 }) end;
                ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 90 }) end;
                ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 90 }) end;
                ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 90 }) end;
                ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 90 }) end;
                ["zt"]    = function() neoscroll.zt({ half_win_duration = 90 }) end;
                ["zz"]    = function() neoscroll.zz({ half_win_duration = 90 }) end;
                ["zb"]    = function() neoscroll.zb({ half_win_duration = 90 }) end;
            }
            local modes = { 'n', 'v', 'x' }
            for key, func in pairs(keymap) do
                vim.keymap.set(modes, key, func)
            end
        end,
    },

    {
        "petertriho/nvim-scrollbar",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "kevinhwang91/nvim-hlslens"
        },
        init = function()
            require("scrollbar").setup({
                handle = {
                    color = "#5a5755"
                },
                marks = {
                    Search = { color = "#d70000" },
                    Error = { color = "#d70000" },
                    Warn = { color = "#c08f48", text = { " ", " " } }, -- Set to space to "disable" this mark,
                    Info = { color = "#1d79b7", text = { " ", " " } },
                    Hint = { color = "#1abc9c", text = { " ", " " } },
                    Misc = { color = "#ffa029" },
                    GitDelete = { text = "┆" },
                },
                autocmd = {
                    render = {
                        "BufWinEnter",
                        "TabEnter",
                        "TermEnter",
                        "WinEnter",
                        "CmdwinLeave",
                        "TextChanged",
                        "VimResized",
                        "WinScrolled",
                        "CursorMoved",
                        "CursorMovedI",
                        "CursorHold",
                    },
                    clear = {
                        "BufWinLeave",
                        "TabLeave",
                        "TermLeave",
                        "WinLeave",
                    },
                },
                throttle_ms = 500,
            })

            require('gitsigns').setup({
                require("scrollbar.handlers.gitsigns").setup()
            })

            require('hlslens').setup({
                require("scrollbar.handlers.search").setup()
            })

            require("scrollbar.handlers").register("illuminated_word_marks", function(bufnr)
                -- Get all extmarks in the buffer
                local markers = vim.api.nvim_buf_get_extmarks(bufnr, -1, 0, -1, { details = true, type = "highlight" })
                -- local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

                local marks = {}

                for _, marker in ipairs(markers) do
                    local _, line, _, details = unpack(marker)

                    if details.hl_group == "IlluminatedWordWrite" or details.hl_group == "IlluminatedWordRead" or details.hl_group == "IlluminatedWordText" then
                        -- local text = lines[line + 1]  -- Lua is 1-based, but nvim_buf_get_lines returns 0-based
                        -- print("line", line, "text", text, details.hl_group, details.hl_mode, details.sign_hl_group, details.number_hl_group, details.line_hl_group, details.cursorline_hl_group)

                        table.insert(marks, {
                            line = line,
                            text = "",
                            type = "Misc",
                            level = 1,
                        })
                    end
                end

                -- vim.print(vim.inspect(marks))

                return marks
            end)
        end,
    },

}
