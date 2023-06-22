local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
  return
end

whichkey.register({
  S = {
    name = "Spectre",
    s = { "<cmd>lua require('spectre').open()<cr>", "open spectre" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search current word" },
    p = { "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", "Search on current file" },
  },
  d = {
    name = "Dap/DB",
    d = { "<cmd>DBUIToggle<cr>", "DBUIToggle" },
  },
  s = {
    name = "LspSaga",
    g = {
      name = "Goto",
      h = { "<cmd>Lspsaga lsp_finder<CR>", "Lsp Finder" },
      r = { "<cmd>Lspsaga rename<CR>", "Rename" },
      R = { "<cmd>Lspsaga rename ++project<CR>", "Rename Everywhere" },
      d = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
      D = { "<cmd>Lspsaga goto_definition<CR>", "Goto Definition" },
      t = { "<cmd>Lspsaga peek_type_definition<CR>", "Peek Type Def" },
      T = { "<cmd>Lspsaga goto_type_definition<CR>", "Goto Type Def" },
    },
    c = {
      name = "Code/Calls",
      a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
      i = { "<cmd>Lspsaga incoming_calls<CR>", "Incoming Calls" },
      o = { "<cmd>Lspsaga outgoing_calls<CR>", "Outgoing Calls" },
    },
    s = {
      name = "Show",
      l = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Line Diagnostics" },
      b = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "Buf Diagnostics" },
      w = { "<cmd>Lspsaga show_workspace_diagnostics<CR>", "Workspace Diagnostics" },
      c = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Cursor Diagnostics" },
    },
    e = {
      name = "Jump",
      p = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Prev Diagnostics" },
      P = {
        "<cmd>lua require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>",
        "Prev Severe Diagnostics",
      },
      n = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostics" },
      N = {
        "<cmd>lua require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>",
        "Next Severe Diagnostics",
      },
    },
    o = { "<cmd>Lspsaga outline<CR>", "Outline" },
  },
  g = {
    name = "Git",
    -- g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle(12000)<cr>", "Lazygit" },
    g = { "<cmd>LazyGit<cr>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>GitBlameToggle<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    n = { ":!git checkout -b ", "Checkout New Branch" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    f = { "<cmd>Telescope git_bcommits<cr>", "Checkout buffer commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
    G = {
      name = "Gist",
      a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
      d = { "<cmd>Gist -d<cr>", "Delete" },
      f = { "<cmd>Gist -f<cr>", "Fork" },
      g = { "<cmd>Gist -b<cr>", "Create" },
      l = { "<cmd>Gist -l<cr>", "List" },
      p = { "<cmd>Gist -b -p<cr>", "Create Private" },
    },
  },
}, { prefix = "<leader>" })

-- vim.api.nvim_set_keymap(
--   "n",
--   "<C-p>",
--   ":lua require'telescope'.extensions.project.project{}<CR>",
--   { noremap = true, silent = true }
-- )
