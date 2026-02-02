return {
	vim.lsp.config("prismals", {
		cmd = { "prisma-language-server", "--stdio" },
		filetypes = { "prisma" },
		root_markers = { "schema.prisma", "package.json", ".git" },
		settings = {
			prisma = {
				prismaFmtBinPath = "",
			},
		},
	}),
}
