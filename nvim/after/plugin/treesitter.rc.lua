local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
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
