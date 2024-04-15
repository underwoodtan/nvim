return {
  { 'folke/tokyonight.nvim' },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme kanagawa]])
    end,
  },
  { "kepano/flexoki-neovim" },
  { 'AlexvZyl/nordic.nvim' },
  { 'tiagovla/tokyodark.nvim', },
  { "savq/melange-nvim" }
}
