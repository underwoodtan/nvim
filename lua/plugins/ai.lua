return {
  {
    "jackMort/ChatGPT.nvim",
    cmd = "ChatGpt",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = ""
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
}
