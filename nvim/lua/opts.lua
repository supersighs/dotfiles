--[[ opts.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command

-- Snip...

-- [[ Theme ]]
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable
opt.number = true
cmd('colorscheme carbonfox')       -- cmd:  Set the colorscheme
cmd('highlight Normal guibg=0')
-- Tab control
opt.expandtab = true
opt.smarttab = true -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
opt.tabstop = 4 -- the visible width of tabs
opt.softtabstop = 4 -- edit as if the tabs are 4 characters wide
opt.shiftwidth = 4 -- number of spaces to use for indent and unindent
opt.shiftround = true -- round indent to a multiple of 'shiftwidth'

opt.backup = false -- don't use backup files
opt.writebackup = false -- don't backup the file while editing
opt.swapfile = false -- don't create swap files for new buffers
opt.updatecount = 0 -- don't write swap files after some number of updates

opt.linebreak = true -- set soft wrapping
opt.showbreak = "↪"
opt.autoindent = false -- automatically set indent of new line
opt.list = true
opt.listchars = { tab = "→ ", eol = "¬", trail = "⋅", extends = "❯", precedes = "❮" }


