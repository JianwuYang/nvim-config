return {
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            -- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = false,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          lsp_doc_border = true,        -- add a border to hover docs and signature help
        },
      })

      vim.keymap.set("n", "<leader>nh", "<cmd>Noice history<CR>", { desc = "Noice history" })
      vim.keymap.set("n", "<leader>nl", "<cmd>Noice last<CR>", { desc = "Noice last message" })

      require("notify").setup({
        background_colour = "#000000",
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local notify = require("notify")
      notify.setup({
        stages = "fade_in_slide_out", -- 动画: 渐入滑出
        timeout = 3000,               -- 自动关闭时间(ms)
        background_colour = "#000000",
        render = "default",           -- 也可以 "minimal" / "compact"
        max_width = 80,
        max_height = 20,
      })
      vim.notify = notify
    end,
  },
}
