return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	settings = {
		["rust-analyzer"] = {
			-- diagnostics = {
			-- 	enable = false,
			-- },
			check = {
				command = "clippy",
			},
		},
	},
}
