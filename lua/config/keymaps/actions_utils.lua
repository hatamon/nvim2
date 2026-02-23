local M = {}

function M.yank()
  return "yy"
end

function M.paste_from_register()
  local next_char_code = vim.fn.getchar()
  local next_char = vim.fn.nr2char(next_char_code)
  return '<C-\\><C-n>"' .. next_char .. "pi"
end

function M.paste_current_branch()
  if jit.os == "Windows" then
    return "$(git branch --show-current)"
  else
    return "`git branch --show-current`"
  end
end

return M
