
require("config.options")
require("config.keymaps")
require('config.autocmds')

require("core.lsp")
require('core.lazy')

require('lazy').setup(require("plugins.init-plugins"))
