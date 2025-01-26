-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = {
        prefix = '●', -- or '●', '▎', or whatever symbol you prefer
        spacing = 32,  -- Increase this number for more space
        source = true,  -- Show source of diagnostic
      },
      float = {
        border = "rounded",
      },
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        tabstop = 4,
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      i = {
        ["<C-g>"] = { vim.lsp.buf.signature_help, desc = "Go to signature help" },
      },
      n = {
        -- second key is the lefthand side of the map

        ["<Leader>W"] = { "<cmd>noa w<cr>", desc = "Save without formatting" },
        ["<Leader>e"] = { "<cmd>Neotree toggle position=right<cr>", desc = "Toggle Explorer" },
        ["<Leader>E"] = { "<cmd>Neotree toggle position=float<cr>", desc = "Toggle floating Explorer" },
        ["ö"] = { "dd", desc = "Delete row" },
        ["Ö"] = { 'ma"8yy"8p`a', desc = "Duplicate line" },
        ["Å"] = { "<cmd>GoAltV!<cr>", desc = "Alternate file vertical split" },
        ["å"] = { "<cmd>GoAlt!<cr>", desc = "Alternate file" },
        ["Ä"] = { "maO<Esc>`a", desc = "Insert empty line above" },
        ["ä"] = { "mao<Esc>`a", desc = "Insert empty line below" },
        ["ga"] = { vim.lsp.buf.code_action, desc = "Go to code action" },
        ["gd"] = { vim.lsp.buf.definition, desc = "Go to definition" },
        ["gi"] = { vim.lsp.buf.implementation, desc = "Go to implementation" },
        ["gs"] = { vim.lsp.buf.signature_help, desc = "Go to signature help" },
        ["<Leader>a"] = { vim.lsp.buf.code_action, desc = "Go to code action" },
        ["<Leader>d"] = { vim.lsp.buf.definition, desc = "Go to definition" },
        ["<Leader>i"] = { vim.lsp.buf.implementation, desc = "Go to implementations" },
        ["c"] = { '"_c' , desc = "Change without yank" },
        ["r"] = { '"_ciw', desc = 'Change inner word' },
        ["R"] = { '"_ciW', desc = 'Change inner Word' },

        -- -- mappings seen under group name "Buffer"
        -- ["<Leader>bd"] = {
        --   function()
        --     require("astroui.status.heirline").buffer_picker(
        --       function(bufnr) require("astrocore.buffer").close(bufnr) end
        --     )
        --   end,
        --   desc = "Close buffer from tabline",
        -- },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}
