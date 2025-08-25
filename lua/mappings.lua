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

-- 设置 Ctrl+C 复制
-- normal 和 visual 模式都可以用
vim.keymap.set({'n', 'v'}, '<C-c>', function()
    -- 如果是可视模式，先 yank 选中的内容
    if vim.fn.mode() == 'v' or vim.fn.mode() == 'V' then
        vim.cmd('normal! "+y')
    else
        -- 普通模式复制当前行
        vim.cmd('normal! "+yy')
    end
    -- 给用户一点提示
    vim.notify("Copied to clipboard", vim.log.levels.INFO)
end, { noremap = true, silent = true })

vim.api.nvim_create_autocmd("LspAttach", {

	callback = function(event)
		-- -- 跳转
		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" }) -- 跳转到定义
		-- vim.keymap.set(
		-- 	"n",
		-- 	"gD",
		-- 	vim.lsp.buf.declaration,
		-- 	{ noremap = true, silent = true, desc = "Go to declaration" }
		-- ) -- 跳转到声明
		-- vim.keymap.set(
		-- 	"n",
		-- 	"gi",
		-- 	vim.lsp.buf.implementation,
		-- 	{ noremap = true, silent = true, desc = "Go to implementation" }
		-- ) -- 跳转到实现
		-- vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true, desc = "Go to references" }) -- 查看引用
		--
		-- -- 文档/帮助
		-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Hover" }) -- 悬浮文档
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<C-k>",
		-- 	vim.lsp.buf.signature_help,
		-- 	{ noremap = true, silent = true, desc = "Signature Help" }
		-- ) -- 签名帮助
		--
		-- -- 代码操作
		-- vim.keymap.set(
		-- 	{ "n", "v" },
		-- 	"<leader>ca",
		-- 	vim.lsp.buf.code_action,
		-- 	{ noremap = true, silent = true, desc = "Code Action" }
		-- ) -- 代码操作
		--
		-- -- 诊断 (Diagnostics)
		-- vim.keymap.set(
		-- 	"n",
		-- 	"gl",
		-- 	vim.diagnostic.open_float,
		-- 	{ noremap = true, silent = true, desc = "Show Diagnostics" }
		-- ) -- 查看诊断
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>q",
		-- 	vim.diagnostic.setloclist,
		-- 	{ noremap = true, silent = true, desc = "Show Diagnostics List" }
		-- ) -- 诊断列表
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		-- Rename the variable under your cursor.
		--  Most Language Servers support renaming across files, etc.
		map("grn", vim.lsp.buf.rename, "[R]e[n]ame")

		-- Execute a code action, usually your cursor needs to be on top of an error
		-- or a suggestion from your LSP for this to activate.
		map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })

		map("grf", vim.lsp.buf.format, "Code Format")

		-- Find references for the word under your cursor.
		map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

		-- Jump to the implementation of the word under your cursor.
		--  Useful when your language has ways of declaring types without an actual implementation.
		map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

		-- Jump to the definition of the word under your cursor.
		--  This is where a variable was first declared, or where a function is defined, etc.
		--  To jump back, press <C-t>.
		map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

		-- WARN: This is not Goto Definition, this is Goto Declaration.
		--  For example, in C this would take you to the header.
		map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		-- Fuzzy find all the symbols in your current document.
		--  Symbols are things like variables, functions, types, etc.
		map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")

		-- Fuzzy find all the symbols in your current workspace.
		--  Similar to document symbols, except searches over your entire project.
		map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")

		-- Jump to the type of the word under your cursor.
		--  Useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")

	end,
})
