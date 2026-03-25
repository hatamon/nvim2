return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "master",
    opts = {
      ensure_installed = { "lua", "vim", "typescript", "tsx", "c_sharp", "markdown" },
      highlight = {
        enable = true,
        -- 生成コードや巨大ファイルで TS ハイライトが効きにくい & 重い場合がある
        disable = function(_, buf)
          local path = vim.api.nvim_buf_get_name(buf)
          local ok, st = pcall(vim.uv.fs_stat, path)
          return ok and st and st.size > 512 * 1024
        end,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost", -- ファイルを開いた時にロード
    opts = {
      enable = true, -- 有効化
      max_lines = 3, -- 上部に固定する最大行数（多すぎると邪魔なので3〜5がおすすめ）
      min_window_height = 0, -- どんなに小さいウィンドウでも表示する
      line_numbers = true,
      multiline_threshold = 1, -- 何行までの構造を追いかけるか
      trim_scope = "outer", -- 溢れた時にどっちを削るか
      zindex = 20, -- 描画の優先度
      mode = "topline", -- 'cursor' より 'topline' の方が計算負荷が低いよ！
      separator = nil, -- 区切り線を描画しないほうが計算は減る
    },
    config = function(_, opts)
      require("treesitter-context").setup(opts)

      -- 見た目の微調整：固定された行の背景色を少し変えると境界がわかりやすいよ
      vim.api.nvim_set_hl(0, "TreesitterContext", { link = "NormalFloat" })
      -- 下線を入れるとさらにVS Codeっぽくなる！
      vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = true, sp = "Grey" })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" }, -- ファイルを開いた時に読み込む
    opts = {
      -- v1.0 の標準的な設定だよ
      opts = {
        enable_close = true, -- 閉じタグを自動で作る
        enable_rename = true, -- 開始タグを変えたら閉じタグも変える
        enable_close_on_slash = true, -- </ と打ったら閉じる
      },
    },
  },
}
