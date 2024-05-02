local status, tabline = pcall(require, "tabline")
if (not status) then return end

tabline.setup({
  show_index = true,        -- Show tab index
  show_modify = true,       -- Show buffer modification indicator
  modify_indicator = '[+]', -- Modify indicator
  no_name = '[No name]',    -- No name buffer name
})

-- Enable option to show tabline if only two or more tabs or buffers are opened
vim.o.showtabline = 1

vim.keymap.set('n', '<Tab>', '<Cmd>tabn<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>tabp<CR>', {})
vim.keymap.set('n', 'te', '<Cmd>tabnew<CR>', {})
