require "core"

local custom_init_path = vim.api.nvim_get_runtime_file("lua/custom/init.lua", false)[1]

if custom_init_path then
  dofile(custom_init_path)
end

require("core.utils").load_mappings()

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- bootstrap lazy.nvim!
if not vim.loop.fs_stat(lazypath) then
  require("core.bootstrap").gen_chadrc_template()
  require("core.bootstrap").lazy(lazypath)
end

dofile(vim.g.base46_cache .. "defaults")
vim.opt.rtp:prepend(lazypath)
require "plugins"
require "plugins.autocommands"
-- require "plugins.configs.lsp"
-- require "plugins.configs.nvterm_config"
-- require "plugins.configs.fidget"
-- require "plugins.configs.leap"
-- require "plugins.configs.todo-comments"
require "plugins.configs.git"
-- require "plugins.configs.smoothie"
-- require "plugins.configs.crates"
-- -- require "plugins.configs.dadbod"
-- -- require "vim-dadbod"
-- -- require "vim-dadbod-ui"
-- require "plugins.configs.wilder"
