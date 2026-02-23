-- lua/config/options.lua
-- ==========================================
-- 1. 共通設定 (VSCode/Terminal 両方)
-- ==========================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.smartcase = true -- 大文字が混じってたら区別する
vim.opt.smartindent = true -- 自動インデント
vim.opt.tabstop = 4 -- タブ幅
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- スペースに展開
vim.opt.updatetime = 500
vim.opt.eol = true
vim.opt.fixeol = true

-- ==========================================
-- 2. 通常のNeovim専用 (VSCodeでは不要)
-- ==========================================
if not vim.g.vscode then
  vim.opt.number = true -- 行番号
  vim.opt.termguicolors = true -- 真彩色対応
  vim.opt.cursorline = true -- カーソル行強調
  vim.opt.laststatus = 3 -- ステータスラインの一致（Neovim 0.7+）
  vim.opt.mouse = "a" -- マウス有効
  vim.opt.ambiwidth = "single"
  vim.opt.fileencodings = { "ucs-bom", "utf-8", "default", "cp932", "euc-jp", "iso-2022-jp", "latin1" }
  vim.opt.autoread = true
  vim.opt.signcolumn = "yes"
  vim.opt.swapfile = false
  -- 使用しない言語プロバイダーを無効化（警告消去 & 高速化）
  vim.g.loaded_python3_provider = 0
  vim.g.loaded_node_provider = 0 -- npmはLSPインストールに使うけどNeovim内プロバイダーは不要

  ---- vim-matchup 高速化
  vim.g.matchup_matchparen_offscreen = {}
  vim.g.matchup_matchparen_timeout = 100
  vim.g.matchup_matchparen_deferred = 1

  ---- nvim 高速化
  vim.opt.lazyredraw = true
  vim.opt.ttyfast = true

  if jit.os == "Windows" then
    vim.opt.shell = "pwsh"
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
    vim.opt.shellquote = ""
    vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.opt.shellredir = "| Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.opt.shellxquote = ""
  end
end

-- ==========================================
-- 3. VSCode専用の設定 (もしあれば)
-- ==========================================
if vim.g.vscode then
  -- VSCode特有の設定が必要な場合はここに書く
end
