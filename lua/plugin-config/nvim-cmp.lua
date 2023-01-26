local cmp_status,cmp = pcall(require,"cmp")
local luasnip_status,luasnip  = pcall(require,"luasnip")
if not cmp_status then
  vim.notify("没有找到 nvim-cmp")
end
if not luasnip_status then
  vim.notify("没有找到 luasnip")
else
  require("luasnip.loaders.from_vscode").lazy_load()
end

cmp.setup({
  -- 指定 snippet 引擎
  snippet = {
    expand = function(args)
      -- For `vsnip` users.
      --vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` users.
      require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` users.
      -- vim.fn["UltiSnips#Anon"](args.body)

      -- For `snippy` users.
      -- require'snippy'.expand_snippet(args.body)
    end,
  },
  -- 补全源
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    -- For vsnip users.
    { name = "luasnip" },

    -- For luasnip users.
    -- { name = 'luasnip' },

    --For ultisnips users.
    -- { name = 'ultisnips' },

    -- -- For snippy users.
    -- { name = 'snippy' },
    { name = "buffer" },
    { name = "path" } }),

  -- 快捷键设置
  mapping = require("keybindings").cmp(cmp),
  -- 使用lspkind-nvim显示类型图标 (新增)
  formatting = require('lsp.ui')
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
