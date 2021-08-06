lua << EOF
require'lspconfig'.cssls.setup {
  cmd = { 
	  'node',
	  vim.fn.stdpath('data')  .. '/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js',
  	  '--stdio' 
  },
  on_attach = require'lspconfig'.on_attach
}
EOF
