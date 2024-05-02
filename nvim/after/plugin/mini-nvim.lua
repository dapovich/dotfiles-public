local status_mini_align, mini_align = pcall(require, "mini.align")
if (not status_mini_align) then
  print("Error: mini.align cannot be loaded.")
  return
end

local status_mini_comment, mini_comment = pcall(require, "mini.comment")
if (not status_mini_comment) then return end

local status_mini_cursorword, mini_cursorword = pcall(require, "mini.cursorword")
if (not status_mini_cursorword) then
  print("Error: mini.cursorword cannot be loaded.")
  return
end

local status_mini_notify, mini_notify = pcall(require, "mini.notify")
if (not status_mini_notify) then
  print("Error: mini.notify cannot be loaded.")
  return
end

local status_mini_starter, mini_starter = pcall(require, "mini.starter")
if (not status_mini_starter) then
  print("Error: mini.starter cannot be loaded.")
  return
end

mini_align.setup()

mini_comment.setup()

mini_notify.setup()

mini_starter.setup()
