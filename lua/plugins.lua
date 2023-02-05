local packer = require("packer")
packer.startup(
  function(use)
    use 'wbthomason/packer.nvim'
    --colorscheme
--    use("folke/tokyonight.nvim")
    use('tiagovla/tokyodark.nvim')
--    use { "catppuccin/nvim", as = "catppuccin" }
    --basic use
    use({ 'nvim-tree/nvim-tree.lua', require = 'nvim-tree/nvim-web-devicons', cmd = { 'NvimTreeToggle' },
      config = function()
        require("plugin-config.nvim-tree")
      end })
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use({ 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("plugin-config.telescope")
      end })
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("lukas-reineke/indent-blankline.nvim")
    use { "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end }
    use({ 'ggandor/leap.nvim' })
    use({ 'nvim-lualine/lualine.nvim' })
    use {
      "folke/which-key.nvim",
      config = function()
        --vim.o.timeout = true
        --vim.o.timeoutlen = 300
        require("which-key").setup {
        }
      end
    }
    use { 'tpope/vim-surround', event = 'VimEnter' }
    use({
      'Wansmer/treesj',
      requires = { 'nvim-treesitter' },
      keys = { '<space>m', '<space>s', '<space>j' },
      config = function()
        require('treesj').setup({ --[[ your config ]] })
      end,
    })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    -------------------- START -------------------
    use({ 'glepnir/dashboard-nvim' })
    use { 'ahmedkhalf/project.nvim', config = function()
      require('plugin-config.project')
    end }
    use {'lewis6991/impatient.nvim',config = function()
      require("impatient")
    end}
    --------------------- LSP --------------------
    use({ "williamboman/mason.nvim",config = function()
      require("lsp.mason")
    end})
    use({ "williamboman/mason-lspconfig.nvim"})
    use({ "neovim/nvim-lspconfig" })
    use({ 'j-hui/fidget.nvim' })
    use { 'simrat39/symbols-outline.nvim', cmd = 'SymbolsOutline',
      config = function() require("symbols-outline").setup() end }
    use { 'simrat39/rust-tools.nvim', ft = { 'rust' }, config = function() require('lsp.rust-tools') end }
    use({ 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } })
    --------------------- DBG --------------------
    use 'mfussenegger/nvim-dap'
    use({ "rcarriga/nvim-dap-ui" })
    --------------------- CMP --------------------
    use({ "hrsh7th/nvim-cmp", config = function()
      require("plugin-config.nvim-cmp")
    end })
    -- snippet 引擎
    use({ "L3MON4D3/LuaSnip" })
    use { "rafamadriz/friendly-snippets" }
    -- 补全源
    use { 'saadparwaiz1/cmp_luasnip' }
    use { "hrsh7th/cmp-nvim-lsp" } -- { name = nvim_lsp }
    use { "hrsh7th/cmp-buffer" } -- { name = 'buffer' },
    use { "hrsh7th/cmp-path" } -- { name = 'path' }
    use { "hrsh7th/cmp-cmdline" } -- { name = 'cmdline' }
    use({ "folke/neodev.nvim", config = function()
      require("neodev").setup {}
    end })
    --Make quick fix window better
    use({ 'kevinhwang91/nvim-bqf', ft = 'qf' })
  end)

--auto install
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
