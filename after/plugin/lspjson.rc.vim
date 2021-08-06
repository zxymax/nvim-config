lua << EOF
require'lspconfig'.jsonls.setup {
  cmd = {
    'node',
		vim.fn.stdpath('data') .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
    '--stdio'
  },
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0})
      end
    }
  },
  on_attach = require'lspconfig'.on_attach
}
EOF

autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
