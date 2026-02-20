return {
  -- general
  toggle_terminal = "<cmd>ToggleTerm<cr>",
  buffer_next = "<cmd>BufferLineCycleNext<cr>",
  buffer_prev = "<cmd>BufferLineCyclePrev<cr>",
  window_left = "<C-w>h",
  window_below = "<C-w>j",
  window_above = "<C-w>k",
  window_right = "<C-w>l",

  -- telescope
  find_files = "<cmd>Telescope find_files<cr>",
  live_grep = "<cmd>Telescope live_grep<cr>",
  buffers = "<cmd>Telescope buffers<cr>",
  help_tags = "<cmd>Telescope help_tags<cr>",
  oldfiles = "<cmd>Telescope oldfiles<cr>",

  -- neotree
  explorer_toggle = "<cmd>Neotree toggle<cr>",
  explorer_focus = "<cmd>Neotree focus<cr>",

  -- bufdelete
  buffer_delete = "<cmd>Bdelete<cr>",

  --none-ls
  buffer_format = "<cmd>lua vim.lsp.buf.format()<cr>",
  definition_go = vim.lsp.buf.definition,
  hover = vim.lsp.buf.hover,
  rename = vim.lsp.buf.rename,
  code_action = vim.lsp.buf.code_action,
  diagnostic_open = vim.diagnostic.open_float,
  diagnostic_prev_error = vim.diagnostic.goto_prev,
  diagnostic_next_error = vim.diagnostic.goto_next,
}
