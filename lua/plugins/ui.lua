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
    config = function()
      require("neo-tree").setup({
        window = {
          width = 30,
        }
      })
      -- VSCodeのように起動時にツリーを開く場合はここにキーマップを追加
      vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { silent = true })
    end
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
        }
      })
    end
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
            }
          },
        }
      })
      -- タブ切り替えのキーバインド (VSCode風にCtrl+Tabっぽく、あるいはShift+L/H)
      vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Tab" })
      vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Prev Tab" })
      -- タブを閉じる
      vim.keymap.set("n", "<leader>x", "<Cmd>bdelete<CR>", { desc = "Close Buffer" })
    end
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
}

