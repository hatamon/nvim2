-- Cursor (VSCode) の Neovim 拡張用
local function action(id)
  return function()
    require("vscode").action(id)
  end
end

local function call(id)
  return function()
    require("vscode").call(id)
  end
end

local function utils()
  return require("config.keymaps.actions_utils")
end

return {
  general = {
    actions = {
      window_left = "", --call("workbench.action.navigateLeft"),
      window_below = "", --call("workbench.action.navigateDown"),
      window_above = "", --call("workbench.action.navigateUp"),
      window_right = "", --call("workbench.action.navigateRight"),
      yank = utils().yank,
      branch_paste_current = utils().paste_current_branch,
      register_paste = utils().paste_from_register,
      signature_help = call("editor.action.triggerParameterHints"),
    },
  },
  bufferline = {
    actions = {
      buffer_next = call("workbench.action.nextEditor"),
      buffer_prev = call("workbench.action.previousEditor"),
    },
  },
  toggleterm = {
    actions = {
      terminal_toggle = call("workbench.action.terminal.toggleTerminal"),
      terminal_normal = "",
    },
  },
  telescope = {
    actions = {
      find_files = call("workbench.action.quickOpen"),
      live_grep = call("workbench.view.search"),
      grep_string = call("workbench.action.findInFiles"),
      buffers = "",
      help_tags = "",
      oldfiles = "",
      resume = "",
    },
  },
  neotree = {
    actions = {
      explorer_toggle = call("workbench.action.toggleSidebarVisibility"),
      explorer_focus = call("workbench.view.explorer"),
    },
  },
  bufdelete = {
    actions = {
      buffer_delete = call("workbench.action.closeActiveEditor"),
      buffer_delete_all = call("workbench.action.closeAllEditors"),
      buffer_delete_others = call("workbench.action.closeOtherEditors"),
    },
  },
  none_ls = {
    actions = {
      buffer_format = call("editor.action.formatDocument"),
      definition_go = call("editor.action.revealDefinition"),
      implementation_go = call("editor.action.goToImplementation"),
      find_references = call("editor.action.goToReferences"),
      hover = call("editor.action.showHover"),
      rename = call("editor.action.rename"),
      code_action = call("editor.action.quickFix"),
      diagnostic_current_line = call("editor.action.diagnostic.show"),
      diagnostic_current_buffer = call("workbench.action.problems.focus"),
      diagnostic_prev_error = call("editor.action.marker.prev"),
      diagnostic_next_error = call("editor.action.marker.next"),
    },
  },
  git = {
    actions = {
      git_next_hunk = call("workbench.action.editor.nextChange"),
      git_prev_hunk = call("workbench.action.editor.previousChange"),
      git_preview_hunk = "",
      git_blame_line = "",
      git_diffthis = "",
      git_reset_hunk = call("git.revertChange")
    },
  },
}
