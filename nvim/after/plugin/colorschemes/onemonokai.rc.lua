local status, one_monokai = pcall(require, "one_monokai")
if (not status) then return end

-- Additional settings
vim.opt.laststatus = 1

one_monokai.setup({
  colors = {
    normal = "#abb2bf",
    number = "#ce95b8",
    keyword = "#98c379",
    special = "#379aef",
    comment = "#676e7b",
    -- Overrides cyan color
    cyan = "#61afef",
    statement = "#e06c75",
    new_bg = "#22222e"
  },
  themes = function(colors)
    return {
      Normal = { fg = colors.fg, bg = colors.new_bg },
      Keyword = { fg = colors.cyan, bold = true },
      Type = { fg = colors.cyan, bold = true },
      Statement = { fg = colors.statement, bold = true },
      Function = { fg = colors.keyword, bold = true },
      Operator = { fg = colors.normal },
      Delimiter = { fg = colors.normal },
      Number = { fg = colors.number },
      Special = { fg = colors.special },
      Comment = { fg = colors.comment, italic = false },
      Float = { fg = colors.number },
      OrgAgendaDay = { fg = colors.special, italic = false },
    }
  end,
})

-- Override existing treesitter highlight group
vim.api.nvim_set_hl(0, "@parameter", { italic=false, fg="#d19a66" })
vim.api.nvim_set_hl(0, "@keyword.function", { bold = true, fg="#e06c75"})
vim.api.nvim_set_hl(0, "@keyword.return", { bold = true, fg="#e06c75"})
