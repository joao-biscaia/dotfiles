-- Prettier on demand only (not on save)
return {
  { "mason-org/mason.nvim", opts = { ensure_installed = { "prettier" } } },
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>cp",
        function()
          require("conform").format({ formatters = { "prettier" }, timeout_ms = 3000 })
        end,
        desc = "Format with Prettier",
      },
    },
  },
}
