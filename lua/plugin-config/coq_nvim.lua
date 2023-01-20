vim.g.coq_settings = {
  auto_start = true,
  ["display.icons.mappings"]= {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "塞",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
  }
}
--fix the coq cmp after .
vim.api.nvim_set_keymap('i', '.', '<cmd>lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(".<C-x><C-u><C-e>", true, false, true), "n", true)<CR>', { noremap = true })
require("coq")
