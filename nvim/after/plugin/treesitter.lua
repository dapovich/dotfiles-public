local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "vim", "vimdoc", "query"},

  -- Install parsers synchronously
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have 'tree-sitter' CLI
  auto_install = false,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "javascript" },

  highlight = {
    enable = true,

    -- List of languages that will be disabled
    disable = {},

    additional_vim_regex_highlighting = false,
  },

  modules = {},
}

