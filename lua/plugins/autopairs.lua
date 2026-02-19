-- lua/plugins/autopairs.lua
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- インサートモードに入った時に読み込む
    config = function()
      local autopairs = require("nvim-autopairs")

      autopairs.setup({
        check_ts = true, -- Treesitterを使って精度を上げる（後で効いてくるよ！）
        disable_filetype = { "TelescopePrompt" }, -- 検索窓では無効化
      })

      -- nvim-cmp との連携設定（ここがCursorっぽさの鍵！）
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      
      -- 補完で関数を確定した時に自動で () を付ける魔法
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
