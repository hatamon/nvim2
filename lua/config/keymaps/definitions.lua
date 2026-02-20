-- キーと抽象アクション ID の紐付け（ここが唯一の定義場所）
return {
  -- { キー, アクションID, 説明 }
  general = {
    { "<leader>t", "terminal_toggle", "Toggle Terminal" },
    { "<C-\\>", "terminal_toggle", "Toggle Terminal", mode = "t" },
    { "<C-\\>", "terminal_toggle", "Toggle Terminal" },
    { "<C-]>", "terminal_normal", "Nomarl Mode Terminal ", mode = "t" },
    { "L", "buffer_next", "Next Buffer" },
    { "H", "buffer_prev", "Prev Buffer" },
    { "<C-h>", "window_left", "Focus Window Left" },
    { "<C-j>", "window_below", "Focus Window Below" },
    { "<C-k>", "window_above", "Focus Window Above" },
    { "<C-l>", "window_right", "Focus Window Right" },
  },
  telescope = {
    { "<leader>ff", "find_files", "Find Files" },
    { "<leader>fg", "live_grep", "Live Grep" },
    { "<leader>fb", "buffers", "Buffers" },
    { "<leader>fh", "help_tags", "Help Tags" },
    { "<leader>fr", "oldfiles", "Recent Files" },
  },
  neotree = {
    { "<leader>e", "explorer_toggle", "Explorer Toggle" },
    { "<leader>o", "explorer_focus", "Explorer Focus" },
  },
  bufdelete = {
    { "<leader>x", "buffer_delete", "Delete Buffer" },
  },
  none_ls = {
    { "<leader>fo", "buffer_format", "Format Document" },
    { "<leader>dg", "definition_go", "Go to Definition" },
    { "K", "hover", "Hover Info" },
    { "<leader>rn", "rename", "Rename" },
    { "<leader>.", "code_action", "Code Action" },
    { "<leader>de", "diagnostic_open", "Diagnostic Open" }, -- エラー詳細表示
    { "[d", "diagnostic_prev_error", "prev error" }, -- 前のエラーへ
    { "]d", "diagnostic_next_error", "next error" }, -- 次のエラーへ
  },
  git = {
    -- 変更箇所（Hunk）へのジャンプ
    { "]g", "git_next_hunk", "Next Hunk" },
    { "[g", "git_prev_hunk", "Prev Hunk" },
    -- 変更内容の操作
    { "<leader>gp", "git_preview_hunk", "Preview Hunk" },
    { "<leader>gb", "git_blame_line", "Blame Line" },
    { "<leader>gd", "git_diffthis", desc = "Diff This" },
    -- 変更の取り消し（Undo的な）
    { "<leader>gx", "git_reset_hunk", "Reset Hunk" },
  },
}
