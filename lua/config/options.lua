vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- lua/config/options.lua (基本設定)
local opt = vim.opt

opt.number = true -- 行番号表示
opt.mouse = "a" -- マウス有効化
opt.tabstop = 4 -- タブ幅
opt.shiftwidth = 4
opt.expandtab = true -- タブをスペースに
opt.smartindent = true -- 自動インデント
opt.termguicolors = true -- 真色対応
opt.cursorline = true -- カーソル行の強調

local g = vim.g

-- 使用しない言語プロバイダーを無効化（警告消去 & 高速化）
g.loaded_python3_provider = 0
g.loaded_node_provider = 0 -- npmはLSPインストールに使うけどNeovim内プロバイダーは不要
