-- lua/plugins/ui.lua (lazy.nvim用)
return {
  -- File Tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = require("config.keymaps.helper").get_cmd_for("neotree"),
    keys = require("config.keymaps.helper").get_keys_for("neotree"),
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
        },
        filesystem = {
          -- ここが同期の肝！
          follow_current_file = {
            enabled = true, -- これを true にすると同期が始まるよ
            leave_dirs_open = false, -- trueにすると、一度開いたフォルダを閉じずに残すよ
          },
          use_libuv_file_watcher = true, -- ファイルの増減もリアルタイムで反映されるようになるよ
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
          close_command = "Bdelete %d",
          right_mouse_command = "Bdelete %d",
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
      plugins = {
        registers = false, -- これでレジスタが出なくなるよ！
        -- ついでにこれもいらないなら false にしちゃおう
        marks = false, -- マーク一覧
        spelling = false, -- スペルチェック候補
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
    cmd = require("config.keymaps.helper").get_cmd_for("bufdelete"),
    keys = require("config.keymaps.helper").get_keys_for("bufdelete"),
    config = function()
      -- すべてのバッファを Bdelete で閉じるコマンド
      vim.api.nvim_create_user_command("BdeleteAll", function()
        -- 現在ロードされている全バッファを取得
        local buffers = vim.api.nvim_list_bufs()

        for _, bufnr in ipairs(buffers) do
          -- バッファが有効（存在する）かつ、リストに表示されるものだけ対象にする
          if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted then
            -- Bdelete を実行。未保存なら停止するように force は false に
            -- もし強制したいなら、pcall 内のコマンドを "Bdelete!" に変えてね
            local success, err = pcall(function()
              vim.cmd("Bdelete " .. bufnr)
            end)

            if not success then
              -- 未保存ファイルなどで失敗した場合はメッセージを出す
              print("Skipped: " .. vim.fn.bufname(bufnr) .. " (unsaved?)")
            end
          end
        end
        print("All buffers processed with Bdelete!")
      end, {})

      vim.api.nvim_create_user_command("BdeleteOthers", function()
        local current_buf = vim.api.nvim_get_current_buf()
        local buffers = vim.api.nvim_list_bufs()

        for _, bufnr in ipairs(buffers) do
          -- 1. 現在のバッファではない
          -- 2. 有効なバッファである
          -- 3. バッファリストに載っている（ファイルである）
          if bufnr ~= current_buf and vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted then
            -- Bdelete を実行（未保存があれば停止する安全設計）
            pcall(function()
              vim.cmd("Bdelete " .. bufnr)
            end)
          end
        end
        print("Only this buffer left!")
      end, {})
    end,
  },

  -- toogle term
  {
    "akinsho/toggleterm.nvim",
    cmd = require("config.keymaps.helper").get_cmd_for("toggleterm"),
    keys = require("config.keymaps.helper").get_keys_for("toggleterm"),
    version = "*",
    opts = {
      shell = (jit.os == "Windows") and "pwsh" or null,
      shellcmdflag = (jit.os == "Windows") and "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command" or null,
      size = 20,
      direction = "float", -- デフォルトをフロートに設定
      float_opts = {
        border = "curved", -- 角丸でおしゃれに
      },
    },
  },
}
