-- Cursor (VSCode) の Neovim 拡張用
local function action(id)
  return function()
    require("vscode").action(id)
  end
end

return {
  -- general
  terminal_toggle = action("workbench.action.terminal.toggleTerminal"),
  terminal_normal = "",
  buffer_next = action("workbench.action.nextEditor"),
  buffer_prev = action("workbench.action.previousEditor"),
  window_left = "", --action("workbench.action.navigateLeft"),
  window_below = "", --action("workbench.action.navigateDown"),
  window_above = "", --action("workbench.action.navigateUp"),
  window_right = "", --action("workbench.action.navigateRight"),

  -- telescope
  find_files = action("workbench.action.quickOpen"),
  live_grep = action("workbench.view.search"),
  buffers = "",
  help_tags = "",
  oldfiles = "",

  -- neotree
  explorer_toggle = action("workbench.action.toggleSidebarVisibility"),
  explorer_focus = action("workbench.view.explorer"),

  -- bufdelete
  buffer_delete = action("workbench.action.closeActiveEditor"),

  -- none-ls
  buffer_format = action("editor.action.formatDocument"),
  definition_go = action("editor.action.revealDefinition"),
  hover = action("editor.action.showHover"),
  rename = action("editor.action.rename"),
  code_action = action("editor.action.quickFix"),
  diagnostic_open = action("workbench.action.problems.focus"),
  diagnostic_prev_error = action("editor.action.marker.prev"),
  diagnostic_next_error = action("editor.action.marker.next"),

  -- git
  git_next_hunk = action("workbench.action.editor.nextChange"),
  git_prev_hunk = action("workbench.action.editor.previousChange"),
  git_preview_hunk = "",
  git_blame_line = "",
  git_diffthis = "",
  git_reset_hunk = action("git.revertChange")
}
