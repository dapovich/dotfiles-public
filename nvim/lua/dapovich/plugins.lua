local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

-- Required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig' -- LSP
  use 'onsails/lspkind-nvim' -- VSCode-like pictograms
  use 'glepnir/lspsaga.nvim' -- LSP UI's
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua

  -- More precise syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'nvim-treesitter/playground'
  use {'nvim-orgmode/orgmode'}

  use 'nvim-lua/plenary.nvim' -- Required dependencies
  use 'nvim-telescope/telescope.nvim' -- A highly extendable fuzzy finder over lists
  use 'nvim-telescope/telescope-file-browser.nvim' -- File browser based on `telescope.nvim`

  use 'hrsh7th/nvim-cmp' -- Completion
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP   
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-path' -- nvim-cmp source for filesystem paths
  use 'hrsh7th/cmp-nvim-lua' -- nvim-cmp source for neovim Lua API
  use 'saadparwaiz1/cmp_luasnip' -- nvim-cmp requires snippet engine

  use 'kyazdani42/nvim-web-devicons' -- File icons

  -- Additional stuff
  use 'windwp/nvim-autopairs' -- A super powerful autopair plugin
  use 'windwp/nvim-ts-autotag' -- Use treesitter to autoclose and autorename html tag

  use 'norcalli/nvim-colorizer.lua' -- Highlighting color codes 

  use 'crispgm/nvim-tabline' -- A minimal Tabline plugin for Neovim

  -- Preview markdown on modern browser with synchronised scrolling and flexible configuration
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use 'lewis6991/gitsigns.nvim' -- Super fast git decorations implemented purely in lua
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  use 'numToStr/Comment.nvim' -- Plugin for comment your code

  -- Running tests with py.test
  use 'alfredodeza/pytest.vim'

  -- Neosolarized colorscheme
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }

  -- Use one-monokai colorscheme
  use 'cpea2506/one_monokai.nvim'

  -- Gruvbuddy colorscheme
  use {
    'tjdevries/gruvbuddy.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }

  use 'nvim-lualine/lualine.nvim' -- Statusline

end)
