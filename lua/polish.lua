-- TODO: move to astrocore.lua
vim.keymap.set('n', '§', 'yiw', { desc = 'Yank inner word' })
vim.keymap.set('n', '°', '"_diwP', { desc = 'Paste inner word' })
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

vim.diagnostic.config({
    virtual_text = {
        prefix = '●', -- or '●', '▎', or whatever symbol you prefer
        spacing = 32,  -- Increase this number for more space
        source = true,  -- Show source of diagnostic
    },
    float = {
        border = "rounded",
    },
    underline = true,
    severity_sort = true,
})

-- Cursor colors and behavior
vim.cmd("highlight Cursor guibg=#ffcf88 ctermbg=67")
vim.cmd("highlight iCursor guibg=#ffff00 ctermbg=229")
vim.cmd("highlight rCursor guibg=#d70000 ctermbg=124")
vim.cmd("set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver100-iCursor,r-cr:block-rCursor,o:hor50-Cursor/lCursor,sm:block-iCursor,i:blinkwait1000-blinkon500-blinkoff250")

-- Diagnostic colors
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#db4b4b" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#e0af68" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#0db9d7" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#1abc9c" })

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

-- Cmp popups config
local cmp = require("cmp")
local compare = require('cmp.config.compare')

local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
}

cmp.setup({
  sorting = {
    priority_weight = 2,
    comparators = {
      compare.scopes,
      compare.score,
      compare.locality,
      compare.offset,
      compare.exact,
      compare.recently_used,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
  }),

  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered()
  },

  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
	         
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
            
      return vim_item
    end
  },

  -- -- Configure source priorities (higher number = higher priority)
  -- sources = cmp.config.sources({
  --     { name = 'nvim_lsp', priority = 1000, max_item_count = 50 },
  -- }),

  docs = {
      max_height = 40,
      max_width = 180,
      border = 'rounded',
  },

  -- Show completion details and documentation automatically
  view = {
      docs = {
          auto_open = true,
      }
  },

  -- Keep the documentation window visible even after completion
  experimental = {
      ghost_text = true,
  },
})
