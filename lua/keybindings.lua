local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

--leader_key_cfg
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--Normal
-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "sa", "<cmd>Translate<CR>", opt)
-- windows 分屏快捷键
map("n", "sv", "<cmd>vsp<CR>", opt)
map("n", "sh", "<cmd>sp<CR>", opt)
-- 关闭当前
map("n", "sd", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
--窗口比例控制
map("n", "<C-Left>", "<cmd>vertical resize +2<CR>", opt)
map("n", "<C-Right>","<cmd>vertical resize -2<CR>", opt)
map("n", "<C-Up>",   "<cmd>resize +2<CR>", opt)
map("n", "<C-Down>", "<cmd>resize -2<CR>", opt)
-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
map("v", "<C-j>", "4j", opt)
map("v", "<C-k>", "4k", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

--Terminal相关
map("n", "<leader>t", ":ToggleTerm<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)

-- bufferline
map("n", "J", "", opt)
map("n", "K", "", opt)
map("n", "J", "<cmd>BufferLineCyclePrev<CR>", opt)
map("n", "K", "<cmd>BufferLineCycleNext<CR>", opt)
map("n", "sc", "<cmd>bdelete!<CR>", opt)

--leap
vim.keymap.set({ 'n', 'x', 'o' }, 'f', '<Plug>(leap-forward-to)')
vim.keymap.set({ 'n', 'x', 'o' }, 'F', '<Plug>(leap-backward-to)')
-- Mappings.
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {desc = "open lsp diagnostic info"})

--move cursor window
map("n", "<A-Left>",  "<C-w>h", opt)
map("n", "<A-Right>", "<C-w>l", opt)
map("n", "<A-Down>",  "<C-w>j", opt)
map("n", "<A-Up>",    "<C-w>k", opt)
