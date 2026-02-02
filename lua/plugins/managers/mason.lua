return { "mason-org/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"lua_ls",
				"rust_analyzer",
				"docker_compose_language_service",
				"prismals",
			},
			automatic_installation = true,
		})
	end,
}
