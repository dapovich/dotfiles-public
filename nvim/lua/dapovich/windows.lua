-- By default, vim doesn't sync yanked text with
-- the system clipboard, and vice versa
vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
