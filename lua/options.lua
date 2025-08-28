vim.g.mapleader = " "

vim.g.maplocalleader = " "

vim.opt.expandtab = true
-- 每个 Tab 显示为 2 个空格
vim.opt.tabstop = 2

-- 自动缩进宽度为 2
vim.opt.shiftwidth = 2

-- 插入模式下按 Tab 插入 2 个空格
vim.opt.softtabstop = 2

-- 智能 Tab
vim.opt.smarttab = true

vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = "->", trail = "·", space = "·" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- 支持更多的颜色
vim.opt.termguicolors = true

-- start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 显示行号
vim.wo.number = true

vim.diagnostic.config({
  virtual_text = true,
})

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.g.clipboard = "osc52"

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "java" },
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.expandtab = true
  end,
})

vim.o.guifont = "FiraCode Nerd Font Mono"

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
-- vim.diagnostic.config({
--   severity_sort = true,
--   float = { border = "rounded", source = "if_many" },
--   underline = { severity = vim.diagnostic.severity.ERROR },
--   signs = {
--     text = {
--       [vim.diagnostic.severity.ERROR] = "󰅚 ",
--       [vim.diagnostic.severity.WARN] = "󰀪 ",
--       [vim.diagnostic.severity.INFO] = "󰋽 ",
--       [vim.diagnostic.severity.HINT] = "󰌶 ",
--     },
--   } or {},
--   virtual_text = {
--     source = "if_many",
--     spacing = 2,
--     format = function(diagnostic)
--       local diagnostic_message = {
--         [vim.diagnostic.severity.ERROR] = diagnostic.message,
--         [vim.diagnostic.severity.WARN] = diagnostic.message,
--         [vim.diagnostic.severity.INFO] = diagnostic.message,
--         [vim.diagnostic.severity.HINT] = diagnostic.message,
--       }
--       return diagnostic_message[diagnostic.severity]
--     end,
--   },
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
  update_in_insert = true,
  float = { border = "rounded" },
})

vim.keymap.set("n", "q", "<Nop>", { noremap = true, silent = true })
