-- lua/plugins/git.lua
return {
  {
    "lewis6991/gitsigns.nvim",
    keys = require("config.keymaps.helper").get_keys_for("git"),
    config = function()
      require("gitsigns").setup({
        -- サインの見た目設定（Cursor/VSCode風）
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        -- キーバインド設定
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
        end,
      })
    end,
  },
}
