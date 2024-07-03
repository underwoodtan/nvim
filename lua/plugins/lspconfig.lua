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
      local servers = { "lua_ls", "clangd", "pylsp", "zls" }
      local lspconfig = require("lspconfig")
      local keys = require("keys")
      local on_attach = function(client, bufnr)
        keys(client, bufnr)
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
      ensure_installed = {}
    }
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    event = "VeryLazy",
    opts = {
      -- a list of all tools you want to ensure are installed upon
      -- start
      ensure_installed = {
        "lua_ls",
        "clangd",
        "rust_analyzer",
        "pylsp",
        "codelldb"
      },
      auto_update = true,
      run_on_start = true,
      start_delay = 3000, -- 3 second delay
      debounce_hours = 0, -- at least 5 hours between attempts to install/update
    }
  },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()
      metals_config.on_attach = function(client, bufnr)
        -- your on_attach function
        require("keys")(client, bufnr)
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end
  },
  {
    'mrcjkb/rustaceanvim',
    dependencies = "mattn/webapi-vim",
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = function()
        local keys = require("keys")

        return {
          server = {
            on_attach = function(client, bufnr)
              -- you can also put keymaps in here
              keys(client, bufnr)
              vim.keymap.set('n', '<leader>rm', '<cmd>RustLsp expandMacro<CR>',
                { buffer = bufnr, desc = " Rust expandMacro" })
            end,
          },
        }
      end
    end,
  }
}
