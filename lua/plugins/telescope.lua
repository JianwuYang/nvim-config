return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    -- or                              , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          path_display = { "smart" }
        },
        pickers = {
          oldfiles = {
            cwd_only = true,
          },
          find_files = {
            find_command = { "fd" }
          },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fa", function()
        builtin.find_files({ find_command = { "fd", "-I" } })
      end, { desc = "Find all files (including hidden)" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope " })


      vim.api.nvim_create_user_command("Dotfiles", function()
        require("telescope.builtin").find_files({
          prompt_title = "Dotfiles",
          cwd = "~/.config/nvim", -- 这里改成你 dotfiles 的路径
          hidden = true,
        })
      end, {})
    end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").load_extension("project")
      vim.keymap.set("n", "<leader>fp", "<cmd>Telescope project<cr>", { desc = "Projects" })
    end,
  },
}
