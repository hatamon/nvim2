-- 最終防衛ライン：自動設定にすべてを任せる
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "lua", "vim", "typescript", "tsx", "c_sharp", "markdown" },
      highlight = { enable = true },
    },
  },
}
