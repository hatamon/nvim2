local function utils()
  return require("config.keymaps.actions_utils")
end

return {
  general = {
    actions = {
      window_left = "<C-w>h",
      window_below = "<C-w>j",
      window_above = "<C-w>k",
      window_right = "<C-w>l",
      yank = utils().yank,
      branch_paste_current = utils().paste_current_branch,
      register_paste = utils().paste_from_register,
      signature_help = "<cmd>lua vim.lsp.buf.signature_help()<cr>",
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
      grep_string = "<cmd>Telescope grep_string<cr>",
      buffers = "<cmd>Telescope buffers<cr>",
      help_tags = "<cmd>Telescope help_tags<cr>",
      oldfiles = "<cmd>Telescope oldfiles<cr>",
      resume = "<cmd>Telescope resume<cr>",
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
      buffer_delete_all = "<cmd>BdeleteAll<cr>",
      buffer_delete_others = "<cmd>BdeleteOthers<cr>"
    },
  },
  none_ls = {
    actions = {
      buffer_format = "<cmd>lua require('conform').format({ timeout_ms = 5000 })<cr>",
      definition_go = "<cmd>lua vim.lsp.buf.definition()<cr>",
      find_references = function()
        require("telescope.builtin").lsp_references()
      end,
      hover = "<cmd>lua vim.lsp.buf.hover()<cr>",
      rename = "<cmd>lua vim.lsp.buf.rename()<cr>",
      code_action = "<cmd>lua vim.lsp.buf.code_action()<cr>",
      diagnostic_current_line = "<cmd>lua vim.diagnostic.open_float()<cr>",
      diagnostic_current_buffer = "<cmd>Telescope diagnostics<cr>",
      diagnostic_prev_error = "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      diagnostic_next_error = "<cmd>lua vim.diagnostic.goto_next()<cr>",
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
