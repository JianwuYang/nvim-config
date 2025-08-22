vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })

-- 普通模式下 Ctrl-s 保存
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- 插入模式下 Ctrl-s 保存（退出再进入插入）
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })

-- 可视模式下 Ctrl-s 保存（保持选区）
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>gv", { noremap = true, silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- 关闭 buffer
vim.keymap.set("n", "<leader>bd", function()
	vim.cmd("bd | b#")
end, { desc = "Close current buffer and jump to previous" })
