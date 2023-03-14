return {
  {
    'simrat39/rust-tools.nvim',
    event = { "BufRead *.rs" },
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function()
      local rt = require("rust-tools")
      local path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/") or ""
      local codelldb_path = path .. "adapter/codelldb"
      local liblldb_path = path .. "lldb/lib/liblldb.so"
      local on_attach = require("keys")
      local navic = require("nvim-navic")

      rt.setup({
        server = {
          on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            navic.attach(client, bufnr)
            client.server_capabilities.semanticTokensProvider = nil
            vim.keymap.set("n", "H", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end
        },
        -- ... other configs
        dap = {
          adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
        }
      })
    end
  }
}
