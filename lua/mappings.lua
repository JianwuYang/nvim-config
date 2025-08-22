vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })

vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })

vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>")

-- 关闭 buffer
vim.keymap.set("n", "<leader>bd", function()
	vim.cmd("bd | b#")
end, { desc = "Close current buffer and jump to previous" })

vim.keymap.set("n", "<leader>fm", function()
	require("conform").format({ async = true })
end)


local Terminal  = require('toggleterm.terminal').Terminal

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
