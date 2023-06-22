-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require "lspconfig"

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "solidity_ls_nomicfoundation" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig["solidity_ls_nomicfoundation"].setup{
--   on_attach = function(client, bufnr)
--     if client.supports_method "textDocument/formatting" then
--       vim.api.nvim_command "autocmd! BufWritePre <buffer> lua vim.lsp.buf.format({ buffer = bufnr })"
--     end
--   end,
--
-- }
