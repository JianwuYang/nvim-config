vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })

-- 普通模式下 Ctrl-s 保存
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- 插入模式下 Ctrl-s 保存（退出再进入插入）
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

-- 可视模式下 Ctrl-s 保存（保持选区）
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>gv", { noremap = true, silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- 切换相对行号
vim.keymap.set("n", "<leader>rn", function()
	vim.wo.relativenumber = not vim.wo.relativenumber
end)

vim.api.nvim_create_autocmd("LspAttach", {

	callback = function()
		-- 跳转
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" }) -- 跳转到定义
		vim.keymap.set(
			"n",
			"gD",
			vim.lsp.buf.declaration,
			{ noremap = true, silent = true, desc = "Go to declaration" }
		) -- 跳转到声明
		vim.keymap.set(
			"n",
			"gi",
			vim.lsp.buf.implementation,
			{ noremap = true, silent = true, desc = "Go to implementation" }
		) -- 跳转到实现
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true, desc = "Go to references" }) -- 查看引用

		-- 文档/帮助
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Hover" }) -- 悬浮文档
		vim.keymap.set(
			"n",
			"<C-k>",
			vim.lsp.buf.signature_help,
			{ noremap = true, silent = true, desc = "Signature Help" }
		) -- 签名帮助

		-- 代码操作
		vim.keymap.set(
			{ "n", "v" },
			"<leader>ca",
			vim.lsp.buf.code_action,
			{ noremap = true, silent = true, desc = "Code Action" }
		) -- 代码操作

		-- 诊断 (Diagnostics)
		vim.keymap.set(
			"n",
			"gl",
			vim.diagnostic.open_float,
			{ noremap = true, silent = true, desc = "Show Diagnostics" }
		) -- 查看诊断
		vim.keymap.set(
			"n",
			"<leader>q",
			vim.diagnostic.setloclist,
			{ noremap = true, silent = true, desc = "Show Diagnostics List" }
		) -- 诊断列表
	end,
})
