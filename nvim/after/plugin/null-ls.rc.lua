local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

-- Use null-ls as a formatting tool
local formatting = null_ls.builtins.formatting

-- Use null-ls as a diagnostics tool
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup ({
  debug = false,
  sources = {
    -- Linters
    diagnostics.flake8,
    formatting.black.with({ extra_args = { "--fast" } }),
  },
})

