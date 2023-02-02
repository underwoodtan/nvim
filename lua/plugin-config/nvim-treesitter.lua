local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("没有找到 nvim-treesitter")
    return
end

treesitter.setup({
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = { "c", "cpp", "vim", "lua", "python", "rust" },
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- 启用增量选择模块
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },
  -- 启用代码缩进模块 (=)
  indent = {
    enable = true,
  },
})

-- telescope bug cause canot fold holp to fix in the future version
--this is a tiny fix
--pcall(
--  vim.cmd,
--[[
--augroup fold_fix
--autocmd!
--autocmd BufRead * autocmd BufWinEnter * ++once normal! zx zR
--augroup end
--]]
--)
