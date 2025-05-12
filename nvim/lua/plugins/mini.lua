return {
  "echasnovski/mini.nvim",
  
  config = function()
    require("mini.ai").setup({})
    require("mini.move").setup({})
    require("mini.starter").setup({})
  end,
}
