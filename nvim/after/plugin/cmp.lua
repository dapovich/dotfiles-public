local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'

cmp.setup({
  -- Configure snippet engine.
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  -- Turn off by default autocompletion pop up.
  -- Use autocomplete feature only with <C-Space>.
  completion = {
    autocomplete = false,
  },

  -- Set up default mappings.
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
  }),

  -- Configire sources.
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer', keyword_length = 5 },
    { name = 'nvim_lua'},
    { name = 'path'},
    { name = 'luasnip'},
    { name = 'orgmode'}
  }),

  view = {
    entries = { name = 'custom', selection_order = 'near_cursor' }
  },

  formatting = {
    format = lspkind.cmp_format({
      -- with_text = true,
      mode = "symbol_text",
      menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[LuaApi]",
        path = "[Path]",
        luasnip = "[LuaSnip]",
        latex_symbols = "[Latex]"
      }),
    }),
  },
})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
