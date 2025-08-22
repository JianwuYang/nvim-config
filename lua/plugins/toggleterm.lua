return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 15,
				open_mapping = [[<c-\>]],
				shade_terminals = true, -- 加点背景阴影
				start_in_insert = true, -- 打开时直接进入 insert 模式
				insert_mappings = true, -- 允许在 insert 模式下用快捷键
				direction = "horizontal", -- 方向: horizontal / vertical / float / tab
				close_on_exit = true, -- 进程退出时自动关闭
			})

			local Terminal = require("toggleterm.terminal").Terminal

			-- 创建一个专用 lazygit 终端
			local lazygit = Terminal:new({
				cmd = "lazygit",
				hidden = true,
				direction = "float", -- 浮动窗口
				close_on_exit = true,
				float_opts = {
					border = "curved", -- 窗口边框
				},
			})

			-- 切换 lazygit 终端
			vim.keymap.set("n", "<leader>lg", function()
				lazygit:toggle()
			end, { desc = "Toggle lazygit" })

			vim.keymap.set(
				"n",
				"<leader>tf",
				"<cmd>ToggleTerm direction=float<CR>",
				{ desc = "Toggle floating terminal" }
			)
		end,
	},
}
