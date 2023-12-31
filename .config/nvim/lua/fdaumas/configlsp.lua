local nvim_lsp = require('lspconfig')

-- TypeScript
nvim_lsp.tsserver.setup {
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
	cmd = { "typescript-language-server", "--stdio" }
}

-- asm
nvim_lsp.asm_lsp.setup {
	on_attach = on_attach,
	filetypes = { "asm", "s", "S" },
	cmd = { "asm-lsp" }
}
