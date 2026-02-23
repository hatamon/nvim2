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

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }

    -- 保存時やバッファを離れた時に実行
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
    })

    -- 手動で呼び出すためのコマンドも作っておくよ
    vim.api.nvim_create_user_command("LintInfo", function()
      print("Configured linters: " .. vim.inspect(lint.linters_by_ft[vim.bo.filetype]))
    end, {})
  end,
}
