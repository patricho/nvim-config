---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    -- opts variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics

    -- Only insert new sources, do not replace the existing ones
    -- (If you wish to replace, use `opts.sources = {}` instead of the `list_insert_unique` function)
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.gofmt,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.prettier.with {
        name = "prettier_asp", -- Give it a distinct name if needed for logs
        filetypes = { "aspvbs" },
        extra_args = { "--parser", "html" },
      },
    })
  end,
}
