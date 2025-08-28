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

vim.api.nvim_create_autocmd("LspAttach", {

  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    vim.keymap.set("n", "<leader>fm", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = event.buf, desc = "LSP: Format current buffer" })


    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

    -- Find references for the word under your cursor.
    map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

    -- Fuzzy find all the symbols in your current workspace.
    --  Similar to document symbols, except searches over your entire project.
    map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

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

    vim.api.nvim_create_user_command("CleanJavaWorkSpace", function()
      local classpath = vim.fn.getcwd() .. "/.classpath"
      if vim.fn.filereadable(classpath) == 1 then
        os.remove(classpath)
        vim.notify(".classpath 已删除", vim.log.levels.INFO)
      else
        vim.notify("未发现 .classpath 文件", vim.log.levels.WARN)
      end

      -- 重启 LSP（需要 nvim-lspconfig 0.8+）
      vim.lsp.stop_client(client.id)
      vim.cmd("edit") -- 重新加载当前 buffer 以触发 lsp 重启
    end, { desc = "清理Java环境" })

    vim.lsp.inlay_hint.enable(true)
  end,
})
