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

-- プラグインの読み込み (lua/plugins/ 以下のファイルを自動で読み込む)
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  defaults = {
    -- VSCode の時は、各プラグインで明示的に `cond = true` と書かない限りロードしない
    cond = function(plugin)
      -- VSCode じゃないなら常にロード
      if not vim.g.vscode then return true end
      
      -- VSCode の時：
      -- 各プラグイン設定で個別に `vscode = true` と書いてあるものだけロードする
      return plugin.vscode == true
    end,
  },
})
