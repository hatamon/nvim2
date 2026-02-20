-- lua/plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    keys = require("config.keymaps.helper").get_keys_for("none_ls"),
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = { "ts_ls", "omnisharp", "lua_ls" },
        -- これが最新の書き方！setupの中にhandlersを書くよ
        handlers = {
          -- 第一引数（名前なし）がデフォルトのハンドラーになる
          function(server_name)
            local lc = require("lspconfig")
            lc[server_name].setup({})
            if server_name == "lua_ls" then
              lc.lua_ls.setup({
                settings = {
                  Lua = {
                    -- 1. LSP内蔵のフォーマッタを無効化する
                    format = {
                      enable = false,
                    },
                  },
                },
              })
            end
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
