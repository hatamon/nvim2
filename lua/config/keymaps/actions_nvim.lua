return {
  general = {
    actions = {
      window_left = "<C-w>h",
      window_below = "<C-w>j",
      window_above = "<C-w>k",
      window_right = "<C-w>l",
      yank = "yy",
    },
  },
  bufferline = {
    cmd = { "BufferLineCycleNext", "BufferLineCyclePrev" },
    actions = {
      buffer_next = "<cmd>BufferLineCycleNext<cr>",
      buffer_prev = "<cmd>BufferLineCyclePrev<cr>",
    },
  },
  toggleterm = {
    cmd = { "ToggleTerm" },
    actions = {
      terminal_toggle = "<cmd>ToggleTerm<cr>",
      terminal_normal = "<C-\\><C-n>",
    },
  },
  telescope = {
    cmd = { "Telescope" },
    actions = {
      find_files = "<cmd>Telescope find_files<cr>",
      live_grep = "<cmd>Telescope live_grep<cr>",
      buffers = "<cmd>Telescope buffers<cr>",
      help_tags = "<cmd>Telescope help_tags<cr>",
      oldfiles = "<cmd>Telescope oldfiles<cr>",
    },
  },
  neotree = {
    cmd = { "Neotree" },
    actions = {
      explorer_toggle = "<cmd>Neotree toggle<cr>",
      explorer_focus = "<cmd>Neotree focus<cr>",
    },
  },
  bufdelete = {
    cmd = { "Bdelete" },
    actions = {
      buffer_delete = "<cmd>Bdelete<cr>",
    },
  },
  none_ls = {
    actions = {
      buffer_format = "<cmd>lua vim.lsp.buf.format()<cr>",
      definition_go = vim.lsp.buf.definition,
      find_references = function() require("telescope.builtin").lsp_references() end,
      hover = vim.lsp.buf.hover,
      rename = vim.lsp.buf.rename,
      code_action = vim.lsp.buf.code_action,
      diagnostic_open = vim.diagnostic.open_float,
      diagnostic_prev_error = vim.diagnostic.goto_prev,
      diagnostic_next_error = vim.diagnostic.goto_next,
    },
  },
  git = {
    actions = {
      git_next_hunk = "<cmd>lua require('gitsigns').next_hunk()<cr>",
      git_prev_hunk = "<cmd>lua require('gitsigns').prev_hunk()<cr>",
      git_preview_hunk = "<cmd>lua require('gitsigns').preview_hunk()<cr>",
      git_blame_line = "<cmd>lua require('gitsigns').blame_line()<cr>",
      git_diffthis = "<cmd>lua require('gitsigns').diffthis()<cr>",
      git_reset_hunk = "<cmd>lua require('gitsigns').reset_hunk()<cr>",
    },
  },
}
