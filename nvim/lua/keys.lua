local map = vim.api.nvim_set_keymap
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
map('n', 'n', [[:NvimTreeToggle]], {})

