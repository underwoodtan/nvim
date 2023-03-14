return {
	{
		"akinsho/bufferline.nvim",
		event = "VimEnter",
		opts = {
			options = {
				--tab number
				numbers = "ordinal",
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				---@diagnostic disable-next-line: unused-local
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or "")
						s = s .. n .. sym
					end
					return s
				end,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "right",
					},
				},
			},
		},
	},
}
