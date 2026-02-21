-- 基本設定の読み込み
require("config.options")
require("config.keymaps")

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

local spec = {
  -- 共通プラグインは常に読み込む
  { import = "plugins.common" },
}

if vim.g.vscode then
  -- VSCode内なら vscode フォルダのみ読み込む
  table.insert(spec, { import = "plugins.vscode" })
else
  -- 通常のNeovimなら nvim フォルダを読み込む
  table.insert(spec, { import = "plugins.nvim" })
end

require("lazy").setup({
  spec = spec,
})
