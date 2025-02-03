---@type LazySpec
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim"
    },
    opts = function(_, opts)
    end
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = true,
        colors = {
          palette = {
            dragonBlack0 = "none",
            dragonBlack1 = "none",
            dragonBlack2 = "none",
            dragonBlack3 = "none",
            dragonBlack4 = "none",
            dragonBlack5 = "none",
            waveBlue1 = "none",
            waveBlue2 = "none",
          },
          theme = {
            ui = {
              float = {
                bg = "none",
                bg_border = "none",
              },
              pmenu = {
                bg = "none",
                bg_sel = "none",
                bg_sbar = "none",
                bg_thumb = "none",
              },
            },
            dragon = {
              ui = {
                bg_p2 = "#1A1A20", -- cursorline background
                bg_visual = "#662200", -- selection background

                nontext    = "#54546D", -- line numbers etc
                special    = "#54546D", -- current indentation vertical lines
                whitespace = "#34344D", -- indendation vertical lines
              }
            }
          }
        }
      })
    end
  },

  -- {
  --   "sho-87/kanagawa-paper.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("kanagawa-paper").setup({
  --       transparent = true,
  --       colors = {
  --         palette = {
  --           sumiInk0 = "#16161D",
  --           sumiInk1 = "#181820",
  --           sumiInk2 = "#1a1a22",
  --           sumiInk3 = "#1F1F28",
  --           sumiInk4 = "#1A1A27",
  --           sumiInk5 = "#363646",
  --         },
  --         theme = {
  --           ui = {
  --             bg_cursorline = "#16161D",
  --
  --             float = {
  --               bg = "none",
  --             },
  --
  --             pmenu = {
  --               bg = "none",
  --               bg_sel = "none",
  --               bg_sbar = "none",
  --               bg_thumb = "none",
  --             },
  --           },
  --         },
  --       },
  --     })
  --   end
  -- },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
        width = 70,
      },
    },
  },

  {
      "petertriho/nvim-scrollbar",
      dependencies = {
        "lewis6991/gitsigns.nvim",
        "kevinhwang91/nvim-hlslens"
      },
      init = function()
        require("scrollbar").setup({
          handle = {
              color = "#444444"
          },
          marks = {
              Search = { color = "#d70000" },
              Error = { color = "#d70000" },
              Warn = { color = "#c08f48" },
              Info = { color = "#0000ff" },
              Hint = { color = "#1abc9c" },
              Misc = { color = "#ffa029" },
          },
          autocmd = {
            render = {
                "BufWinEnter",
                "TabEnter",
                "TermEnter",
                "WinEnter",
                "CmdwinLeave",
                "TextChanged",
                "VimResized",
                "WinScrolled",
                "CursorMoved",
                "CursorMovedI",
                "CursorHold",
            },
            clear = {
                "BufWinLeave",
                "TabLeave",
                "TermLeave",
                "WinLeave",
            },
          },
          throttle_ms = 500,
        })

        require('gitsigns').setup({
          require("scrollbar.handlers.gitsigns").setup()
        })

        require('hlslens').setup({
          require("scrollbar.handlers.search").setup()
        })

        require("scrollbar.handlers").register("illuminated_word_marks", function(bufnr)
          -- Get all extmarks in the buffer
          local markers = vim.api.nvim_buf_get_extmarks(bufnr, -1, 0, -1, { details = true, type = "highlight" })
          -- local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

          local marks = {}

          for _, marker in ipairs(markers) do
              local _, line, _, details = unpack(marker)

              if details.hl_group == "IlluminatedWordWrite" or details.hl_group == "IlluminatedWordRead" or details.hl_group == "IlluminatedWordText" then
                -- local text = lines[line + 1]  -- Lua is 1-based, but nvim_buf_get_lines returns 0-based
                -- print("line", line, "text", text, details.hl_group, details.hl_mode, details.sign_hl_group, details.number_hl_group, details.line_hl_group, details.cursorline_hl_group)

                table.insert(marks, {
                  line = line,
                  text = "",
                  type = "Misc",
                  level = 1,
                })
              end
          end

          -- vim.print(vim.inspect(marks))

          return marks
        end)
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

  -- {
  --   "HiPhish/rainbow-delimiters.nvim",
  --   event = "BufEnter",
  -- },

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
