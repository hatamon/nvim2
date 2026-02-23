-- Cursor (VSCode) の Neovim 拡張用
local function action(id)
  return function()
    require("vscode").action(id)
  end
end

return {
  general = {
    actions = {
      window_left = "", --action("workbench.action.navigateLeft"),
      window_below = "", --action("workbench.action.navigateDown"),
      window_above = "", --action("workbench.action.navigateUp"),
      window_right = "", --action("workbench.action.navigateRight"),
      yank = "yy",
    },
  },
  bufferline = {
    actions = {
      buffer_next = action("workbench.action.nextEditor"),
      buffer_prev = action("workbench.action.previousEditor"),
    },
  },
  toggleterm = {
    actions = {
      terminal_toggle = action("workbench.action.terminal.toggleTerminal"),
      terminal_normal = "",
    },
  },
  telescope = {
    actions = {
      find_files = action("workbench.action.quickOpen"),
      live_grep = action("workbench.view.search"),
      buffers = "",
      help_tags = "",
      oldfiles = "",
    },
  },
  neotree = {
    actions = {
      explorer_toggle = action("workbench.action.toggleSidebarVisibility"),
      explorer_focus = action("workbench.view.explorer"),
    },
  },
  bufdelete = {
    actions = {
      buffer_delete = action("workbench.action.closeActiveEditor"),
    },
  },
  none_ls = {
    actions = {
      buffer_format = action("editor.action.formatDocument"),
      definition_go = action("editor.action.revealDefinition"),
      find_references = action("editor.action.goToReferences"),
      hover = action("editor.action.showHover"),
      rename = action("editor.action.rename"),
      code_action = action("editor.action.quickFix"),
      diagnostic_open = action("workbench.action.problems.focus"),
      diagnostic_prev_error = action("editor.action.marker.prev"),
      diagnostic_next_error = action("editor.action.marker.next"),
    },
  },
  git = {
    actions = {
      git_next_hunk = action("workbench.action.editor.nextChange"),
      git_prev_hunk = action("workbench.action.editor.previousChange"),
      git_preview_hunk = "",
      git_blame_line = "",
      git_diffthis = "",
      git_reset_hunk = action("git.revertChange")
    },
  },
}
