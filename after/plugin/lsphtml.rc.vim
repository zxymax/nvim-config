lua << EOF
require'lspconfig'.html.setup{
	cmd = { 
		'node',
		vim.fn.stdpath('data')  .. '/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js',
		'--stdio'
	},
	filetypes = { "html" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true
		}
	},
  on_attach = require'lspconfig'.on_attach
}
EOF
