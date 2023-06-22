local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

null_ls.setup {
  sources = {
    null_ls.builtins.code_actions.refactoring,
    null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    -- null_ls.builtins.diagnostics.solhint.with {
    --   command = "/home/will/.local/share/nvim/mason/bin/solhint",
    -- },
    null_ls.builtins.completion.spell,
    null_ls.builtins.completion.luasnip,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.prettierd,
    -- null_ls.builtins.formatting.autoflake,
    -- null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.black,
    -- null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.forge_fmt,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- require("null-ls").setup({
--     -- you can reuse a shared lspconfig on_attach callback here
--     on_attach = function(client, bufnr)
--  if client.supports_method("textDocument/formatting") then
--             vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--             vim.api.nvim_create_autocmd("BufWritePre", {
--                 group = augroup,
--                 buffer = bufnr,
--                 callback = function()
--                     -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--                     vim.lsp.buf.format({ bufnr = bufnr })
--                 end,
--             })
--         end
--     end,
-- })
