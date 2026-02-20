-- Cursor (VSCode) の Neovim 拡張用
local function action(id)
  return function()
    require("vscode").action(id)
  end
end

return {
  toggle_terminal = action("workbench.action.terminal.toggleTerminal"),
}
