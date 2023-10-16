return {
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local function on_attach(bufnr)
        local api = require('nvim-tree.api')

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        api.config.mappings.default_on_attach(bufnr)

        -- You will need to insert "your code goes here" for any mappings with a custom action_cb
        vim.keymap.set('n', '<Right>', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'h', api.tree.change_root_to_parent, opts('Up'))
        vim.keymap.set('n', '<Left>', api.tree.change_root_to_parent, opts('Up'))
        vim.keymap.set('n', 'O', api.node.open.horizontal, opts('Open: Horizontal Split'))
        vim.keymap.set('n', 'o', api.node.open.vertical, opts('Open: Vertical Split'))
        vim.keymap.set('n', 'i', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
        vim.keymap.set('n', '.', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
        vim.keymap.set('n', '<F5>', api.tree.reload, opts('Refresh'))
      end
      require("nvim-tree").setup({
        on_attach = function(bufnr)
          on_attach(bufnr)
        end,
        -- 不显示 git 状态图标
        diagnostics = {
          enable = true,
          show_on_dirs = false,
          show_on_open_dirs = true,
          debounce_delay = 50,
          severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
          },
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        git = {
          enable = true,
        },
        -- project plugin 需要这样设置
        update_cwd = true,
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        -- 隐藏 .文件 和 node_modules 文件夹
        -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!you can modify for your intresist
        filters = {
          dotfiles = true,
          custom = { "node_modules" },
        },
        view = {
          -- 宽度
          width = 40,
          -- 也可以 'right'
          side = "right",
          -- 不显示行数
          number = false,
          relativenumber = false,
          -- 显示图标
          signcolumn = "yes",
        },
        actions = {
          open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = true,
          },
        },
        renderer = {
          highlight_git = true,
        },
      })
    end,
    keys = {
      { "tr", "<cmd>NvimTreeToggle<CR>", desc = "Nvim-tree toggle" },
    }
  },
}
-- 自动关闭
--vim.cmd([[
--  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
--]])
