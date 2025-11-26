return {
  'nvimtools/none-ls.nvim',

  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,

        -- Python (null-ls NÃO tem pyright)
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,

        -- JavaScript / TypeScript
        null_ls.builtins.formatting.biome,
        -- null_ls.builtins.diagnostics.biome,

      },
    })
  end
}
