return {
  vim.lsp.config("pylsp", {
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            enabled = true,
            ignore = {"W391", "E305", "E302"},
            maxLineLength = 100,
            indentSize = 2,
          },
          preload = {
            enabled = false,
          },
          mccabe = {
            enabled = false,
          },
        },
      },
    },
  }),
}
