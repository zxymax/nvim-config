lua << EOF
require'lspconfig'.bashls.setup {
  cmd = { vim.fn.stdpath('data') .. '/lspinstall/bash/node_modules/.bin/bash-language-server', 'start' },
  filetypes = { "sh", "zsh" },
	on_attach = require'lspconfig'.on_attach
}
EOF
