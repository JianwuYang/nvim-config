return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
		keys = {
			{ "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true },
			{ "<leader>bl", ":BufferLineCycleNext<CR>", silent = true },
			{ "<leader>bd", ":bdelete<CR>", silent = true },
			{ "<leader>bo", ":BufferLineCloseOthers<CR>", silent = true },
			{ "<leader>bp", ":BufferLinePick<CR>", silent = true },
			{ "<leader>bc", ":BufferLinePickClose<CR>", silent = true },
		},
		config = function()
			require("bufferline").setup({
				options = {
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							highlight = "Directory",
							text_align = "left",
						},
					},
					separator_style = "slant",
					always_show_bufferline = true,
				},
			})
		end,
	},
}
