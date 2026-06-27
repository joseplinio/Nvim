return {
	"nvimtools/none-ls.nvim",

	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- JavaScript / TypeScript
				null_ls.builtins.formatting.biome,

				-- null_ls.builtins to golang,
				null_ls.builtins.formatting.gopls,
			},
		})
	end,
}
