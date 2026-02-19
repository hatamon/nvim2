-- 基本設定の読み込み
require("config.options")

-- lazy.nvimのセットアップ (公式サイトの標準的なインストールスクリプト)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- プラグインの読み込み (lua/plugins/ 以下のファイルを自動で読み込む)
require("lazy").setup("plugins")
