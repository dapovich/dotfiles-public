return {
  -- Autocomplete menu pop-up's
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function()
      local cmp = require("cmp")
      return {
        -- Configure snippet engine
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        -- Turn on by default autocompletion pop-up's
        completion = {
          autocomplete = false,
        },

        -- Set up mappings
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
          { name = 'buffer'},
          { name = 'path'},
        }),

        view = {
          entries = { name = 'custom', selection_order = 'near_cursor' }
        },

      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    config = function()
      local nvim_lsp = require("lspconfig")
      -- Set up completion using nvim_cmp with LSP source
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- Pyright LSP for Python
      nvim_lsp.pyright.setup({
        capabilities = capabilities,
        filetypes = { "python" },
      })

      -- Lua LSP
      nvim_lsp.lua_ls.setup({
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
        capabilities = capabilities,
      })

      --LSP C/C++ server
      nvim_lsp.clangd.setup({
        capabilites = capabilities,
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      })

      -- LSP cmake server
      nvim_lsp.cmake.setup({
        capabilities = capabilities,
      })

      -- SystemVerilog and Verilog linter and formatter
      nvim_lsp.verible.setup({
        capabilities = capabilities,
        cmd = { "verible-verilog-ls" },
        filetypes = { "systemverilog", "verilog" },
        root_dir = function()
          return vim.loop.cwd()
        end,
      })


      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)

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

      -- Enable virtual text
      vim.diagnostic.config({ virtual_text = true })

    end,
  },
}
