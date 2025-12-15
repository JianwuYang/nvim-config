vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })


vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    vim.keymap.set("n", "<leader>fm", function()
      vim.lsp.buf.format({ async = true })
      vim.notify("格式化完成", vim.log.levels.INFO)
    end, { buffer = event.buf, desc = "LSP: Format current buffer" })

    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

    map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

    map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

    map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

    map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

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

    vim.lsp.inlay_hint.enable(true)
  end,
})
