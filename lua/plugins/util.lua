return {
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      require("leap").setup(opts)
    end,
  },
  {
    "tpope/vim-surround",
    keys = { { "cs" }, { "cS" } }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      local keymaps = {
        mode = { "n", "v" },
        ["<leader>x"] = { name = "+trouble" },
        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>g"] = { name = "+git" },
      }
      wk.register(keymaps)
    end,
  },
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd          = "Telescope",
    version      = false,
    keys         = {
      { "<C-f>", "<cmd>Telescope live_grep<CR>",  desc = "" },
      { "<C-p>", "<cmd>Telescope find_files<CR>", desc = "" },
      { "<C-c>", "<cmd>Telescope commands<CR>",   desc = "" },
    },
    config       = function(_,opts)
      require("telescope").setup(opts)
      require('telescope').load_extension('projects')
      require("telescope").load_extension("notify")
    end,
    opts         = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<a-t>"] = function(...)
              return require("trouble.providers.telescope").open_selected_with_trouble(...)
            end,
          },
          n = {
            ["q"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
      },
    }
  },
  {
    'Wansmer/treesj',
    event = "VeryLazy",
    dependencies = { 'nvim-treesitter' },
    keys = {
      { '<space>m', desc = "toggle block" },
      { '<space>s', desc = "open block" },
      { '<space>j', desc = "close block" },
    },
    opts = {}
  },
  {
    'mbbill/undotree',
    cmd = "UndotreeToggle"
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
      direction = "float"
    },
    keys = {
      { '<leader>t', '<cmd>ToggleTerm<CR>', desc = "open terminal" }
    }
  },
  {
    'voldikss/vim-translator',
    keys = {
      { "sa", "<cmd>Translate<CR>", "translate" }
    },
    config = function()
      vim.cmd([[let g:translator_default_engines=['bing'] ]])
    end
  },
  {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    'simrat39/symbols-outline.nvim',
    opts = {},
    keys = {
      { '<leader>S', '<cmd>SymbolsOutline<CR>', desc = "symbols" }
    }
  },
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require("project_nvim").setup {
        detection_methods = { "pattern" },
      }
    end
  },
  {
    "AckslD/nvim-neoclip.lua"
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
    keys = {
      { "gcc", desc = "comment with line mode" },
      { "gbc", desc = "comment with block mode" }
    }
  },
  -- session management
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end,                desc = "Don't Save Current Session" },
    },
  },
  {
    'lewis6991/impatient.nvim'
  },
  {
    "ludovicchabant/vim-gutentags",
    ft = "verilog",
  },
  {
    "nvim-neorg/neorg",
    cmd = "Neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},  -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = {      -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      }
    end,
  },
}
