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
        hidden_display = "all",
        indent_markers = {
          enable = true,
        },
        icons = {
          git_placement = "after",

          glyphs = {
            default = "",
            symlink = "",
            bookmark = "󰆤",
            modified = "●",
            hidden = "󰜌",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        }
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
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
