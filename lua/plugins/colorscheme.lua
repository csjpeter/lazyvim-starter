return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = true,
      terminal_colors = true,
      styles = {
        sidebars = "light",
        floats = "light",
      },
      on_highlights = function(hl, c)
        hl.Normal = { fg = "#bbbbbb" }
        hl.Comment = { fg = "#00bb00", italic = true }
        hl.String = { fg = "#cccccc", italic = false }
        hl.Constant = { fg = "#cccccc"}
        hl.Identifier = { fg = "#cccccc"}
        hl.Function = { fg = "#cccccc"}
        hl.Statement = { fg = "#cccccc"}
        hl.Type = { fg = "#cccccc", bold = false }
        hl.Keyword = { fg = "#8888ff", bold = true }
        hl.Visual = { bg = "#666600" }
        hl.WinSeparator = { fg = "#cccccc" }
        hl.FloatBorder = { fg = "#cccccc" }
        hl.Type = { fg = "#8888ff", bold = true }
        hl.Statement = { fg = "#8888ff", bold = true }
        hl.cParen = { fg = "#ff8888", bold = true }
        hl["@keyword"] = { fg = "#8888ff", bold = true }
        hl["@keyword.conditional"] = { fg = "#8888ff", bold = true }
        hl["@keyword.function"] = { fg = "#8888ff", bold = true }
        hl["@function"] = { fg = "#cccccc" }
        hl["@function.call"] = { fg = "#cccccc" }
        hl["@function.method.call"] = { fg = "#cccccc" }
        hl["@constructor"] = { fg = "#cccccc" }
        hl["@type"] = { fg = "#cccccc" }
        hl["@type.builtin"] = { fg = "#8888ff", bold = true }
        hl["@variable"] = { fg = "#cccccc" }
        hl["@variable.builtin"] = { fg = "#8888ff", bold = true }
        hl["@variable.parameter"] = { fg = "#cccccc" }
        hl["@variable.member"] = { fg = "#cccccc" }
        hl["@property"] = { fg = "#cccccc" }
        hl["@operator"] = { fg = "#88ffff" }
        hl["@punctuation.bracket"] = { fg = "#8888ff", bold = true }
        hl["@punctuation.delimiter"] = { fg = "#cccccc" }
      end,
    },
  }
}
