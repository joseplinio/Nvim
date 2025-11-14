 -- Treesitter
 return {
    "nvim-treesitter/nvim-treesitter",

    lazy = false,
    build = ":TSUpdate",
    config = function()
      local config = require'nvim-treesitter.configs'.setup {
        sync_install = true,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  }
