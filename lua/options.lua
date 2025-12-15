-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.o.list = true
vim.opt.listchars = { tab = "->", trail = "·", space = "·" }

-- Show which line your cursor is on
vim.o.cursorline = true


vim.opt.expandtab = true
-- 每个 Tab 显示为 2 个空格
vim.opt.tabstop = 2

-- 自动缩进宽度为 2
vim.opt.shiftwidth = 2

-- 插入模式下按 Tab 插入 2 个空格
vim.opt.softtabstop = 2


-- 显示行号
vim.wo.number = true

vim.g.clipboard = "osc52"


vim.api.nvim_create_autocmd("FileType", {
  pattern = { "java" },
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.expandtab = true
  end,
})
