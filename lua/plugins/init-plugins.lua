return {
	-- Themes
	-- require('plugins.themes.rose-pine'),
	-- require("plugins.themes.tokyo-night"),
  require('plugins.themes.gruvbox-material'),
  -- Files
	require("plugins.files.treesitter"),
	require("plugins.files.telescope"),
	require("plugins.files.neo-tree"),
  -- Managerns
  require('plugins.managers.mason'),
	-- Autocomplete
	require("plugins.autocomplete.blink"),
	-- Custom 
	require("plugins.custom.header"),
  require('plugins.custom.lualine'),

}
