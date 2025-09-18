---@type LazySpec
return {
    {
        "FabijanZulj/blame.nvim",
        lazy = false,
        config = function()
            require('blame').setup {
                date_format = "%Y-%m-%d",
                mappings = {
                    commit_info = "i",
                    stack_push = "<TAB>",
                    stack_pop = "<S-TAB>",
                    show_commit = "<CR>",
                    close = { "<esc>", "q" },
                },
                merge_consecutive = false,
                max_summary_width = 50,
                -- virtual_style = "right_align",
                -- views = {
                --     window = window_view,
                --     virtual = virtual_view,
                --     default = window_view,
                -- },
                -- focus_blame = true,
                -- colors = nil,
                -- blame_options = nil,
                -- commit_detail_view = "vsplit",
                -- format_fn = formats.commit_date_author_fn,
                -- mappings = {
                --     commit_info = "i",
                --     stack_push = "<TAB>",
                --     stack_pop = "<BS>",
                --     show_commit = "<CR>",
                --     close = { "<esc>", "q" },
                -- }
            }
        end,
    },

    {
        "linrongbin16/gitlinker.nvim",
        cmd = "GitLink",
        opts = {},
    },

    {
        "lewis6991/gitsigns.nvim",
        opts = function(_, opts)
            opts.on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, {buffer = bufnr, desc = desc})
                end

                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({']c', bang = true})
                    else
                        gitsigns.nav_hunk('next')
                    end
                end)

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({'[c', bang = true})
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end)

                map('n', '<leader>gs', gitsigns.stage_hunk, 'GitSigns: Stage hunk')
                map('n', '<leader>gr', gitsigns.reset_hunk, 'GitSigns: Reset hunk')

                map('v', '<leader>gs', function()
                    gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end, 'GitSigns: Stage hunk')

                map('v', '<leader>gr', function()
                    gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end, 'GitSigns: Reset hunk')

                map('n', '<leader>gS', gitsigns.stage_buffer, 'GitSigns: Stage buffer')
                map('n', '<leader>gR', gitsigns.reset_buffer, 'GitSigns: Reset buffer')

                map('n', '<leader>gp', gitsigns.preview_hunk, 'GitSigns: Preview hunk')
                map('n', '<leader>gi', gitsigns.preview_hunk_inline, 'GitSigns: Preview hunk (inline)')

                map('n', '<leader>gbb', function()
                    gitsigns.blame_line({ full = true })
                end, 'GitSigns: View line blame')

                map('n', '<leader>gd', gitsigns.diffthis, 'GitSigns: Diff this')

                -- map('n', '<leader>gD', function()
                --     gitsigns.diffthis('~')
                -- end)

                map('n', '<leader>gQ', function() gitsigns.setqflist('all') end, 'GitSigns: Set to quickfix list (all)')
                map('n', '<leader>gq', gitsigns.setqflist, 'GitSigns: Set to quickfix list')
            end

            return opts
        end,
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
}
