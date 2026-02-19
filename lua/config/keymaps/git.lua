return {
    -- 変更箇所（Hunk）へのジャンプ
    { "]g",         "<cmd>lua require('gitsigns').next_hunk()<cr>",    desc = "Next Hunk" },
    { "[g",         "<cmd>lua require('gitsigns').prev_hunk()<cr>",    desc = "Prev Hunk" },

    -- 変更内容の操作
    { "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Preview Hunk" },
    { "<leader>gb", "<cmd>lua require('gitsigns').blame_line()<cr>",   desc = "Blame Line" },
    { "<leader>gd", "<cmd>lua require('gitsigns').diffthis()<cr>",     desc = "Diff This" },

    -- 変更の取り消し（Undo的な）
    { "<leader>gx", "<cmd>lua require('gitsigns').reset_hunk()<cr>",   desc = "Reset Hunk" },
}
