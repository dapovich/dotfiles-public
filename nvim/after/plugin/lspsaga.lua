local status, saga = pcall(require, 'lspsaga')
if (not status) then
  print("Lspsaga isn't loaded.")
  return
end


saga.setup({

  ui = {
    border = 'rounded',
    code_action = ''
  },
  symbol_in_winbar = {
    enable = false,
  },
  lighbulb = {
    enable = false,
    sign = false,
    virtual_text = false,
  },
  code_action_prompt = {
    enable = true,
  },
  diagnostics = {
    show_code_action = true,
  },
})

local diagnostic = require("lspsaga.diagnostic")
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')
vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>')
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>')
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>')
vim.keymap.set('n', 'gt', '<Cmd>Lspsaga goto_type_definition<CR>')
vim.keymap.set('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>')
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>')

-- Code action
vim.keymap.set({ "n", "v"}, '<leader>ca', '<Cmd>Lspsaga code_action<CR>')
