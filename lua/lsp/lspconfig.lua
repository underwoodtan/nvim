-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local keys = require("keybindings")
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
  keys(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil
  require "lsp_signature".on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
          border = "rounded"
      },
      hint_prefix = "",
  }, bufnr)
  navic.attach(client, bufnr)
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
  vim.notify("没有找到 lspconfig")
  return
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}
lspconfig['pyright'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
lspconfig['clangd'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
lspconfig['lua_ls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = require("lsp.lua"),
}
lspconfig['metals'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
