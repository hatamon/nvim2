-- lua/config/options.lua
-- ==========================================
-- 1. 共通設定 (VSCode/Terminal 両方)
-- ==========================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.smartcase = true      -- 大文字が混じってたら区別する
vim.opt.smartindent = true -- 自動インデント
vim.opt.tabstop = 4           -- タブ幅
vim.opt.shiftwidth = 4
vim.opt.expandtab = true      -- スペースに展開

-- ==========================================
-- 2. 通常のNeovim専用 (VSCodeでは不要)
-- ==========================================
if not vim.g.vscode then
    vim.opt.number = true           -- 行番号
    vim.opt.termguicolors = true    -- 真彩色対応
    vim.opt.cursorline = true       -- カーソル行強調
    vim.opt.laststatus = 3          -- ステータスラインの一致（Neovim 0.7+）
    vim.opt.mouse = "a"             -- マウス有効
-- 使用しない言語プロバイダーを無効化（警告消去 & 高速化）
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0 -- npmはLSPインストールに使うけどNeovim内プロバイダーは不要
end

-- ==========================================
-- 3. VSCode専用の設定 (もしあれば)
-- ==========================================
if vim.g.vscode then
    -- VSCode特有の設定が必要な場合はここに書く
end
