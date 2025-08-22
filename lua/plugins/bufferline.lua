return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
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

			vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
			vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")
		end,
	},
}
