-- TODO: move to astrocore.lua
vim.keymap.set('n', '§', 'yiw', { desc = 'Yank inner word' })
vim.keymap.set('n', '°', '"_diwP', { desc = 'Paste inner word' })
vim.keymap.set('n', '½', '"_diwP', { desc = 'Paste inner word' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show hover information' })
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { desc = 'Show hover information' })
vim.keymap.set('n', '<leader>bp', '<cmd>BufferPrevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>BufferNext<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<tab>', '<cmd>BufferNext<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<S-tab>', '<cmd>BufferPrevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, { desc = 'Show hover information' })
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename symbol under cursor' })
vim.keymap.set('n', '<leader>fs', require("telescope.builtin").lsp_document_symbols, { desc = 'Search file symbols' })
vim.keymap.set('n', '<leader>fS', vim.lsp.buf.workspace_symbol, { desc = 'Search workspace symbols' })
vim.keymap.set('n', '<C-S-i>', '<cmd>cnext<cr>', { desc = 'Next quickfix item' })
vim.keymap.set('n', '<M-S-i>', '<cmd>cnext<cr>', { desc = 'Next quickfix item' })
vim.keymap.set('n', '<C-S-o>', '<cmd>cprev<cr>', { desc = 'Previous quickfix item' })
vim.keymap.set('n', '<M-S-o>', '<cmd>cprev<cr>', { desc = 'Previous quickfix item' })
vim.keymap.set('n', '<M-S-o>', '<cmd>cprev<cr>', { desc = 'Previous quickfix item' })
vim.keymap.set('n', '<Leader>mm', require('recall').toggle, { desc = 'Recall toggle' })
vim.keymap.set('n', 'mm'        , require('recall').toggle, { desc = 'Recall toggle' })
vim.keymap.set('n', '<Leader>mn', require('recall').goto_next, { desc = 'Recall next' })
vim.keymap.set('n', 'mn'        , require('recall').goto_next, { desc = 'Recall next' })
vim.keymap.set('n', '<Leader>mp', require('recall').goto_prev, { desc = 'Recall previous' })
vim.keymap.set('n', 'mp'        , require('recall').goto_prev, { desc = 'Recall previous' })
vim.keymap.set('n', '<Leader>mc', require('recall').clear, { desc = 'Recall clear' })
vim.keymap.set('n', 'mc'        , require('recall').clear, { desc = 'Recall clear' })
vim.keymap.del('n', '<Leader>q') -- Don't quit window
vim.keymap.del('n', '<leader>o') -- Remove bindings that conflicts with OpenCode, that's not used anyway

vim.o.updatetime = 400
vim.o.autoread = true
vim.o.scrolloff = 8
vim.cmd("packadd cfilter")

-- Color column
vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#383230" })

-- So gq and gw can be used to properly wrap comments
vim.cmd("set formatexpr=")
vim.cmd("set textwidth=100")

-- Cursor colors and behavior
vim.cmd("highlight Cursor guibg=#ffcf88 ctermbg=67")
vim.cmd("highlight iCursor guibg=#ffff00 ctermbg=229")
vim.cmd("highlight rCursor guibg=#d70000 ctermbg=124")
vim.cmd("set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver100-iCursor,r-cr:block-rCursor,o:hor50-Cursor/lCursor,sm:block-iCursor,i:blinkwait1000-blinkon500-blinkoff250")

-- Diagnostic colors
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = "#db4b4b", sp = "#ff0000", underline = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { underline = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { underline = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#812424", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#6a4b1a", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#0d6987", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#007c5c", italic = true })

-- Status line mode indication
vim.api.nvim_set_hl(0, "HeirlineNormal", { fg = "#000000", bg = "#89b4fa" })
vim.api.nvim_set_hl(0, "HeirlineInsert", { fg = "#000000", bg = "#a6e3a1" })
vim.api.nvim_set_hl(0, "HeirlineVisual", { fg = "#000000", bg = "#fe8019" })
vim.api.nvim_set_hl(0, "HeirlineReplace", { fg = "#ffffff", bg = "#d70000" })

vim.api.nvim_set_hl(0, "YankHighlight", { fg = "#fe8019", bg ="#500f08" })
vim.api.nvim_set_hl(0, "LocalHighlight", { bg ="#702020" })
vim.api.nvim_set_hl(0, "NotifyBackground", { bg ="#000000" })

-- Search colors
vim.api.nvim_set_hl(0, "Search", { fg = '#d70000' })
vim.api.nvim_set_hl(0, "CurSearch", { fg = '#d70000', bold = true })
vim.api.nvim_set_hl(0, "HlSearchNear", { fg = '#d70000', bold = true })
vim.api.nvim_set_hl(0, "HlSearchLens", { fg = "#777777" })
vim.api.nvim_set_hl(0, "HlSearchLensNear", { fg = "#aaaaaa" })

-- Current symbol LSP highlight colors
vim.api.nvim_set_hl(0, 'LspReferenceText',     { fg = '#fe8019' })
vim.api.nvim_set_hl(0, 'LspReferenceRead',     { fg = '#fe8019' })
vim.api.nvim_set_hl(0, 'LspReferenceWrite',    { fg = '#fe8019', bold = true, underline = true })
vim.api.nvim_set_hl(0, 'IlluminatedWordText',  { fg = '#fe8019' })
vim.api.nvim_set_hl(0, 'IlluminatedWordRead',  { fg = '#fe8019' })
vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { fg = '#fe8019', bold = true, underline = true })

-- Git diff styling
vim.opt.fillchars = { diff = '╱' }
vim.api.nvim_set_hl(0, 'DiffAdd',                  { bg = '#0f4412' })
vim.api.nvim_set_hl(0, 'GitSignsAdd',              { fg = '#1d982e' })
-- vim.api.nvim_set_hl(0, 'ScrollbarGitAdd',       { fg = '#1d982e' })
-- vim.api.nvim_set_hl(0, 'ScrollbarGitAddHandle', { fg = '#1d982e', bg = '#444444' })
vim.api.nvim_set_hl(0, 'DiffDelete',               { fg = '#962623' })
vim.api.nvim_set_hl(0, 'GitSignsDelete',           { fg = '#962623' })
-- vim.api.nvim_set_hl(0, 'ScrollbarGitDelete',    { fg = '#962623' })
-- vim.api.nvim_set_hl(0, 'ScrollbarGitDeleteHandle', { fg = '#962623', bg = '#444444' })
vim.api.nvim_set_hl(0, 'DiffText',                 { bg = '#466570' })
vim.api.nvim_set_hl(0, 'DiffChange',               { bg = '#25343c' })
vim.api.nvim_set_hl(0, 'GitSignsChange',           { fg = '#466570' })
-- vim.api.nvim_set_hl(0, 'ScrollbarGitChange',       { fg = '#466570' })
-- vim.api.nvim_set_hl(0, 'ScrollbarGitChangeHandle', { fg = '#466570', bg = '#444444' })

-- Barbar tabline
vim.api.nvim_set_hl(0, 'BufferCurrent', { fg = '#bbbbbb', bg = '#282828', bold = true })
vim.api.nvim_set_hl(0, 'BufferCurrentMod', { fg = '#bbbbbb', bg = '#282828', bold = true })
vim.api.nvim_set_hl(0, 'BufferCurrentBtn', { fg = '#555555', bg = '#282828' })
vim.api.nvim_set_hl(0, 'BufferCurrentADDED', { fg = '#238636', bg = '#282828' })
vim.api.nvim_set_hl(0, 'BufferCurrentCHANGED', { fg = '#bd561d', bg = '#282828' })
vim.api.nvim_set_hl(0, 'BufferCurrentDELETED', { fg = '#da3633', bg = '#282828' })
vim.api.nvim_set_hl(0, 'BufferCurrentERROR', { fg = '#d72222', bg = '#282828' })
vim.api.nvim_set_hl(0, 'BufferCurrentSign', { fg = '#282828', bg = '#282828' })
vim.api.nvim_set_hl(0, 'BufferInactiveSign', { fg = '#282828', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'BufferInactive', { fg = '#666666', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'BufferInactiveMod', { fg = '#666666', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'BufferInactiveBtn', { fg = '#333333', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'BufferTabpagesSep', { fg = '#00ff00', bg = '#00ff00' })
vim.api.nvim_set_hl(0, 'BufferTabpageFill', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'BufferTabpages', { fg = '#00ff00', bg = '#00ff00' })
