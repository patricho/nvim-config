-- TODO: move to astrocore.lua
vim.keymap.set('n', '§', 'yiw', { desc = 'Yank inner word' })
vim.keymap.set('n', '°', '"_diwP', { desc = 'Paste inner word' })
vim.keymap.set('n', '½', '"_diwP', { desc = 'Paste inner word' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show hover information' })
vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { desc = 'Show hover information' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<tab>', '<cmd>bnext<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<S-tab>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, { desc = 'Show hover information' })
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = 'Rename symbol under cursor' })
vim.keymap.set('n', '<leader>fs', require("telescope.builtin").lsp_document_symbols, { desc = 'Search file symbols' })
vim.keymap.set('n', '<leader>fS', vim.lsp.buf.workspace_symbol, { desc = 'Search workspace symbols' })
vim.keymap.set('n', '<C-S-i>', '<cmd>cnext<cr>', { desc = 'Next quickfix item' })
vim.keymap.set('n', '<M-S-i>', '<cmd>cnext<cr>', { desc = 'Next quickfix item' })
vim.keymap.set('n', '<C-S-o>', '<cmd>cprev<cr>', { desc = 'Previous quickfix item' })
vim.keymap.set('n', '<M-S-o>', '<cmd>cprev<cr>', { desc = 'Previous quickfix item' })
vim.keymap.del('n', '<Leader>q') -- Don't quit window

vim.o.autoread = true
vim.o.scrolloff = 8
vim.cmd("packadd cfilter")

vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- or '●', '▎', or whatever symbol you prefer
        spacing = 16,  -- Increase this number for more space
        source = true,  -- Show source of diagnostic
    },
    float = {
        border = "rounded",
    },
    underline = true,
    severity_sort = true,
})

-- Color column
vim.cmd("set cc=100")
vim.g.virtcolumn_char = '▕' -- char to display the line
vim.g.virtcolumn_priority = 1 -- priority of extmark
vim.api.nvim_set_hl(0, "VirtColumn", { fg = "#333333" })

-- Cursor colors and behavior
vim.cmd("highlight Cursor guibg=#ffcf88 ctermbg=67")
vim.cmd("highlight iCursor guibg=#ffff00 ctermbg=229")
vim.cmd("highlight rCursor guibg=#d70000 ctermbg=124")
vim.cmd("set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver100-iCursor,r-cr:block-rCursor,o:hor50-Cursor/lCursor,sm:block-iCursor,i:blinkwait1000-blinkon500-blinkoff250")

-- Diagnostic colors
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { fg = "#db4b4b", sp = "#ff0000", underline = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { underline = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { underline = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#9b2b2b", italic = true })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#a06f28", italic = true })
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

-- Git diff colors
vim.api.nvim_set_hl(0, 'DiffAdd',                  { fg = '#238636' })
vim.api.nvim_set_hl(0, 'GitSignsAdd',              { fg = '#238636' })
-- vim.api.nvim_set_hl(0, 'ScrollbarGitAdd',          { fg = '#238636' })
-- vim.api.nvim_set_hl(0, 'ScrollbarGitAddHandle',    { fg = '#238636', bg = '#444444' })
vim.api.nvim_set_hl(0, 'DiffDelete',               { fg = '#da3633' })
vim.api.nvim_set_hl(0, 'GitSignsDelete',           { fg = '#da3633' })
-- vim.api.nvim_set_hl(0, 'ScrollbarGitDelete',       { fg = '#da3633' })
-- vim.api.nvim_set_hl(0, 'ScrollbarGitDeleteHandle', { fg = '#da3633', bg = '#444444' })
vim.api.nvim_set_hl(0, 'DiffChange',               { fg = '#bd561d' })
vim.api.nvim_set_hl(0, 'GitSignsChange',           { fg = '#bd561d' })
-- vim.api.nvim_set_hl(0, 'ScrollbarGitChange',       { fg = '#bd561d' })
-- vim.api.nvim_set_hl(0, 'ScrollbarGitChangeHandle', { fg = '#bd561d', bg = '#444444' })
