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
    config = function()
      vim.lsp.config("lua_ls", {
        on_attach = function(client)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
      })
      vim.lsp.enable("lua_ls")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls-extras.nvim", -- ここ！追い出された子たちを呼び戻す
    },
    opts = function()
      return {
        root_dir = require("null-ls.utils").root_pattern(".stylua.toml", ".git"),
      }
    end,
  },
}
