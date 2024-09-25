local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

-- Required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Use Packer.nvim as the plugin manager
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- VSCode-like pictograms
  use 'onsails/lspkind-nvim'

  -- LSP UI's
  use 'nvimdev/lspsaga.nvim'

  -- Inject LSP diagnostics actions, and more via Lua
  use 'jose-elias-alvarez/null-ls.nvim'

  -- More precise syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Required dependencies for some plugins
  use 'nvim-lua/plenary.nvim'

  -- A highly extendable fuzzy finder over lists
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim' -- File browser based on `telescope.nvim`

  -- LuaSnip
  use({
    "L3MON4D3/LuaSnip",
    -- Follow latest release.
    tag = "v2.*",
    run = "make install_jsregexp",
  })

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'       -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/cmp-buffer'         -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-path'           -- nvim-cmp source for filesystem paths
  use 'hrsh7th/cmp-nvim-lua'       -- nvim-cmp source for neovim Lua API
  use 'saadparwaiz1/cmp_luasnip'   -- nvim-cmp requires snippet engine

  -- File icons
  use 'nvim-tree/nvim-web-devicons'

  -- Highlighting color codes
  use 'norcalli/nvim-colorizer.lua'

  -- A minimal Tabline plugin for Neovim
  use 'crispgm/nvim-tabline'

  -- Super fast git decorations implemented purely in lua
  use 'lewis6991/gitsigns.nvim'

  -- For git blame & browse
  use 'dinhhuy258/git.nvim'

  -- Cycle + listchars
  use 'tjdevries/cyclist.vim'

  -- Library of 35+ independent Lua modules improving overall Neovim experience with minimal effort
  use { 'echasnovski/mini.nvim' }

  -- Greenlight colorscheme
  use { 'dapovich/greenlight.nvim' }

end)
