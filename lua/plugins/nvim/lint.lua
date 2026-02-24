-- lua/plugins/lint.lua
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    local eslint_d = lint.linters.eslint_d

    local getCwd = function()
      -- 現在のバッファがあるディレクトリから、.eslintrcを探してその場所をcwdにする
      return vim.fs.dirname(vim.fs.find({
        ".eslintrc",
        ".eslintrc.js",
        ".eslintrc.json",
        "eslint.config.js",
        "package.json",
      }, { upward = true, path = vim.api.nvim_buf_get_name(0) })[1])
    end
    eslint_d.cwd = getCwd()
    eslint_d.args = vim.list_extend(eslint_d.args or {}, {
      "--rule",
      '"prettier/prettier": [ "error", { "endOfLine": "auto" }]',
    })

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }

    -- 保存時やバッファを離れた時に実行
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "CursorHold" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
