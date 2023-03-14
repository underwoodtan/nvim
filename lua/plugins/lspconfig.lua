return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim",  opts = { experimental = { pathStrict = true } } },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp"
    },
    ---@class PluginLspOpts
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
    },
    ---@param opts PluginLspOpts
    config = function(_, opts)
      local servers = { "lua_ls", "clangd", "pyright" }
      local lspconfig = require("lspconfig")
      local navic = require("nvim-navic")
      local keys = require("keys")
      local on_attach = function(client, bufnr)
        keys(client, bufnr)
        navic.attach(client, bufnr)
      end
      -- diagnostics
      for name, icon in pairs(require("icons").diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end
      vim.diagnostic.config(opts.diagnostics)

      for _, server in ipairs(servers) do
        lspconfig[server].setup {
          on_attach = on_attach,
        }
      end
    end,
  },

  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = "VeryLazy",
    opts = {
      ensure_installed = { "lua_ls", "clangd", "rust_analyzer", "pyright" }
    }
  },
}
