-- lua/config/keymaps.lua

local all_defs = require("config.keymaps.definitions")
local all_actions = vim.g.vscode and require("config.keymaps.actions_vscode") or require("config.keymaps.actions_nvim")

local persistent_groups = { "general", "none_ls", "bufferline", "git" }

for group_name, defs in pairs(all_defs) do
  local is_persistent = vim.tbl_contains(persistent_groups, group_name)
  local actions = all_actions[group_name].actions

  if is_persistent or vim.g.vscode then
    for _, def in ipairs(defs) do
      local key, action_id, desc = def[1], def[2], def[3]
      local target = actions[action_id]

      if target then
        local expr = (type(target) == "function") and true or false
        vim.keymap.set(def.mode or "n", key, target, { silent = true, desc = desc, expr = expr })
      else
        -- アクション未定義時の警告
        local env = vim.g.vscode and "VSCode" or "Neovim"
        vim.notify(string.format("Keymap Warning: Action '%s' not defined for %s", action_id, env), vim.log.levels.WARN)
      end
    end
  end
end
