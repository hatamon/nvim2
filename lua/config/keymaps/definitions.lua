-- キーと抽象アクション ID の紐付け（ここが唯一の定義場所）
return {
  -- { キー, アクションID, 説明 }
  general = {
    { "<C-h>", "window_left", "Focus Window Left" },
    { "<C-j>", "window_below", "Focus Window Below" },
    { "<C-k>", "window_above", "Focus Window Above" },
    { "<C-l>", "window_right", "Focus Window Right" },
    { "Y", "yank", "Yank", expr = true },
    { "<C-V>cb", "branch_paste_current", "Paste Current Branch", mode = "t" },
    { "<C-V>p", "register_paste", "Paste From Register", mode = "t", expr = true },
    { "<C-k>", "signature_help", "Signature Help", mode = "i" },
  },
  bufferline = {
    { "L", "buffer_next", "Next Buffer" },
    { "H", "buffer_prev", "Prev Buffer" },
  },
  toggleterm = {
    { "<leader>t", "terminal_toggle", "Toggle Terminal" },
    { "<C-\\>", "terminal_toggle", "Toggle Terminal", mode = "t" },
    { "<C-\\>", "terminal_toggle", "Toggle Terminal" },
    { "<C-]>", "terminal_normal", "Nomarl Mode Terminal ", mode = "t" },
  },
  telescope = {
    { "<leader>ff", "find_files", "Find Files" },
    { "<leader>fg", "live_grep", "Live Grep" },
    { "<leader>fG", "grep_string", "Grep String" },
    { "<leader>fb", "buffers", "Buffers" },
    { "<leader>fh", "help_tags", "Help Tags" },
    { "<leader>fr", "oldfiles", "Recent Files" },
    { "<leader>fR", "resume", "Resume" },
  },
  neotree = {
    { "<leader>e", "explorer_toggle", "Explorer Toggle" },
    { "<leader>o", "explorer_focus", "Explorer Focus" },
  },
  bufdelete = {
    { "<leader>x", "buffer_delete", "Delete Buffer" },
    { "<leader>ba", "buffer_delete_all", "Delete All Buffers" },
    { "<leader>bo", "buffer_delete_others", "Delete Other Buffers" },
  },
  none_ls = {
    { "<leader>fo", "buffer_format", "Format Document" },
    { "<F12>", "definition_go", "Go to Definition" },
    { "<leader>dd", "definition_go", "Go to Definition" },
    { "<leader>di", "implementation_go", "Go to Implementation" },
    { "<leader>dr", "find_references", "Find References" },
    { "K", "hover", "Hover Info" },
    { "<F2>", "rename", "Rename" },
    { "<leader>rn", "rename", "Rename" },
    { "<leader>.", "code_action", "Code Action" },
    { "<leader>dl", "diagnostic_current_line", "Diagnostic Open Current Line" }, -- エラー詳細表示
    { "<leader>db", "diagnostic_current_buffer", "Diagnostic Open Current Buffer" }, -- エラー詳細表示
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
