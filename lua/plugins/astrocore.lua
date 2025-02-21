-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    autocmds = {
      alpha_autostart = false,
      restore_session = {
        {
          event = "VimEnter",
          desc = "Restore previous directory session if neovim opened with no arguments",
          nested = true, -- trigger other autocommands as buffers open
          callback = function()
            -- Only load the session if nvim was started with no args
            if vim.fn.argc(-1) == 0 then
              -- try to load a directory session using the current working directory
              require("resession").load(
                vim.fn.getcwd(),
                { dir = "dirsession", silence_errors = true }
              )
            end
          end,
        },
      },
      highlightyank = {
        {
          event = "TextYankPost",
          desc = "Highlight yanked text",
          pattern = "*",
          callback = function() (vim.hl or vim.highlight).on_yank({ higroup = 'YankHighlight', timeout = 2000 }) end,
        },
      },
    },
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = false,
      cmp = true,
      diagnostics_mode = 3, -- 0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on
      highlighturl = true,
      notifications = true,
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
        ["p"] = { '"_dP', desc = "Paste over selection without yanking" },
        ["J"] = { ":move '>+1<CR>V'[=gv", desc = "Move selected lines down" },
        ["K"] = { ":move '<-2<CR>V'[=gv", desc = "Move selected lines up" },
      },
      n = {
        ["-"] = { "/", desc = "Search forwards" },
        ["<Leader>fj"] = { function() require("flash").jump() end, desc = "Flash jump" },
        ["<Leader>fg"] = { ":Telescope live_grep glob_pattern=", desc = "Find words in file glob" },
        ["U"] = { "<cmd>redo<cr>", desc = "Redo" },
        ["<Leader>qn"] = { "<cmd>cnext<cr>", desc = "Next quickfix item" },
        ["<Leader>qp"] = { "<cmd>cprev<cr>", desc = "Previous quickfix item" },
        ["<Leader>qc"] = { "<cmd>cclose<cr>", desc = "Close quickfix window" },
        ["<Leader>qo"] = { "<cmd>copen<cr>", desc = "Open quickfix window" },
        ["<Leader>qs"] = { "<cmd>vimgrep // %<cr><cr><cmd>copen<cr><C-w>k", desc = "Send previous search's results to quickfix" },
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
        ["C"] = { '"_C' , desc = "Change without yank" },
        ["s"] = { '"_s' , desc = "Change without yank" },
        ["S"] = { '"_S' , desc = "Change without yank" },
        ["x"] = { '"_x' , desc = "Delete without yank" },
        ["X"] = { '"_X' , desc = "Delete without yank" },
        ["r"] = { '"_ciw', desc = 'Change inner word' },
        ["R"] = { '"_ciW', desc = 'Change inner Word' },
        ["<Leader>gb"] = { function() require("gitsigns").blame_line { full = true } end, desc = "View full Git blame" },
        ["<Leader>gB"] = { function() vim.cmd("GitBlameToggle") end, desc = "Toggle Git line blame" },
        ["<Leader>gD"] = { "<C-w>h<cmd>q<cr>", desc = "Close diff view" },

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
    sessions = {
      autosave = {
        last = true,
        cwd = true,
      },
      ignore = {
        dirs = {},
        filetypes = { "gitcommit", "gitrebase" },
        buftypes = {},
      },
    },
  },
}
