return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    incremental_selection = {
      enable = false, -- use textobjects
      -- disable = {"elm"},
      keymaps = {
        -- mappings for incremental selection (visual mappings)
        init_selection = "gnn", -- maps in normal mode to init the node/scope selection
        scope_incremental = "gnn", -- increment to the upper scope (as defined in locals.scm)
        node_incremental = "<TAB>", -- increment to the upper named parent
        node_decremental = "<S-TAB>", -- decrement to the previous node
      },
    },
    textobjects = {
      -- syntax-aware textobjects
      lsp_interop = {
        enable = false, -- use LSP
        peek_definition_code = { ["DF"] = "@function.outer", ["CF"] = "@class.outer" },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["√"] = "@function.outer",
          ["]["] = "@class.outer",
          ["]o"] = "@loop.*",
        },
        goto_next_end = {
          ["¬"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_previous_start = {
          ["ª"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["º"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = { "@function.outer", desc = "select inner class" },
          ["if"] = { "@function.inner", desc = "select inner function" },
          ["ac"] = { "@class.outer", desc = "select outer class" },
          ["ic"] = { "@class.inner", desc = "select inner class" },
        },
      },
    },
    ignore_install = { "help" },
    ensure_installed = {
      "lua",
      "go",
      "typescript",
      "javascript",
      "markdown",
      "json",
      "help",
      "regex",
      "markdown_inline",
      "vim",
      "yaml",
      "html",
    },
  },
}
