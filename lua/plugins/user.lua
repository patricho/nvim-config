-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  {
    "xiyaowong/transparent.nvim"
  },

  {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa-paper").setup({
        transparent = true,
        colors = {
          palette = {
            sumiInk0 = "#16161D",
            sumiInk1 = "#181820",
            sumiInk2 = "#1a1a22",
            sumiInk3 = "#1F1F28",
            sumiInk4 = "#1A1A27",
            sumiInk5 = "#363646",
          },
          theme = {
            ui = {
              bg_cursorline = "#16161D",

              float = {
                bg = "none",
              },

              pmenu = {
                bg = "none",
                bg_sel = "none",
                bg_sbar = "none",
                bg_thumb = "none",
              },
            },
          },
        },
      })
    end
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
        width = 60,
      },
    },
  },

  ---@module "neominimap.config.meta"
  {
      "Isrothy/neominimap.nvim",
      version = "v3.*.*",
      enabled = true,
      keys = {
          { "<leader>nm", "<cmd>Neominimap toggle<cr>", desc = "Toggle global minimap" },
          -- { "<leader>no", "<cmd>Neominimap on<cr>", desc = "Enable global minimap" },
          -- { "<leader>nc", "<cmd>Neominimap off<cr>", desc = "Disable global minimap" },
          -- { "<leader>nr", "<cmd>Neominimap refresh<cr>", desc = "Refresh global minimap" },
          --
          -- -- Window-Specific Minimap Controls
          -- { "<leader>nwt", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
          -- { "<leader>nwr", "<cmd>Neominimap winRefresh<cr>", desc = "Refresh minimap for current window" },
          -- { "<leader>nwo", "<cmd>Neominimap winOn<cr>", desc = "Enable minimap for current window" },
          -- { "<leader>nwc", "<cmd>Neominimap winOff<cr>", desc = "Disable minimap for current window" },
          --
          -- -- Tab-Specific Minimap Controls
          -- { "<leader>ntt", "<cmd>Neominimap tabToggle<cr>", desc = "Toggle minimap for current tab" },
          -- { "<leader>ntr", "<cmd>Neominimap tabRefresh<cr>", desc = "Refresh minimap for current tab" },
          -- { "<leader>nto", "<cmd>Neominimap tabOn<cr>", desc = "Enable minimap for current tab" },
          -- { "<leader>ntc", "<cmd>Neominimap tabOff<cr>", desc = "Disable minimap for current tab" },
          --
          -- -- Buffer-Specific Minimap Controls
          -- { "<leader>nbt", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
          -- { "<leader>nbr", "<cmd>Neominimap bufRefresh<cr>", desc = "Refresh minimap for current buffer" },
          -- { "<leader>nbo", "<cmd>Neominimap bufOn<cr>", desc = "Enable minimap for current buffer" },
          -- { "<leader>nbc", "<cmd>Neominimap bufOff<cr>", desc = "Disable minimap for current buffer" },
          --
          -- ---Focus Controls
          -- { "<leader>nf", "<cmd>Neominimap focus<cr>", desc = "Focus on minimap" },
          -- { "<leader>nu", "<cmd>Neominimap unfocus<cr>", desc = "Unfocus minimap" },
          -- { "<leader>ns", "<cmd>Neominimap toggleFocus<cr>", desc = "Switch focus on minimap" },
      },
      init = function()
          -- -- The following options are recommended when layout == "float"
          -- vim.opt.wrap = false
          -- vim.opt.sidescrolloff = 36 -- Set a large value
          --
          --- Put your configuration here
          ---@type Neominimap.UserConfig
          vim.g.neominimap = {
              auto_enable = true,
          }

          require('neominimap').on()
      end,
  },

  {
      "ray-x/go.nvim",
      dependencies = { -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/nvim-treesitter-textobjects",
      },
      config = function()
        require("go").setup {
          lsp_inlay_hints = {
            enable = true,
            show_variable_name = true,
          },
        }
      end,
      event = { "CmdlineEnter" },
      ft = { "go", "gomod" },
      -- build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufEnter",
  },

  -- -- == Examples of Adding Plugins ==

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },

  -- -- == Examples of Overriding Plugins ==

  -- -- customize alpha options
  -- {
  --   "goolord/alpha-nvim",
  --   opts = function(_, opts)
  --     -- customize the dashboard header
  --     opts.section.header.val = {
  --       " █████  ███████ ████████ ██████   ██████",
  --       "██   ██ ██         ██    ██   ██ ██    ██",
  --       "███████ ███████    ██    ██████  ██    ██",
  --       "██   ██      ██    ██    ██   ██ ██    ██",
  --       "██   ██ ███████    ██    ██   ██  ██████",
  --       " ",
  --       "    ███    ██ ██    ██ ██ ███    ███",
  --       "    ████   ██ ██    ██ ██ ████  ████",
  --       "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
  --       "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
  --       "    ██   ████   ████   ██ ██      ██",
  --     }
  --     return opts
  --   end,
  -- },

  -- -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },

  -- -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },

  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
}
