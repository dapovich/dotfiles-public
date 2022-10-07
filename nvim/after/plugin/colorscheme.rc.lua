local status, one_monokai = pcall(require, "one_monokai")
if (not status) then return end

-- Additional settings
vim.opt.laststatus = 0

one_monokai.setup({
  colors = {
    normal = "#abb2bf",
    number = "#ce95b8",
    keyword = "#98c379",
    special = "#379aef",
    comment = "#676e7b",
  },
  themes = function(colors)
    return {
      Operator = { fg = colors.normal },
      Delimiter = { fg = colors.normal },
      Number = { fg = colors.number },
      Special = { fg = colors.special },
      Comment = { fg = colors.comment, italic = false },
    }
  end,
})
