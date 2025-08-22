vim.opt.expandtab = true
-- 每个 Tab 显示为 2 个空格
vim.opt.tabstop = 2

-- 自动缩进宽度为 2
vim.opt.shiftwidth = 2

-- 插入模式下按 Tab 插入 2 个空格
vim.opt.softtabstop = 2

-- 智能 Tab
vim.opt.smarttab = true

-- start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "java", "rust" },
	callback = function()
		vim.treesitter.start()
	end,
})

local function open_nvim_tree()

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })


