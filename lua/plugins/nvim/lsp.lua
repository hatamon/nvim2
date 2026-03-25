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
    opts = {
      registries = {
        "github:mason-org/mason-registry", -- 標準
        "github:Crashdummyy/mason-registry", -- Roslyn 用の裏ルート！
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "ts_ls", "lua_ls" },
      automatic_installation = true,
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = { "stylua", "prettier", "eslint_d" },
    },
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- Neovim 側の didChangeWatchedFiles を抑え、Roslyn に任せる（二重監視の削減）
      filewatching = "roslyn",
    },
    config = function(_, opts)
      require("roslyn").setup(opts)
      -- 巨大ソリューションで既定の fullSolution 解析が UI を重くしやすい → 開いているファイルのみ
      vim.lsp.config("roslyn", {
        settings = {
          ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = "openFiles",
            dotnet_compiler_diagnostics_scope = "openFiles",
          },
          ["csharp|code_lens"] = {
            dotnet_enable_references_code_lens = false,
            dotnet_enable_tests_code_lens = false,
          },
        },
      })
    end,
  },
}
