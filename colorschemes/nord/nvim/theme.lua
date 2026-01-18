return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    name = "nord",
    priority = 1000,

    config = function()
      vim.cmd("colorscheme nord")
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = false
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = false
      vim.g.nord_bold = false
    end
  },
}
