return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    keys = {
      { "<S-h>",      ":BufferLineCyclePrev<CR>",   silent = true },
      { "<S-l>",      ":BufferLineCycleNext<CR>",   silent = true },
      { "<leader>bd", ":bdelete<CR>",               silent = true },
      { "<leader>bo", ":BufferLineCloseOthers<CR>", silent = true },
      { "<leader>bp", ":BufferLinePick<CR>",        silent = true },
      { "<leader>bc", ":BufferLinePickClose<CR>",   silent = true },
    },
    config = function()
      require("bufferline").setup({
        options = {
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
              text_align = "left",
            },
            -- {
            --   filetype = "neo-tree",
            --   text = "File Explorer",
            --   text_align = "left",
            --   separator = true
            -- }
          },
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          always_show_bufferline = true,
          indicator = {
            icon = '▎',
            style = "icon"
          },

          diagnostics_indicator = function(_, _, diagnostics_dict, _)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " "
                  or (e == "warning" and " " or " ")
              s = s .. n .. sym
            end
            return s
          end
        },
      })
    end,
  },
}
