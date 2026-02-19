-- 常駐系プラグイン（起動時から有効にしたいもの）のキーマップ
local keymap = vim.keymap

-- ---------------------------------------------------------
-- Bufferline (タブ移動)
-- ---------------------------------------------------------
keymap.set("n", "L", ":BufferLineCycleNext<CR>", { silent = true, desc = "Next Buffer" })
keymap.set("n", "H", ":BufferLineCyclePrev<CR>", { silent = true, desc = "Prev Buffer" })

-- 今後、例えばステータスライン関連や、
-- 常に有効にしたいプラグインの操作が出てきたらここに追記していく！

-- toggleterm
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<C-]>', [[<C-\><C-n>]], opts)
end

-- ターミナルが開いた時にだけこの設定を適用する
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
