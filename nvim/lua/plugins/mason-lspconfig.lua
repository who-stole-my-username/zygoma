return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    enabled = true,
    opts = {
      ensure_installed = {
        "lua_ls",
        "vimls",
        "pylsp",
        "clangd",
        "bashls",
        --"java_language_server",
      },
      automatic_enable = true,

      --automatic_enable = {
        --    "lua_ls",
        --   exclude {
          --   "rust-analyzer",
          --   },
          --},

    },
  },
}
