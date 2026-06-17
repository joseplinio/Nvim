local setups = {
	capabilities = { ... },
	filetypes = { "go", "gomod", "gosum", "gotmpl", "gohtmltmpl", "gotexttmpl" },
	message_level = vim.lsp.protocol.MessageType.Error,
	settings = {
		gopls = {
			-- Gopls specific settings
		},
	},
	handlers = { ... },
}
