-- lua/config/keymaps.lua
local keymap = vim.keymap

-- 【ウィンドウ移動】
-- Ctrl + hjkl でウィンドウ間を移動（<C-w>h とかを短縮）
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- 【バッファ（タブ）移動】
-- -- Shift + l で次のバッファ、Shift + h で前のバッファへ
keymap.set("n", "L", ":bnext<CR>", { silent = true, desc = "Next buffer" })
keymap.set("n", "H", ":bprevious<CR>", { silent = true, desc = "Prev buffer" })

-- 【LSP関連（先出し設定）】
-- LSPやLinterのエラー詳細を浮遊ウィンドウで見る
keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- エラー箇所へのジャンプ
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to prev diagnostic" })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- 【インデント調整】
-- ビジュアルモードで > や < を押したあと、選択状態を維持する
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")
