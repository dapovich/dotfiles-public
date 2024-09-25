local status, greenlight = pcall(require, "greenlight")
if (not status) then
  print("Error: cannot load colorscheme 'greenlight'")
end

greenlight.setup({
  italics = false,
  colors = {
    palevioletred2 = "#ee799f",
    brown4 = "#8b2323",
    pink = "#ffc0cb",
  },
  themes = function(colors)
    -- Change highlight of correspond groups
    -- @Note: the key and value will be passed respectively to "nvim_set_hl"
    return {}
  end,
})
