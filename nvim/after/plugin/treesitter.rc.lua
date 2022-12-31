local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'},
    disable = {},
  },
  ensure_installed = {
    "c",
    "fish",
    "yaml",
    "vim",
    "python",
    "cpp",
    "cmake",
    "json",
    "json5"
  },
  autotag = {
    enable = true,
  },
}

