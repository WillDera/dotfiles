local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
  return
end

lspsaga.setup {
  -- INFO:
  -- finder = {
  --   max_height = 0.5,
  --   min_width = 30,
  --   force_max_height = false,
  --   keys = {
  --     jump_to = 'p',
  --     expand_or_jump = 'o',
  --     vsplit = 's',
  --     split = 'i',
  --     tabe = 't',
  --     tabnew = 'r',
  --     quit = { 'q', '<ESC>' },
  --     close_in_preview = '<ESC>',
  --   },
  -- },

  -- INFO: definition = {
  --   edit = "<C-c>o",
  --   vsplit = "<C-c>v",
  --   split = "<C-c>i",
  --   tabe = "<C-c>t",
  --   quit = "q",
  -- },

  -- INFO: rename = {
  --   quit = "<C-c>",
  --   exec = "<CR>",
  --   mark = "x",
  --   confirm = "<CR>",
  --   in_select = true,
  -- },

  -- INFO: outline = {
  --   win_position = "right",
  --   win_with = "",
  --   win_width = 30,
  --   preview_width= 0.4,
  --   show_detail = true,
  --   auto_preview = true,
  --   auto_refresh = true,
  --   auto_close = true,
  --   custom_sort = nil,
  --   keys = {
  --     expand_or_jump = 'o',
  --     quit = "q",
  --   },
  -- },

  -- INFO: callhierarchy = {
  --   show_detail = false,
  --   keys = {
  --     edit = "e",
  --     vsplit = "s",
  --     split = "i",
  --     tabe = "t",
  --     jump = "o",
  --     quit = "q",
  --     expand_collapse = "u",
  --   },
  -- },

  -- INFO: symbol_in_winbar = {
  --   enable = true,
  --   separator = " ",
  --   ignore_patterns={},
  --   hide_keyword = true,
  --   show_file = true,
  --   folder_level = 2,
  --   respect_root = false,
  --   color_mode = true,
  -- },

  -- INFO:   beacon = {
  --   enable = true,
  --   frequency = 7,
  -- },

  -- TODO:
  ui = {
    -- This option only works in Neovim 0.9
    title = true,
    -- Border type can be single, double, rounded, solid, shadow.
    border = "single",
    winblend = 0,
    expand = "",
    collapse = "",
    code_action = "💡",
    incoming = " ",
    outgoing = " ",
    hover = " ",
    kind = {},
  },

  diagnostic = {
    on_insert = false,
    on_insert_follow = false,
    insert_winblend = 0,
    show_code_action = true,
    show_source = true,
    jump_num_shortcut = true,
    max_width = 0.7,
    max_height = 1,
    max_show_width = 0.9,
    max_show_height = 1,
    text_hl_follow = false,
    border_follow = false,
    extend_relatedInformation = false,
    keys = {
      exec_action = "o",
      quit = "q",
      expand_or_jump = "<CR>",
      quit_in_show = { "q", "<ESC>" },
    },
  },
}

local keymap = vim.keymap.set

-- -- LSP finder - Find the symbol's definition
-- -- If there is no definition, it will instead be hidden
-- -- When you use an action in finder like "open vsplit",
-- -- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")

-- -- Code action
-- keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- -- Rename all occurrences of the hovered word for the entire file
-- keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- -- Rename all occurrences of the hovered word for the selected files
-- keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- -- Peek definition
-- -- You can edit the file containing the definition in the floating window
-- -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- -- It also supports tagstack
-- -- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- -- Go to definition
-- keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- -- Peek type definition
-- -- You can edit the file containing the type definition in the floating window
-- -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- -- It also supports tagstack
-- -- Use <C-t> to jump back
keymap("n", "gpt", "<cmd>Lspsaga peek_type_definition<CR>")

-- -- Go to type definition
keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")

-- -- Show line diagnostics
-- -- You can pass argument ++unfocus to
-- -- unfocus the show_line_diagnostics floating window
keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>")

-- -- Show buffer diagnostics
-- keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- -- Show workspace diagnostics
-- keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- -- Show cursor diagnostics
-- keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- -- Diagnostic jump
-- -- You can use <C-o> to jump back to your previous location
-- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- -- Diagnostic jump with filters such as only jumping to an error
-- keymap("n", "[E", function()
--   require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end)
-- keymap("n", "]E", function()
--   require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end)

-- -- Toggle outline
-- keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- -- Hover Doc
-- -- If there is no hover doc,
-- -- there will be a notification stating that
-- -- there is no information available.
-- -- To disable it just use ":Lspsaga hover_doc ++quiet"
-- -- Pressing the key twice will enter the hover window
-- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- -- If you want to keep the hover window in the top right hand corner,
-- -- you can pass the ++keep argument
-- -- Note that if you use hover with ++keep, pressing this key again will
-- -- close the hover window. If you want to jump to the hover window
-- -- you should use the wincmd command "<C-w>w"
-- keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- -- Call hierarchy
-- keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
-- keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- -- Floating terminal
-- keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
