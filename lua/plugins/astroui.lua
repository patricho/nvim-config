-- Configuration documentation can be found with `:h astroui`

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- colorscheme = "kanagawa-paper-ink",
    -- colorscheme = "gruvbox-material",
    colorscheme = "jellybeans-mono",
    -- colorscheme = "jellybeans-muted",
    -- colorscheme = "mapledark",

    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Backgrounds
        CursorLine = { bg = "#1f1a18" },
        Visual = { bg = "#662200" },

        -- UI elements
        LineNr = { fg = "#4a4745" },
        NonText = { fg = "#4a4745" },
        FloatBorder = { fg = "#494644" },
        NormalFloat = { bg = "none" },

        -- Indentation
        IndentBlanklineChar = { fg = "#343230" },
        IndentBlanklineContextChar = { fg = "#676664" },
        IblIndent = { fg = "#343230" },
        IblScope = { fg = "#676664" },

        -- Syntax
        Comment = { fg = "#666362", italic = true },
        Operator = { fg = "#7a7775" },
        Delimiter = { fg = "#7a7775" },
        Special = { fg = "#7a7775" },
        ["@punctuation.bracket"] = { fg = "#7a7775" },
        ["@punctuation.delimiter"] = { fg = "#7a7775" },
      },
      ["gruvbox-material"] = {
        Orange = { fg = "#7a7775" },
      },
      jellybeans = {
        Special = { fg = "#c3a076" },
        Keyword = { fg = "#9a9775" },
        Include = { fg = "#bbbbbb", italic = true },
        Function = { fg = "#7a8aa6", bold = false },
        ["@function"] = { fg = "#7a8aa6", bold = false },
        ["@function.call"] = { fg = "#7a8aa6", bold = false },
      },
    },

    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
