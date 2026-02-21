-- lua/plugins/colorscheme.lua
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- 他のプラグインより先に読み込む
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha (mochaが一番暗くてVSCodeに近い)
        transparent_background = false, -- 背景を透明にしたいならここをtrueに
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          -- さっき入れたプラグインたちとの連携
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
          telescope = { enabled = true },
          bufferline = true,
          neotree = true,
        },
      })

      -- テーマを適用
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
