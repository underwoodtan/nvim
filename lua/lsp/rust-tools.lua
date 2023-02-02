local rt = require("rust-tools")
local path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/") or ""
local codelldb_path = path .. "adapter/codelldb"
local liblldb_path = path .. "lldb/lib/liblldb.so"

rt.setup({
  server = {
    on_attach = function(client, bufnr)
      require("keybindings").mapRust(client, bufnr)
      client.server_capabilities.semanticTokensProvider = nil
    end
  },
  -- ... other configs
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(
      codelldb_path, liblldb_path)
  }
})
