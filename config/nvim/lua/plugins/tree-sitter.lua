return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- Automatically update parsers
  event = "BufReadPost",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects", -- Optional for advanced features
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "python", "javascript", "html", "css" }, -- Languages
      highlight = { enable = true },                                       -- Enable syntax highlighting
      indent = { enable = true },                                          -- Enable context-aware indentation
      incremental_selection = { enable = true },                           -- Smart selection
      textobjects = { enable = true },                                     -- Advanced text objects (optional)
    })
  end,
}
