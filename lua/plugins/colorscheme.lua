-- ~/.config/nvim/lua/plugins/colorscheme.lua
return {
  -- {
  -- 	"ellisonleao/gruvbox.nvim",
  -- 	priority = 1000, -- 确保它最先加载
  -- 	config = function()
  -- 		require("gruvbox").setup({
  -- 			contrast = "hard", -- 也可以是 "soft", "medium"
  -- 			transparent_mode = false,
  -- 		})
  -- 		vim.cmd.colorscheme("gruvbox")
  -- 	end,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({})
      vim.cmd.colorscheme("catppuccin")
    end
  }
  -- {
  -- 	"folke/tokyonight.nvim",
  -- 	lazy = false,
  -- 	priority = 1000,
  -- 	opts = {},
  -- 	config = function()
  -- 		vim.cmd.colorscheme("tokyonight")
  -- 	end,
  -- },
}
