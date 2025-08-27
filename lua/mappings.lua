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

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {

	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		if client.server_capabilities.documentFormattingProvider then
			map("<leader>fm", vim.lsp.buf.format, "Code Format")
		end

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

		vim.lsp.inlay_hint.enable(true)
	end,
})

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},
	virtual_text = {
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})
