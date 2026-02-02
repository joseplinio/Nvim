local M = {}

-- Varre automaticamente todas as subpastas
local plugin_dirs = vim.fn.globpath(vim.fn.stdpath('config') .. '/lua/plugins', '*', 0, 1)

for _, dir in ipairs(plugin_dirs) do
  if vim.fn.isdirectory(dir) == 1 then
    local folder = vim.fn.fnamemodify(dir, ':t')
    table.insert(M, { import = "plugins." .. folder })
  end
end

return M
