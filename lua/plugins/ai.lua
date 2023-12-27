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
  -- Remove the `use` here if you're using folke/lazy.nvim.
  {
    'Exafunction/codeium.vim',
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.api.nvim_set_var('codeium_disable_bindings', 1)
      vim.keymap.set('i', '<M-l>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<M-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<M-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<M-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
      vim.keymap.set('i', '<M-h>', function() return vim.fn['codeium#Complete']() end, { expr = true })
    end
  }
}
