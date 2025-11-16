return {
  'nvimtools/none-ls.nvim',

  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.stylua,
        -- Python
        null_ls.builtins.formattiing.pyright,
        null_ls.builtins.diagnostics.pyright,
        -- JavaScript / Type
        null_ls.builtins.formatting.biome,
        null_ls.builtins.diagnostics.biome,



        require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
      },
    })
  end
}
