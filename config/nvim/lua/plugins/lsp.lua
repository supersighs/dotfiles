return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").lua_ls.setup({
        on_attach = function(client, bufnr)
          vim.api.nvim_buf_set_keymap(
            bufnr,
            "n",
            "<leader>f",
            "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
            { noremap = true, silent = true }
          )

          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function ()
              vim.lsp.format({ async = false })
              end
            })
          end
        end,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" }, -- Lua runtime version
            diagnostics = {
              globals = { "vim" },            -- Recognize 'vim' as a global
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
            telemetry = { enable = false }, -- Disable telemetry
          },
        },
      })
    end,
  },
}
