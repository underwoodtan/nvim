local statu, lspconfig = pcall(require, "lspconfig")
if not statu then
  vim.notify("没有找到 lspconfig")
  return
end
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig['pyright'].setup {
  on_attach = require("keybindings").mapLSP,
  capabilities = capabilities,
  flags = lsp_flags,
}
lspconfig['clangd'].setup {
  on_attach = function(client, bufnr)
    require("keybindings").mapLSP(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end,
  flags = lsp_flags,
}
lspconfig['sumneko_lua'].setup ( require("lsp.lua"))

