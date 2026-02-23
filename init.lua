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

-- 最新のAPI(vim.lsp.get_clients)に対応したデバッグコマンド
vim.api.nvim_create_user_command("CheckLspCmd", function()
  local clients = vim.lsp.get_clients() -- ここを修正したよ！

  if #clients == 0 then
    print("有効なLSPクライアントが見つからないよ。ファイルを開いてる？")
    return
  end

  for _, client in ipairs(clients) do
    print("-------------------------")
    print("Client: " .. client.name)

    local cmd = client.config.cmd
    if type(cmd) == "table" then
      for i, v in ipairs(cmd) do
        -- ここで型をチェック！もし type(v) が "table" だったら、それがエラーの犯人だね。
        print(string.format("  [%d]: %s (type: %s)", i, tostring(v), type(v)))
      end
    else
      print("  cmd: " .. tostring(cmd) .. " (type: " .. type(cmd) .. ")")
    end
  end
end, {})

-- すべてのLSP設定テンプレートをスキャンするコマンド
vim.api.nvim_create_user_command("CheckAllLspConfigs", function()
  local ok, lspconfig = pcall(require, "lspconfig")
  if not ok then
    print("lspconfig が読み込めないよ")
    return
  end

  local found = false
  -- 登録されている全サーバーの設定を回す
  for server_name, config in pairs(lspconfig.configs) do
    local cmd = config.cmd
    if type(cmd) == "table" then
      for i, v in ipairs(cmd) do
        if type(v) == "table" then
          print(string.format("🔥 犯人確保！: [%s] の cmd[%d] が table になってるよ", server_name, i))
          found = true
        end
      end
    end
  end

  if not found then
    print("lspconfig のテンプレートには異常なし！次は mason 側を確認するね。")
  end
end, {})
