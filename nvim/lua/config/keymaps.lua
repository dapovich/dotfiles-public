local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- New tab
keymap.set("n", "te", ":tabedit<CR>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Terminal exit with ESC
vim.cmd([[
  tnoremap <Esc> <C-\><C-n>
]])

-- Formatting current buffer with formatting tools provided by null-ls
keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>")

-- Search with <C-s> keymap.
keymap.set("n", "<C-s>", "/")

-- Create a vertical splitted window
keymap.set("n", "<C-x>3", ":vsplit<cr>")

-- Create a horizontal splitted window
keymap.set("n", "<C-x>2", ":split<cr>")

-- Close all others windows except the current window
keymap.set("n", "<C-x>1", ":only<cr>")

-- Close the current window
keymap.set("n", "<C-x>q", ":q<cr>")

-- Move to the next available window
keymap.set("n", "<C-x>o", "<C-w>w")

-- Choose that buffer is have to be deleted
keymap.set("n", "<C-x>k", ":bdelete ")
