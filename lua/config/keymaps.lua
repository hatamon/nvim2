-- lua/config/keymaps.lua

local keymap = vim.keymap

-- 【ウィンドウ移動】
-- Ctrl + hjkl でウィンドウ間を移動（<C-w>h とかを短縮）
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- 【常駐系】
-- bufferline など常駐系
require("config.keymaps.persistent");

