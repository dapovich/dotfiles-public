local status, greenlight = pcall(require, "greenlight")
if (not status) then
  print("Error: cannot load colorscheme 'greenlight'")
end

greenlight.setup({
  italics = false,
})
