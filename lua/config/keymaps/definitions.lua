-- キーと抽象アクション ID の紐付け（ここが唯一の定義場所）
return {
  -- { キー, アクションID, 説明 }
  general = {
    { "<leader>t", "toggle_terminal", "Toggle Terminal" },
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
  -- 今後 LSP を入れるときはここに "gd" とかを追加するだけ！
}
