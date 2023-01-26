
local metals_config = require("metals").bare_config()
--local api = vim.api
--local cmd = vim.cmd
--local map = vim.keymap.set
vim.opt_global.shortmess:remove("F")
---It's highly recommended to set your `statusBarProvider` to `on`. This
---enables `metals/status` and also other helpful messages that are shown to you.
metals_config.init_options.statusBarProvider = "on"
metals_config.settings = {
  serverVersion = "latest.snapshot",
  showInferredType = true,
  showImplicitArguments = true,
  showImplicitConversionsAndClasses = true,
  superMethodLensesEnabled = true
}
metals_config.on_attach = require("keybindings").mapLSP
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
-- Defaults
metals_config.tvp = {
  panel_width = 40,
  panel_alignment = "left",
  toggle_node_mapping = "<CR>",
  node_command_mapping = "r",
  collapsed_sign = "▸",
  expanded_sign = "▾",
  icons = {
    enabled = false,
    symbols = {
      object = "",
      trait = "",
      class = "ﭰ",
      interface = "",
      val = "",
      var = "",
      method = "ﬦ",
      enum = "",
      field = "",
      package = "",
    },
  },
}
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach({
    })
  end,
  group = nvim_metals_group,
})
