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
  ensure_installed = {"sumneko_lua","clangd"},
})


mason_config.setup_handlers ({

  ["sumneko_lua"] = function()
    require("lsp.lua").on_setup()
  end,

  ["clangd"] = function()
    require("lspconfig")["clangd"].setup {}
  end,
})
