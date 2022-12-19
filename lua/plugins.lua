local packer = require("packer")
packer.startup(
  function(use)
    -- Packer can handl it self
    use 'wbthomason/packer.nvim'
    -- my plugins
    -- tokyonight
    use("folke/tokyonight.nvim")
    --nvim tree
    use ({
      'nvim-tree/nvim-tree.lua',
      requires = 'nvim-tree/nvim-web-devicons'})
    -- bufferline
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    -- lualine
    use {'nvim-lualine/lualine.nvim',requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    use("arkav/lualine-lsp-progress")
    -- telescope
    use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' , requires = { "nvim-lua/plenary.nvim" } }
    -- dashboard-nvim 
    use("glepnir/dashboard-nvim")
    -- project
    use("ahmedkhalf/project.nvim")
    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    --------------------- LSP --------------------
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -- ui (新增)
    use("onsails/lspkind-nvim")
    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")
    --scala lsp metals
    use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
    --use bqf
    use {'kevinhwang91/nvim-bqf', ft = 'qf'}
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
