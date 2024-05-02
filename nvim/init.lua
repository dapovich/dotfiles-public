-- Import modules from '/lua/dapovich/*.lua'
require('dapovich.base')
require('dapovich.highlights')
require('dapovich.maps')
require('dapovich.plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end
local is_mac = has "macunix"
local is_win = has "win32"
local is_unix = has "unix"

if is_mac then
  require('dapovich.macos')
end
if is_win then
  require('dapovich.windows')
end
if is_unix then
  --require('dapovich.unix')
end
