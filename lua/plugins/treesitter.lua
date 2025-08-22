return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({ "rust", "lua", "java", "json" })

			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "lua", "java", "rust" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
