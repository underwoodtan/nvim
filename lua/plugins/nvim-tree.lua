return {
	{
		"nvim-tree/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
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
				-- 隐藏根目录
				hide_root_folder = false,
				-- 自定义列表中快捷键
				mappings = {
					custom_only = false,
					list = {
						-- 打开文件或文件夹
						{ key = { "<CR>", "<Right>", "l", "<2-LeftMouse>" }, action = "edit" },
						-- 分屏打开文件
						{ key = "h", action = "dir_up" },
						{ key = "<Left>", action = "dir_up" },
						{ key = "O", action = "split" },
						{ key = "o", action = "vsplit" },
						-- 显示隐藏文件
						{ key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
						{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
						-- 文件操作
						{ key = "<F5>", action = "refresh" },
					},
				},
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
		},
    keys = {
      {"tr","<cmd>NvimTreeToggle<CR>",desc = "Nvim-tree toggle"},
    }
	},
}
-- 自动关闭
--vim.cmd([[
--  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
--]])
