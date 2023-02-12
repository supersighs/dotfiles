--[[ opts.lua ]]
local opt = vim.opt
local cmd = vim.api.nvim_command

-- Snip...

-- [[ Theme ]]
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable
opt.number = true
cmd('colorscheme carbonfox')       -- cmd:  Set the colorscheme
