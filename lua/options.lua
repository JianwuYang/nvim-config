vim.opt.expandtab = true
-- 每个 Tab 显示为 2 个空格
vim.opt.tabstop = 2

-- 自动缩进宽度为 2
vim.opt.shiftwidth = 2

-- 插入模式下按 Tab 插入 2 个空格
vim.opt.softtabstop = 2

-- 智能 Tab
vim.opt.smarttab = true

-- 支持更多的颜色
vim.opt.termguicolors = true

-- start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 显示行号
vim.wo.number = true

-- local function open_nvim_tree()
-- 	-- open the tree
-- 	require("nvim-tree.api").tree.open()
-- end
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
--
-- vim.api.nvim_create_autocmd("BufEnter", {
-- 	nested = true,
-- 	callback = function()
-- 		-- 如果只剩下一个窗口，并且是 NvimTree，则关闭 Neovim
-- 		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") then
-- 			vim.cmd("quit")
-- 		end
-- 	end,
-- })
