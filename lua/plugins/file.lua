---@type LazySpec
return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = function(_, opts)
            -- Add filesystem-specific custom commands
            opts.filesystem = opts.filesystem or {}
            opts.filesystem.commands = opts.filesystem.commands or {}

            opts.filesystem.commands.open_all = function(state)
                local node = state.tree:get_node()
                if node.type == "directory" then
                    vim.notify("Cannot open directory", vim.log.levels.WARN)
                    return
                end
                vim.cmd("edit " .. vim.fn.fnameescape(node.path))
            end

            opts.filesystem.commands.open_all_visual = function(state, selected_nodes)
                local files_to_open = {}
                for _, node in ipairs(selected_nodes) do
                    if node.type ~= "directory" then
                        table.insert(files_to_open, node.path)
                    end
                end

                if #files_to_open == 0 then
                    vim.notify("No files selected", vim.log.levels.WARN)
                    return
                end

                local utils = require("neo-tree.utils")
                local winid = utils.get_appropriate_window(state)
                vim.api.nvim_set_current_win(winid)

                -- Use noautocmd to prevent autocmds from firing repeatedly
                for _, path in ipairs(files_to_open) do
                    vim.cmd("noautocmd badd " .. vim.fn.fnameescape(path))
                end

                -- Now switch to the last file (this will trigger autocmds once)
                local last_file = files_to_open[#files_to_open]
                vim.cmd("buffer " .. vim.fn.bufnr(last_file))

                vim.notify("Opened " .. #files_to_open .. " files")
            end

            -- Add config and mappings
            opts.window = opts.window or {}
            opts.window.position = "right"
            opts.window.width = 70
            opts.window.mappings = opts.window.mappings or {}
            opts.window.mappings["o"] = "open_all"

            -- Workaround for an apparent bug in neo-tree that doesn't detect commands in visual mode initially
            opts.event_handlers = opts.event_handlers or {}
            table.insert(opts.event_handlers, {
                event = "neo_tree_buffer_enter",
                handler = function()
                    -- Trigger WinEnter to set restored_after_window_change = true
                    vim.defer_fn(function()
                        vim.cmd("doautocmd WinEnter")
                    end, 1000)
                end,
            })
            return opts
        end,
    },

    -- {
    --     "mikavilpas/yazi.nvim",
    --     version = "v10.3.0",
    --     event = "VeryLazy",
    --     dependencies = {
    --         { "nvim-lua/plenary.nvim", lazy = true },
    --     },
    --     keys = {
    --         -- 👇 in this section, choose your own keymappings!
    --         {
    --             "<leader>e",
    --             mode = { "n", "v" },
    --             "<cmd>Yazi<cr>",
    --             desc = "Open yazi at the current file",
    --         },
    --         {
    --             -- Open in the current working directory
    --             "<leader>cw",
    --             "<cmd>Yazi cwd<cr>",
    --             desc = "Open the file manager in nvim's working directory",
    --         },
    --         {
    --             "<c-up>",
    --             "<cmd>Yazi toggle<cr>",
    --             desc = "Resume the last yazi session",
    --         },
    --     },
    --     ---@type YaziConfig | {}
    --     opts = {
    --         -- if you want to open yazi instead of netrw, see below for more info
    --         open_for_directories = false,
    --         keymaps = {
    --             show_help = "<f1>",
    --         },
    --     },
    --     -- 👇 if you use `open_for_directories=true`, this is recommended
    --     init = function()
    --         -- mark netrw as loaded so it's not loaded at all.
    --         --
    --         -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    --         vim.g.loaded_netrwPlugin = 1
    --     end,
    -- },
}

