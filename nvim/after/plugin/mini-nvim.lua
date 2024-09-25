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

mini_align.setup()
mini_comment.setup()
mini_starter.setup()
mini_hipatterns.setup()
