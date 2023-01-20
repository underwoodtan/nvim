local packer = require("packer")
packer.startup(
  function(use)
    use 'wbthomason/packer.nvim'
    --colorscheme
    use("folke/tokyonight.nvim")
    use ('tiagovla/tokyodark.nvim')
    --basic use
    use ({'nvim-tree/nvim-tree.lua',requires = 'nvim-tree/nvim-web-devicons'})
    use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
    use({ 'nvim-telescope/telescope.nvim', branch = '0.1.x' , requires = {"nvim-lua/plenary.nvim" }})
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("lukas-reineke/indent-blankline.nvim")
    use {"windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end}
    use({'nvim-lualine/lualine.nvim'})
    -------------------- START -------------------
    use {'glepnir/dashboard-nvim'}
    use {'ahmedkhalf/project.nvim'}
    --------------------- LSP --------------------
    use({ "williamboman/mason.nvim" })
    use({ "williamboman/mason-lspconfig.nvim" })
    use({ "neovim/nvim-lspconfig" })
    use({ 'onsails/lspkind.nvim' })
    use 'simrat39/rust-tools.nvim'
    use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
    --------------------- DBG --------------------
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui"}
    --------------------- CMP --------------------
    use({'ms-jpq/coq_nvim', branch = 'coq'})
    use({'ms-jpq/coq.artifacts'})
    --Make quick fix window better
    use({'kevinhwang91/nvim-bqf', ft = 'qf'})

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
