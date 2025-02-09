---@type LazySpec
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      -- "hrsh7th/cmp-path",
      -- "hrsh7th/cmp-cmdline",
      -- "hrsh7th/cmp-emoji",
      -- "hrsh7th/cmp-omni",
      -- "hrsh7th/cmp-nvim-lsp-signature-help",
      -- "hrsh7th/cmp-nvim-lsp-document-symbol",
      -- "petertriho/cmp-git",
      -- "rcarriga/cmp-dap",
      -- "SergioRibera/cmp-dotenv",
      -- "Snikimonkd/cmp-go-pkgs",
      -- "David-Kunz/cmp-npm",
      -- "davidsierradz/cmp-conventionalcommits",
    },
    config = function(plugin, opts)
      require "astronvim.plugins.configs.cmp"(plugin, opts)

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
          snippet = {
              -- REQUIRED - you must specify a snippet engine
              expand = function(args)
                  -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                  require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                  -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                  -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                  -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                  -- For `mini.snippets` users:
                  -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                  -- insert({ body = args.body }) -- Insert at cursor
                  -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                  -- require("cmp.config").set_onetime({ sources = {} })
              end,
          },

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
              { name = 'buffer' },
              { name = 'luasnip' },
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

    end,
    -- opts = function(_, opts)
    -- end
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
                bg_p2 = "#1F1A1A", -- cursorline background
                bg_visual = "#662200", -- selection background

                nontext    = "#54546D", -- line numbers etc
                special    = "#54546D", -- current indentation vertical lines
                whitespace = "#24242D", -- indendation vertical lines
              }
            }
          }
        }
      })
    end
  },

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
              Info = { color = "#1d79b7" },
              Hint = { color = "#1abc9c" },
              Misc = { color = "#ffa029" },
              GitDelete = {
                text = "┆",
              },
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

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets"
    },
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })

      local config_path = vim.fn.stdpath("config")
      require("luasnip.loaders.from_lua").load({ paths = {config_path .. "/snippets"} })
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  {
    -- https://docs.astronvim.com/recipes/status/#replicate-visual-studio-code-winbar
    "rebelot/heirline.nvim",
    dependencies = {
        "f-person/git-blame.nvim",
        -- {
        --     "AstroNvim/astroui",
        --     ---@type AstroUIOpts
        --     opts = {
        --         icons = {
        --             Clock = "",
        --         },
        --     },
        -- },
    },
    opts = function(_, opts)
        local status = require("astroui.status")
        local gitblame = require('gitblame')

        opts.statusline = {
            hl = { fg = "fg", bg = "bg" },
            status.component.mode({ mode_text = { hl = { fg = "#000000"}, padding = { left = 1, right = 1 } }, }),
            status.component.git_branch(),
            status.component.git_diff(),
            status.component.diagnostics(),
            status.component.fill(),
            status.component.cmd_info(),
            status.component.fill(),
            status.component.builder({
                {
                    condition = gitblame.is_blame_text_available,
                    provider = gitblame.get_current_blame_text,
                    update = {
                        'CursorMoved',
                        'CursorMovedI',
                        'CursorHold',
                    }
                },
                hl = { fg = "#808080" },
                padding = { right = 2 }
            }),
            status.component.file_info(),
            status.component.lsp(),
            status.component.virtual_env(),
            status.component.treesitter(),
            status.component.builder({
                -- %l = current line number
                -- %L = number of lines in the buffer
                -- %c = column number
                -- %P = percentage through file of displayed window
                provider = " 󰦨 %l:%c ",
                hl = { fg = "#606060" },
             }),
            -- status.component.nav({ padding = { right = 1 } }),
            status.component.mode(),

            -- -- Create a custom component to display the time
            -- status.component.builder({
            --     {
            --         provider = function()
            --             local time = os.date("%H:%M")
            --             ---@cast time string
            --             return status.utils.stylize(time, {
            --                 icon = { kind = "Clock", padding = { left = 1, right = 1 } }, -- use our new clock icon
            --                 padding = { right = 1 }, -- pad the right side so it's not cramped
            --             })
            --         end,
            --     },
            --     update = { -- update should happen when the mode has changed as well as when the time has changed
            --         "User", -- We can use the User autocmd event space to tell the component when to update
            --         "ModeChanged",
            --         callback = vim.schedule_wrap(function(_, args)
            --             if -- update on user UpdateTime event and mode change
            --             (args.event == "User" and args.match == "UpdateTime")
            --             or (args.event == "ModeChanged" and args.match:match(".*:.*"))
            --             then
            --                 vim.cmd.redrawstatus()
            --             end
            --         end),
            --     },
            --     hl = status.hl.get_attributes("mode"), -- highlight based on mode attributes
            --     surround = { separator = "right", color = status.hl.mode_bg }, -- background highlight based on mode
            -- }),
        }

        -- -- Now that we have the component, we need a timer to emit the User UpdateTime event
        -- vim.uv.new_timer():start(
        --     (60 - tonumber(os.date("%S"))) * 1000, -- offset timer based on current seconds past the minute
        --     60000, -- update every 60 seconds
        --     vim.schedule_wrap(function()
        --         vim.api.nvim_exec_autocmds(
        --             "User",
        --             { pattern = "UpdateTime", modeline = false }
        --         )
        --     end)
        -- )

        opts.winbar = {
            -- store the current buffer number
            init = function(self)
                self.bufnr = vim.api.nvim_get_current_buf()
            end,

            fallthrough = false, -- pick the correct winbar based on condition

            -- inactive winbar
            {
                condition = function()
                    return not status.condition.is_active()
                end,
                -- show the path to the file relative to the working directory
                status.component.separated_path({
                path_func = status.provider.filename({ modify = ":.:h" }),
                }),
                -- add the file name and icon
                status.component.file_info({
                    file_icon = {
                        hl = status.hl.file_icon("winbar"),
                        padding = { left = 0 },
                    },
                    filename = {},
                    filetype = false,
                    file_modified = false,
                    file_read_only = false,
                    hl = status.hl.get_attributes("winbarnc", true),
                    surround = false,
                    update = "BufEnter",
                }),
            },

            -- active winbar
            {
                -- show the path to the file relative to the working directory
                status.component.separated_path({
                    path_func = status.provider.filename({ modify = ":.:h" }),
                }),

                -- add the file name and icon
                status.component.file_info({ -- add file_info to breadcrumbs
                    file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
                    filename = {},
                    filetype = false,
                    file_modified = false,
                    file_read_only = false,
                    hl = status.hl.get_attributes("winbar", true),
                    surround = false,
                    update = "BufEnter",
                }),

                -- show the breadcrumbs
                status.component.breadcrumbs({
                    icon = { hl = true },
                    hl = status.hl.get_attributes("winbar", true),
                    prefix = true,
                    padding = { left = 0 },
                }),
            },
        }
    end,
  },

  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
        enabled = true,
        message_template = " <summary> [<author> <date>]",
        date_format = "%Y-%m-%d",
        message_when_not_committed = "",
        display_virtual_text = 0, -- Disable virtual text, just show in heirline
    },
  }
}
