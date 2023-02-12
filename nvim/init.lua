
vim.g.mapleader = ","

require('plugins')
require('vars')
require('opts')
require('keys')

require('nvim-tree').setup{}
require('lualine').setup()
