return {
  vim.lsp.config('lua_ls', {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if path ~= vim.fn.stdpath('config') and
          (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
          return
        end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = {
            'lua/?.lua',
            'lua/?/init.lua',
          },
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
            -- Additional paths can be added here if needed
          },
        },
      })
    end,
    settings = {
      Lua = {
        completion = {
          enable = true,
          callSnippet = "Both",
          displayContext = 3,
          keywordSnippet = "Both",
          postfix = "@",
        },
        diagnostics = {
          enable = true,
          globals = {
            "vim"
          },
        },
        hint = {
          enable = true,
          arrayIndex = "Auto",
          await = true,
          semicolon = "All",
        },
        hover = {
          enable = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })
}
