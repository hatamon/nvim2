-- lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "omnisharp", "lua_ls" },
        -- これが最新の書き方！setupの中にhandlersを書くよ
        handlers = {
          -- 第一引数（名前なし）がデフォルトのハンドラーになる
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
          -- ここに lua_ls 専用のハンドラを追加して、設定をズバッ！と注入する
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  format = {
                    enable = false,
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },
  -- 1. Mason本体
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "stylua", "prettier", "eslint_d" } },
  },

  -- 2. 橋渡し役 (これを入れると自動で none-ls と繋いでくれる！)
  {
    "jay-babu/mason-null-ls.nvim",
    dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
    opts = {
      ensure_installed = { "stylua", "prettier", "eslint_d" },
      automatic_installation = true,
    },
  },

  -- 3. none-ls 本体
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls-extras.nvim", -- ここ！追い出された子たちを呼び戻す
    },
  },
}
