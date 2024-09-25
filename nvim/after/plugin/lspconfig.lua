local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
  return
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- *** Setup language servers *** --

-- Pyright LSP for Python
nvim_lsp.pyright.setup({
  flags = lsp_flags,
  capabilities = capabilities,
  filetypes = { "python" },
})

-- Lua LSP
nvim_lsp.lua_ls.setup({
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the 'vim' global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})

nvim_lsp.luau_lsp.setup({
  flags = lsp_flags,
  capabilities = capabilities,
})

--LSP C/C++ server
nvim_lsp.clangd.setup({
  lsp_flags = lsp_flags,
  capabilites = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

-- LSP cmake server
nvim_lsp.cmake.setup({
  lsp_flags = lsp_flags,
  capabilities = capabilities,
})

-- SystemVerilog and Verilog linter and formatter
nvim_lsp.verible.setup({
  capabilities = capabilities,
  cmd = { "verible-verilog-ls" },
  filetypes = { "systemverilog", "verilog" },
  lsp_flags = lsp_flags,
  root_dir = function()
    return vim.loop.cwd()
  end,
})

-- Veridian
local util = require("lspconfig/util")
local root_pattern = util.root_pattern("veridian.yml", ".git")

nvim_lsp.veridian.setup({
  capabilities = capabilities,
  lsp_flags = lsp_flags,
  --root_dir = function() return vim.loop.cwd() end
  root_dir = function(fname)
    local filename = util.path.is_absolute(fname) and fname or util.path.join(vim.loop.cwd(), fname)
    return root_pattern(filename) or util.path.dirname(filename)
  end,
})


-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See ':help vim.lsp.*' for documentation on any of the below functions
    -- NOTE: Commented functions realized with lspsaga.nvim
    local opts = { buffer = ev.buf }
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
    -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<space>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

-- Item icons
require("vim.lsp.protocol").CompletionItemKind = {
  "", -- Text '', -- Method
  "", -- Function
  "", -- Constructor
  "", -- Field
  "", -- Variable
  "", -- Class
  "ﰮ", -- Interface
  "", -- Module
  "", -- Property
  "", -- Unit
  "", -- Value
  "", -- Enum
  "", -- Keyword
  "﬌", -- Snippet
  "", -- Color
  "", -- File
  "", -- Reference
  "", -- Folder
  "", -- EnumMember
  "", -- Constant
  "", -- Struct
  "", -- Event
  "ﬦ", -- Operator
  "", -- TypeParameter
}

-- Use builtin LSP to customize diagnostics icons and style
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "■" },
  severity_sort = true,
})
