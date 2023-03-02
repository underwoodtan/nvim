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
})

mason_config.setup({
  -- 确保安装，根据需要填写
  ensure_installed = { "lua_ls", "clangd", "rust_analyzer", "pyright" },
})
