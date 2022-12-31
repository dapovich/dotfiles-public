local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

-- Use null-ls as a formatting tool
-- local formatting = null_ls.builtins.formatting

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

null_ls.setup {
  sources = {
    --formatting.black.with ({
    --  extra_args = { "--fast" }
    --}),
    null_ls.builtins.diagnostics.fish
  },
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_clear_autocmds {
        -- buffer = 0 means what it will be only available for current buffer
        buffer = 0,
        group = augroup_format
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = 0,
        callback = function() vim.lsp.buf.format() end
      })
    end
  end,
}

