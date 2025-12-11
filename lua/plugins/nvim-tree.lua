return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        highlight_git = "all",
        highlight_diagnostics = "all",
        highlight_opened_files = "all",
        highlight_modified = "all",
        highlight_hidden = "all",
        indent_width = 1,
        group_empty = true,
        hidden_display = "simple",
        icons = {
          git_placement = "after",
        }
      },
      filters = {
        dotfiles = false,
        custom = { "^.git$" },
        exclude = { "application", ".vscode" },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
      modified = {
        enable = true,
      },
      update_focused_file = {
        enable = true,
      },
    })

    -- 推荐绑定快捷键（<leader>e 打开/关闭树）
    vim.keymap.set("n", "<c-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
  end,
}
