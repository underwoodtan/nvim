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
    event = "VeryLazy",
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
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>ghd", gs.diffthis, "Diff This")
        map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
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
    "moll/vim-bbye",
    keys = {
      { "sc", "<cmd>Bdelete<CR>", desc = "Delete buffer" },
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
      { "sa", ":Translate<CR>", "translate" }
    }
  },
  {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
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
      require("project_nvim").setup {}
    end
  },
  {
    "AckslD/nvim-neoclip.lua"
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
    keys = {
      {"gcc",desc = "comment with line mode"},
      {"gbc",desc = "comment with block mode"}
    }
  },
  {
    'lewis6991/impatient.nvim'
  },
}
