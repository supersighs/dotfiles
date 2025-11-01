require("config.keymaps")
-- Set tab width to 2 spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Use spaces instead of tabs
vim.o.expandtab = true

-- Enable auto-indentation
vim.o.autoindent = true
vim.o.smartindent = true

require("config.lazy")
require('lualine').setup()
