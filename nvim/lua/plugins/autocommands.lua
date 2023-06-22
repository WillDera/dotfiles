-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = {
--     "Jaq",
--     "qf",
--     "help",
--     "man",
--     "lspinfo",
--     "spectre_panel",
--     "lir",
--     "DressingSelect",
--     "tsplayground",
--     "Markdown",
--     "",
--   },
--   callback = function()
--     vim.cmd [[
--       nnoremap <silent> <buffer> q :close<CR>
--       nnoremap <silent> <buffer> <esc> :close<CR>
--       set nobuflisted
--     ]]
--   end,
-- })

-- vim.api.nvim_create_autocmd({ "BufReadPre" }, {
--   callback = function()
--     local plugins = {
--       "vim-smoothie",
--       "vim-dadbod",
--       "vim-dadbod-ui",
--     }
--     for _, pl in ipairs(plugins) do
--       vim.cmd("silent! Lazy load " .. pl)
--     end
--     -- vim.cmd [[Lazy sync]]
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufReadPre" }, {
--   pattern = { "Cargo.toml" },
--   callback = function()
--     vim.cmd "silent! Lazy load crates.nvim"
--   end,
-- })
-- augroup vimrc
--       " Remove all vimrc autocommands
--       autocmd!
--       au BufNewFile,BufRead *.html set shiftwidth=4
--       au BufNewFile,BufRead *.html set expandtab
--     augroup END
-- <
-- This is equivalent to the following Lua code:
-- >lua
--     local mygroup = vim.api.nvim_create_augroup('vimrc', { clear = true })
--     vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
--       pattern = '*.html',
--       group = mygroup,
--       command = 'set shiftwidth=4',
--     })
--     vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
--       pattern = '*.html',
--       group = 'vimrc',  -- equivalent to group=mygroup
--       command = 'set expandtab',
--     })
local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })
vim.api.nvim_create_autocmd("BufEnter,FocusGained,InsertLeave,WinEnter", {
  group = numbertoggle,
  callback = function()
    if vim.opt.nu and vim.fn.mode() ~= "i" then
      vim.opt.rnu = true
    end
  end,
})

vim.api.nvim_create_autocmd("BufLeave,FocusLost,InsertEnter,WinLeave", {
  group = numbertoggle,
  callback = function()
    if vim.opt.nu then
      vim.opt.rnu = false
    end
  end,
})
