-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = require("keybindings")

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
}
require('lspconfig')['clangd'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
}
require('lspconfig')['sumneko_lua'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  settings = require("lsp.lua"),
}
