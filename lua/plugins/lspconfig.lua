return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf",                                config = true },
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
      local servers = { "lua_ls", "clangd", "pyright", "zls" }
      local lspconfig = require("lspconfig")
      local navic = require("nvim-navic")
      local inlayhint = require("lsp-inlayhints")
      local keys = require("keys")
      local on_attach = function(client, bufnr)
        keys(client, bufnr)
        navic.attach(client, bufnr)
        inlayhint.on_attach(client, bufnr, false)
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
    event = "VeryLazy",
    opts = {
      ensure_installed = { "lua_ls", "clangd", "rust_analyzer", "pyright" }
    }
  },
  {
    'scalameta/nvim-metals',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local metals_config = require("metals").bare_config()
      metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
      }
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- Autocmd that will actually be in charging of starting the whole thing
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buffer = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local keys = require("keys")
          local navic = require("nvim-navic")
          navic.attach(client, buffer)
          keys(client, buffer)
        end,
      })
    end,
  },
}
