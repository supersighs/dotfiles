return {
  -- nvim-cmp (Completion Plugin)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP completion source
      "hrsh7th/cmp-buffer",    -- Buffer completion source
      "hrsh7th/cmp-path",      -- Path completion source
      "hrsh7th/cmp-cmdline",   -- Command-line completion
      "L3MON4D3/LuaSnip",      -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet completions
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- Use LuaSnip for snippets
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- LSP completions
          { name = "luasnip" },  -- Snippet completions
        }, {
          { name = "buffer" },   -- Buffer completions
          { name = "path" },     -- Path completions
        }),
      })
    end,
  },

  -- Optional: Snippet plugin (LuaSnip)
  { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },

  -- Make sure Mason installs `lua_ls` (if not already installed)
  --{
  --  "williamboman/mason-lspconfig.nvim",
  --  opts = {
  --    ensure_installed = { "lua_ls" },
  --  },
  --},
}
