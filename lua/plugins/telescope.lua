-- lua/plugins/telescope.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- 検索を爆速にする拡張
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = require("config.keymaps.helper").get_keys_for("telescope"),
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          -- プレビュー窓の見た目を少しVSCodeっぽく
          layout_config = {
            horizontal = { preview_width = 0.5 },
          },
          -- ファイル検索から除外するもの
          file_ignore_patterns = { "node_modules", ".git/", "bin/", "obj/" },
        },
      })

      -- 拡張読み込み
      telescope.load_extension("fzf")
    end,
  },
}
