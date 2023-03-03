local packer = require("packer")
packer.startup(
  function(use)
    use 'wbthomason/packer.nvim'
    --colorscheme
    use('tiagovla/tokyodark.nvim')
    use "EdenEast/nightfox.nvim" -- Packer
    --use("folke/tokyonight.nvim")
    --use { "catppuccin/nvim", as = "catppuccin" }
    --basic use
    use({ 'nvim-tree/nvim-tree.lua', require = 'nvim-tree/nvim-web-devicons' })
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use({ 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { "nvim-lua/plenary.nvim" } })
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("lukas-reineke/indent-blankline.nvim")
    use { "windwp/nvim-autopairs" }
    use({ 'ggandor/leap.nvim' })
    use({ 'nvim-lualine/lualine.nvim' })
    use {"folke/which-key.nvim"}
    use { 'tpope/vim-surround', event = 'VimEnter' }
    use({ 'Wansmer/treesj', requires = { 'nvim-treesitter' },
      keys = { '<space>m', '<space>s', '<space>j' },
      config = function() require('treesj').setup({ --[[ your config ]] }) end, })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use { 'lewis6991/gitsigns.nvim' }
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { "akinsho/toggleterm.nvim", tag = '*' }
    use 'mbbill/undotree'
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end }
    use { "AckslD/nvim-neoclip.lua", config = function() require('neoclip').setup() end }
    use {'rcarriga/nvim-notify'}
    use 'voldikss/vim-translator'
    -------------------- START -------------------
    use({ 'glepnir/dashboard-nvim' })
    use { 'ahmedkhalf/project.nvim' }
    use { 'lewis6991/impatient.nvim', config = function()
      require("impatient")
    end }
    --------------------- LSP --------------------
    use 'RRethy/vim-illuminate'
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    use({ "neovim/nvim-lspconfig" })
    use { "SmiteshP/nvim-navic" }
    use { "ray-x/lsp_signature.nvim" }
    use { "folke/trouble.nvim", requires = "nvim-tree/nvim-web-devicons"}
    use({ 'j-hui/fidget.nvim' })
    use { 'simrat39/symbols-outline.nvim', cmd = 'SymbolsOutline',
      config = function() require("symbols-outline").setup() end }
    use { 'simrat39/rust-tools.nvim' }
    use({ 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" } })
    use { 'saecki/crates.nvim', event = { "BufRead Cargo.toml" },config = function() require('crates').setup() end}
    --------------------- DBG --------------------
    use 'mfussenegger/nvim-dap'
    use({ "rcarriga/nvim-dap-ui" })
    --------------------- CMP --------------------
    use({ "hrsh7th/nvim-cmp" })
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
