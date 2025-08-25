return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt" },
					-- java = { "google-java-format" },
				},
			})
			vim.keymap.set("n", "<leader>fm", function()
				require("conform").format({ async = true })
			end, { desc = "Code format" })
		end,
	},
}
