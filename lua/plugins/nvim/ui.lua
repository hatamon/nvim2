-- lua/plugins/ui.lua (lazy.nvim用)
return {
  -- File Tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = require("config.keymaps.helper").get_keys_for("neotree"),
    config = function()
      require("neo-tree").setup({
        window = {
          width = 30,
        },
      })
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
      })
    end,
  },

  -- tab
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          numbers = "ordinal",
          diagnostics = "nvim_lsp", -- 後でLSPを入れた時にエラーが出るように
          separator_style = "slant",
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            },
          },
        },
      })
    end,
  },

  -- indent
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      local ibl = require("ibl")

      ibl.setup({
        -- 縦線の文字（Cursorっぽく細い線）
        indent = {
          char = "╎", -- 他にも "▏", "┆", "┊" など好みで選べるよ
        },
        -- 空行にも線を表示するか
        scope = {
          enabled = true, -- 今いる階層を強調
          show_start = false,
          show_end = false,
        },
      })
    end,
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- アイコン設定（Nerd Fontsが入ったから綺麗に出るよ！）
      icons = {
        group = "󰾆 ",
        rules = false,
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      -- v3 の新しい書き方: add を使ってグループを定義
      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>h", group = "Git/Hunk" },
        { "<leader>c", group = "Code" },
        { "<leader>x", desc = "Close Buffer" }, -- 直接説明も書ける
      })
    end,
  },

  -- バッファを賢く消すプラグイン
  {
    "famiu/bufdelete.nvim",
    keys = require("config.keymaps.helper").get_keys_for("bufdelete"),
  },

  -- toogle term
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      direction = "float", -- デフォルトをフロートに設定
      float_opts = {
        border = "curved", -- 角丸でおしゃれに
      },
    },
  },
}
