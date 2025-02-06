-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    options = {
      opt = {
        tabstop = 4,
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = {
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    diagnostics = {
      virtual_text = {
          prefix = '▎', -- or '●', '▎', or whatever symbol you prefer
          spacing = 64,  -- Increase this number for more space
          source = true,  -- Show source of diagnostic
      },
      float = {
          border = "rounded",
      },
      underline = true,
      severity_sort = true,
    },
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      i = {
        ["<C-g>"] = { vim.lsp.buf.signature_help, desc = "Go to signature help" },
        ["<C-s>"] = { vim.lsp.buf.signature_help, desc = "Go to signature help" },
      },
      v = {
        ["ga"] = { vim.lsp.buf.code_action, desc = "Go to code action" },
        ["<Leader>a"] = { vim.lsp.buf.code_action, desc = "Go to code action" },
        ["Ö"] = { '"8y"8P', desc = "Duplicate selected lines" },
      },
      n = {
        ["<Leader>noaw"] = { "<cmd>noa w<cr>", desc = "Save without formatting" },
        ["<Leader>e"] = { "<cmd>Neotree toggle position=right<cr>", desc = "Toggle Explorer" },
        ["<Leader>E"] = { "<cmd>Neotree toggle position=float<cr>", desc = "Toggle floating Explorer" },
        ["<Leader>Wj"] = { "<C-w>s", desc = "Create horizontal window split" },
        ["<Leader>Wl"] = { "<C-w>v", desc = "Create vertical window split" },
        ["<Leader>Wc"] = { "<C-w>q", desc = "Close current window" },
        ["<Leader>WC"] = { "<C-w>o", desc = "Close other windows" },
        ["<Leader>C"] = { function ()
            -- Get current buffer
            local current = vim.api.nvim_get_current_buf()
            
            -- Get all listed buffers
            local buffers = vim.api.nvim_list_bufs()
            
            -- Loop through buffers and delete all except current
            for _, buf in ipairs(buffers) do
                if buf ~= current and vim.api.nvim_buf_is_valid(buf) then
                    vim.api.nvim_buf_delete(buf, { force = true })
                end
            end
          end, desc = "Close other buffers" },
        ["ö"] = { '"_dd', desc = "Delete row" },
        ["Ö"] = { 'ma"8yy"8p`a', desc = "Duplicate line" },
        ["Å"] = { "<cmd>GoAltV!<cr>", desc = "Alternate file vertical split" },
        ["å"] = { "<cmd>GoAlt!<cr>", desc = "Alternate file" },
        ["Ä"] = { "maO<Esc>`a", desc = "Insert empty line above" },
        ["ä"] = { "mao<Esc>`a", desc = "Insert empty line below" },
        ["ga"] = { vim.lsp.buf.code_action, desc = "Go to code action" },
        ["gd"] = { vim.lsp.buf.definition, desc = "Go to definition" },
        ["gD"] = {
          function()
            -- Create a vertical split
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-w>v', true, true, true), 'n', true)

            -- Call the LSP definition command
            vim.lsp.buf.definition()

            -- Top the current position
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('ztkk', true, true, true), 'n', true)
          end,
          desc = "Close buffer from tabline",
        },
        ["gi"] = { vim.lsp.buf.implementation, desc = "Go to implementation" },
        ["gs"] = { vim.lsp.buf.signature_help, desc = "Go to signature help" },
        ["gu"] = { vim.lsp.buf.references, desc = 'Go to usages for symbol' },
        ["<Leader>a"] = { vim.lsp.buf.code_action, desc = "Go to code action" },
        ["<Leader>d"] = { vim.lsp.buf.definition, desc = "Go to definition" },
        ["<Leader>i"] = { vim.lsp.buf.implementation, desc = "Go to implementations" },
        ["c"] = { '"_c' , desc = "Change without yank" },
        ["r"] = { '"_ciw', desc = 'Change inner word' },
        ["R"] = { '"_ciW', desc = 'Change inner Word' },
        ["<Leader>gb"] = { function() require("gitsigns").blame_line { full = true } end, desc = "View full Git blame" }

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
