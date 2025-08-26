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

	callback = function(event)
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

		-- Diagnostics
		vim.keymap.set("n", "<leader>ld", function()
			vim.diagnostic.open_float({ source = true })
		end, { buffer = event.buf, desc = "LSP: Show Diagnostic" })

		vim.keymap.set(
			"n",
			"<leader>td",
			(function()
				local diag_status = 1 -- 1 is show; 0 is hide
				return function()
					if diag_status == 1 then
						diag_status = 0
						vim.diagnostic.config({
							underline = false,
							virtual_text = false,
							signs = false,
							update_in_insert = false,
						})
					else
						diag_status = 1
						vim.diagnostic.config({
							underline = true,
							virtual_text = true,
							signs = true,
							update_in_insert = true,
						})
					end
				end
			end)(),
			{ buffer = event.buf, desc = "LSP: Toggle diagnostics display" }
		)

		vim.api.nvim_create_user_command(
			"LspInfo",
			":checkhealth vim.lsp",
			{ desc = "Alias to `:checkhealth vim.lsp`" }
		)
		vim.api.nvim_create_user_command("LspLog", function()
			vim.cmd(string.format("tabnew %s", vim.lsp.get_log_path()))
		end, {
			desc = "Opens the Nvim LSP client log.",
		})

		-- -- diagnostic UI touches
		-- vim.diagnostic.config({
		-- 	-- virtual_lines = { current_line = true },
		-- 	virtual_text = {
		-- 		spacing = 5,
		-- 		prefix = "◍ ",
		-- 	},
		-- 	float = { severity_sort = true },
		-- 	severity_sort = true,
		-- 	signs = {
		-- 		text = {
		-- 			-- [vim.diagnostic.severity.ERROR] = '',
		-- 			[vim.diagnostic.severity.ERROR] = "",
		-- 			[vim.diagnostic.severity.WARN] = "",
		-- 			[vim.diagnostic.severity.INFO] = "",
		-- 			[vim.diagnostic.severity.HINT] = "",
		-- 		},
		-- 		numhl = {
		-- 			[vim.diagnostic.severity.ERROR] = "DiagnosticError",
		-- 			[vim.diagnostic.severity.WARN] = "DiagnosticWarning",
		-- 			[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
		-- 			[vim.diagnostic.severity.HINT] = "DiagnosticHint",
		-- 		},
		-- 	},
		-- })

		vim.lsp.inlay_hint.enable(true)
	end,
})
