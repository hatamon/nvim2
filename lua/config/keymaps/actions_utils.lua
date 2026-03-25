local M = {}

local function send_text(text)
  local mode = vim.api.nvim_get_mode().mode
  local job_id = vim.b.terminal_job_id

  if mode:sub(1, 1) == "t" and type(job_id) == "number" then
    vim.fn.chansend(job_id, text)
    return
  end

  vim.api.nvim_put({ text }, "c", true, true)
end

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
    send_text("$(git branch --show-current)")
  else
    send_text("`git branch --show-current`")
  end
end

return M
