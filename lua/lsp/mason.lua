local status, mason = pcall(require, "mason")
if not status then
  vim.notify("没有找到 mason")
  return
end

local statu_cfg, mason_config = pcall(require, "mason-lspconfig")
if not statu_cfg then
  vim.notify("没有找到 mason-lspconfig")
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
mason_config.setup({
  -- 确保安装，根据需要填写
  ensure_installed = { "sumneko_lua", "clangd" },
})

-- Set up lspconfig.
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

mason_config.setup_handlers({
  ["pyright"] = function()
    require("lspconfig")["pyright"].setup {
      capabilities = capabilities,
      on_attach = require("keybindings").mapLSP
    }
  end,

  ["sumneko_lua"] = function()
    require("lsp.lua").on_setup()
  end,

  ["clangd"] = function()
    require("lspconfig")["clangd"].setup {
      capabilities = capabilities,
      on_attach = require("keybindings").mapLSP
    }
  end,
})
