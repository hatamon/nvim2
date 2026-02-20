return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "master",
    opts = {
      ensure_installed = { "lua", "vim", "typescript", "tsx", "c_sharp", "markdown" },
      highlight = { enable = true },
    },
  },
}
