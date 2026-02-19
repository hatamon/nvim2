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

                    -- 個別設定が必要な場合は、サーバー名をキーにしてここに書く
                    -- ["lua_ls"] = function() ... end,
                },
            })

            -- キーバインド
            local k = vim.keymap
            k.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to Definition" })
            k.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover Info" })
            k.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename" })
            k.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code Action" })
            k.set('n', '<leader>d', vim.diagnostic.open_float) -- エラー詳細表示
            k.set('n', '[d', vim.diagnostic.goto_prev)         -- 前のエラーへ
            k.set('n', ']d', vim.diagnostic.goto_next)         -- 次のエラーへ
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
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                -- ここは空でも mason-null-ls が自動で繋いでくれるけど、
                -- 明示的に書くならこう：
                sources = {
                    require("none-ls.code_actions.eslint_d"), -- TS/JS用
                    require("none-ls.diagnostics.eslint_d"), -- TS/JS用
                },
            })
        end,
    },
}
