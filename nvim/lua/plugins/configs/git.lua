-- vim.g.gitblame_enabled = 0

local status_ok, gitlinker = pcall(require, "gitlinker")
if not status_ok then
  return
end

local status_fine, gitblame = pcall(require, "gitblame")
if not status_fine then
  return
end

vim.g.gitblame_message_template = "<summary> • <author> • <date>"
vim.g.gitblame_date_format = "%r"

gitlinker.setup {
  opts = {
    callbacks = {
      ["git.comcast.com"] = require("gitlinker.hosts").get_github_type_url,
    },
    -- remote = 'github', -- force the use of a specific remote
    -- adds current line nr in the url for normal mode
    add_current_line_on_normal_mode = true,
    -- callback for what to do with the url
    action_callback = require("gitlinker.actions").open_in_browser,
    -- print the url after performing the action
    print_url = false,
    -- mapping to call url generation
    mappings = "<leader>gy",
  },
}
