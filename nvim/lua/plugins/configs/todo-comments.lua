local status_ok, comments = pcall(require, "todo-comments")
if not status_ok then
  return
end

comments.setup()
