-- lua/plugins/lsp.lua
--
--                 ┌─────────────────┐
--                 │ Neovim LSP Core │
--                 └────────┬────────┘
--                          │
--            vim.lsp.config / enable
--                          │
--         ┌────────────────┼──────────────┐
--         │                                │
--   nvim-lspconfig                  none-ls.nvim
--  (LSP定義集)                    (fake LSP)
--         │                                │
--         └──────────────┬─────────────────┘
--                        │
--                    mason.nvim
--                        │
--         ┌──────────────┴──────────────┐
--         │                             │
-- mason-lspconfig              mason-null-ls
-- (LSP install)                (formatter install)

return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "ts_ls", "omnisharp", "lua_ls" },
      automatic_installation = true,
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
    opts = {
      ensure_installed = { "stylua", "prettier", "eslint_d" },
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
