return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      markdown = { "prettier" },
      yaml = { "prettier" },
      lua = { "stylua" },
      -- ほか必要に応じて
    },
    formatters = {
      prettier = {
        command = function(ctx)
          -- プロジェクトローカルの prettier を上向き探索
          local prettier = vim.fs.find("node_modules/.bin/prettier", { upward = true, path = ctx.filename })[1]
          return prettier or "prettier" -- 見つからなければ PATH のを使用
        end,
        args = { "--stdin-filepath", "$FILENAME" },
        stdin = true,
      },
    },
  },
}
