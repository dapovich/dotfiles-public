return {
  -- Greenlight colorscheme
  -- {
  --   "dapovich/greenlight.nvim",
  --   config = function()
  --     require("greenlight").setup({
  --       italics = false,
  --       themes = function(colors)
  --         return {}
  --       end,
  --     })
  --   end,
  -- },

  -- Anysphere colorscheme
  {
    "dapovich/anysphere.nvim",
    config = function()
      require("anysphere").setup({
        italics = false,
        themes = function(colors)
          return {
            Normal = { fg = colors.fg, bg = "#222220" },
            LazyButton = { fg = colors.bg, bg = "#ce95b8" },
          }
        end,
      })
    end,
  },
}
