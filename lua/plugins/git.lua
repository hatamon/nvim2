-- lua/plugins/git.lua
return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        -- サインの見た目設定（Cursor/VSCode風）
        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        -- キーバインド設定
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- ハンク（変更の塊）ジャンプ
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr = true, desc = "Next Git Change" })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr = true, desc = "Prev Git Change" })

          -- プレビューやリセット
          map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview Git Change" })
          map('n', '<leader>hr', gs.reset_hunk, { desc = "Reset Git Change" })
          map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "Git Blame" })
        end
      })
    end
  }
}
