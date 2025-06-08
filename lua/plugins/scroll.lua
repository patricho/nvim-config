---@type LazySpec
return {
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
                ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 50 }) end;
                ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 50 }) end;
                ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 50 }) end;
                ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 50 }) end;
                ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor=false; duration = 50 }) end;
                ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor=false; duration = 50 }) end;
                ["zt"]    = function() neoscroll.zt({ half_win_duration = 50 }) end;
                ["zz"]    = function() neoscroll.zz({ half_win_duration = 50 }) end;
                ["zb"]    = function() neoscroll.zb({ half_win_duration = 50 }) end;
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
                    Warn = { color = "#c08f48" },
                    Info = { color = "#1d79b7" },
                    Hint = { color = "#1abc9c" },
                    Misc = { color = "#ffa029" },
                    GitDelete = {
                        text = "┆",
                    },
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
