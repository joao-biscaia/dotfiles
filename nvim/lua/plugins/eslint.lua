-- ESLint (LSP) uses the nearest eslint config above each file and fixes on save.
-- Runs after conform (priority 100) so the eslint config gets the last word.
return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      eslint = function()
        LazyVim.format.register(LazyVim.lsp.formatter({
          name = "eslint: lsp",
          primary = false,
          priority = 50,
          filter = "eslint",
          -- LazyVim's default routes through conform, which just reruns prettier
          format = function(buf)
            vim.lsp.buf.format({ bufnr = buf, name = "eslint", timeout_ms = 3000 })
          end,
        }))
      end,
    },
  },
}
