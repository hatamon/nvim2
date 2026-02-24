return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- 最新の機能を反映
    build = jit.os == "Windows"
      and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
      or "make",
    opts = {
      provider = "copilot", -- 標準で Copilot を使用
      auto_suggestions_provider = "copilot",

      -- 最新のプロバイダー定義
      providers = {
        copilot = {
          endpoint = "https://api.githubcopilot.com",
          model = "gpt-4o-2024-05-13",
          proxy = nil,
          timeout = 30000,
          temperature = 0,
          extra_request_body = {
            max_tokens = 4096,
          },
        },
      },
    },
    -- 公式 README 推奨の依存プラグイン
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "zbirenbaum/copilot.lua", -- Copilot 本体
        cmd = "Copilot",
        opts = {
          suggestion = { enabled = false },
          panel = { enabled = false },
        },
      },
      {
        -- Markdown の見た目を綺麗にする（Avante 推奨）
        "MeanderingProgrammer/render-markdown.nvim",
        opts = { file_types = { "markdown", "Avante" } },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
