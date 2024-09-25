local status_mini_align, mini_align = pcall(require, "mini.align")
if (not status_mini_align) then
  print("Error: mini.align cannot be loaded.")
  return
end

local status_mini_comment, mini_comment = pcall(require, "mini.comment")
if (not status_mini_comment) then
  print("Error: mini.comment cannot be loaded.")
  return
end

local status_mini_starter, mini_starter = pcall(require, "mini.starter")
if (not status_mini_starter) then
  print("Error: mini.starter cannot be loaded.")
  return
end

local status_mini_hipatterns, mini_hipatterns = pcall(require, "mini.hipatterns")
if (not status_mini_hipatterns) then
  print("Error: mini.hipatterns cannot be loaded.")
  return
end

local status_mini_ai, mini_ai = pcall(require, "mini.ai")
if (not status_mini_ai) then
  print("Error: mini.ai cannot be loaded.")
  return
end

-- Use default config.
mini_ai.setup()

-- Use default config.
mini_align.setup()

-- Use default config.
mini_comment.setup()

-- Use default config.
mini_starter.setup()

-- Use default config.
mini_hipatterns.setup({
  highlighters = {
    -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme'},
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack' },
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo' },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote' },

    -- Highlight hex color strings ('#rrggbb') using that color
    hex_color = mini_hipatterns.gen_highlighter.hex_color(),
  },
})
