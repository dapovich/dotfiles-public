local status, colorbuddy = pcall(require, "colorbuddy")
if (not status) then return end

colorbuddy.colorscheme('gruvbuddy')

local colors = require("colorbuddy.color").colors
local Group = require("colorbuddy.group").Group
local groups = require("colorbuddy.group").groups
local styles = require("colorbuddy.style").styles

Group.new("GoTestSuccess", colors.green, nil, styles.bold)
Group.new("GoTestFail", colors.red, nil, styles.bold)

Group.new("StatuslineError1", colors.red:light():light(), groups.Statusline)
Group.new("StatuslineError2", colors.red:light(), groups.Statusline)
Group.new("StatuslineError3", colors.red, groups.Statusline)

Group.new("WinSeparator", nil, nil)

Group.new("Type", colors.violet, groups.Type, styles.bold)
Group.new("Keyword", colors.violet, groups.Keyword, styles.bold)
Group.new("Structure", colors.violet, groups.Structure, styles.bold)

-- Transparent background
vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')
