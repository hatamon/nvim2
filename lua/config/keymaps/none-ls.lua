-- none-ls (Linter/Formatter) 用のキーマップ定義
return {
	{ "<leader>fo", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format Document" },
	{ "gd", vim.lsp.buf.definition, desc = "Go to Definition" },
	{ "K", vim.lsp.buf.hover, desc = "Hover Info" },
	{ "<leader>rn", vim.lsp.buf.rename, desc = "Rename" },
	{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
	{ "<leader>d", vim.diagnostic.open_float, desc = "diagnostic" }, -- エラー詳細表示
	{ "[d", vim.diagnostic.goto_prev, desc = "prev error" }, -- 前のエラーへ
	{ "]d", vim.diagnostic.goto_next, desc = "next error" }, -- 次のエラーへ
}
