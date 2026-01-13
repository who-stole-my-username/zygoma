return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    otps = {
      flavour = "mocha",
      transparent_background = true,
    },
    config = function()
      require("catppuccin").setup()
      vim.cmd("colorscheme catppuccin")
    end,
  },
}
