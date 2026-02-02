return {
	cmd = { "docker-compose-langserver", "--stdio" },
	filetypes = { "yaml.docker-compose" },
	root_dir = vim.fs.root(0, { "docker-compose.yml", "docker-compose.yaml", "compose.yml", "compose.yaml" }),
}
