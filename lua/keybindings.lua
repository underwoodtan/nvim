local which_key = require("which-key")
which_key.register({
  v = { "vsplit" },
  h = { "split" },
  d = { "close this windows" },
  o = { "close others windows" },
  c = { "close buffer" },
  a = { "translate" }
}, { prefix = "s" })

which_key.register({
  d = { "go to definition" },
  D = { "go to declaration" },
  r = { "go to references" },
  i = { "go to implementation" }
}, { prefix = "g" })


which_key.register({
  f = { "format" },
  e = { "diagnostic open float" },
  q = { "open trouble windows" },
  d = { "open dap" },
  D = { "type definition" },
}, { prefix = "<leader>" })

which_key.register({
  w = {
    name = "workspace",
    a = "add_workspace_folder",
    r = "remove_workspace_folder",
    l = "list_workspace_folders"
  }
}, { prefix = "<leader>" })

which_key.register({
  r = {
    n = "rename"
  }
}, { prefix = "<leader>" })

which_key.register({
  c = {
    a = "code_action"
  }
}, { prefix = "<leader>" })

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }


--leader_key_cfg
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--Normal
-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "sa", ":Translate<CR>", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sd", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
--窗口比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

--Terminal相关
map("n", "<leader>t", ":ToggleTerm<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)

-- bufferline
map("n", "J", "", opt)
map("n", "K", "", opt)
map("n", "J", ":BufferLineCyclePrev<CR>", opt)
map("n", "K", ":BufferLineCycleNext<CR>", opt)
map("n", "sc", ":bdelete!<CR>", opt)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.live_grep, {})
vim.keymap.set('n', '<C-c>', builtin.commands, {})
-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "tr", ":NvimTreeToggle<CR>", opt)
--leap
vim.keymap.set({ 'n', 'x', 'o' }, 'f', '<Plug>(leap-forward-to)')
vim.keymap.set({ 'n', 'x', 'o' }, 'F', '<Plug>(leap-backward-to)')
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
map("n", "<leader>q", ":TroubleToggle<CR>", opt)


local lspmap = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'H', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set({ 'n', 'i' }, '<C-h>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

vim.keymap.set('n', '<leader>d', require("dapui").toggle, {})

return (lspmap)
