-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- -- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

vim.keymap.set('n', 'r', 'ciw', { desc = 'Change inner word' })
vim.keymap.set('n', 'R', 'ciW', { desc = 'Change inner Word' })
vim.keymap.set('n', '§', 'yiw', { desc = 'Yank inner word' })
vim.keymap.set('n', '°', 'viwp', { desc = 'Paste inner word' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show hover information' })
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { desc = 'Show hover information' })
vim.keymap.set('n', 'gru', vim.lsp.buf.references, { desc = 'Show references for symbol' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<tab>', '<cmd>bnext<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<S-tab>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, { desc = 'Show hover information' })
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename symbol under cursor' })
vim.keymap.set('n', '<leader>fs', require("telescope.builtin").lsp_document_symbols, { desc = 'Search file symbols' })
vim.keymap.set('n', '<leader>fS', vim.lsp.buf.workspace_symbol, { desc = 'Search workspace symbols' })
vim.keymap.set('n', '<C-S-i>', '<cmd>cnext<cr>', { desc = 'Next quickfix item' })
vim.keymap.set('n', '<C-S-o>', '<cmd>cprev<cr>', { desc = 'Previous quickfix item' })

