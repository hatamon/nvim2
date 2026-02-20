local M = {}

function M.get_keys_for(plugin_name)
  local all_defs = require("config.keymaps.definitions")
  local actions = require("config.keymaps.actions_nvim") -- Lazyは基本的にNeovim用
  local plugin_defs = all_defs[plugin_name]

  if not plugin_defs then
    return {}
  end

  local keys = {}
  for _, def in ipairs(plugin_defs) do
    local key, action_id, desc = def[1], def[2], def[3]
    local target = actions[action_id]

    if target then
      table.insert(keys, { key, target, desc = desc, mode = def.mode or "n" })
    else
      -- プラグインロード前（設定時）に警告を出す
      vim.notify(
        string.format("Lazy Keymap Warning: Action '%s' (for %s) not defined", action_id, plugin_name),
        vim.log.levels.WARN
      )
    end
  end
  return keys
end

return M
