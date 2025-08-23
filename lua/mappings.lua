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

local opts = { noremap = true, silent = true }

-- 跳转
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- 跳转到定义
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- 跳转到声明
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts) -- 跳转到实现
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- 查看引用

-- 文档/帮助
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- 悬浮文档
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts) -- 签名帮助

-- 工作区
vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set("n", "<leader>wl", function()
	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)

-- 代码操作
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- 重命名
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- 代码操作
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end, opts) -- 格式化

-- 诊断 (Diagnostics)
vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts) -- 查看诊断
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- 上一个诊断
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- 下一个诊断
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts) -- 诊断列表
