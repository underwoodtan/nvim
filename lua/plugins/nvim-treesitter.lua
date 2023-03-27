return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		---@type TSConfig
		opts = {
			ensure_installed = { "c", "cpp", "vim", "lua", "python", "rust", "scala", "markdown" },
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
		},
		---@param opts TSConfig
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
