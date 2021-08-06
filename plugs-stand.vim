" Location for installing plugins
call plug#begin('~/.vim/plugged')

" Other plugins are specified with user/repo on Github or x.vim on vimscripts
" Git integration (status bar and commands like Gblame)
Plug 'tpope/vim-fugitive'
" Add info to sidebar about git
Plug 'airblade/vim-gitgutter'
" Add file-management commands like :Delete, :Move, and :Rename
Plug 'tpope/vim-eunuch'
" Automatically adds 'ends' after ifs etc. in Ruby/Vimscript/Lua/Bourne Shell
Plug 'tpope/vim-endwise'
" Add parenthesis after autocompleted function
Plug 'shougo/neopairs.vim'
" Autocomplete from HTML snippets of a certain language
Plug 'shougo/context_filetype.vim'
" Provides a status line that provides handy info
" From other plugins at the bottom of the screen
Plug 'bling/vim-airline'
" Snippets engine - requires actual snippets in a separate plugin
Plug 'SirVer/ultisnips'
" Visually displays indent levels as lines
Plug 'nathanaelkane/vim-indent-guides'
" Visually displays which XML/HTML/JSX tag is paired with current one
Plug 'Valloric/MatchTagAlways'
" Search with ripgrep (it is search tool agnostic)
Plug 'mileszs/ack.vim'
" View project tree
Plug 'scrooloose/nerdtree'
" Comment out code with ease in any language
Plug 'scrooloose/nerdcommenter'
" Lint / Check for syntax errors
Plug 'w0rp/ale'
" Highlights while editing and removes whitespace on save
Plug 'ntpeters/vim-better-whitespace'
" Split single line args to many
Plug 'AndrewRadev/splitjoin.vim'
" Color scheme
Plug 'drewtempelmeyer/palenight.vim'
" Change/delete surrounding quotes/brackets/tags
Plug 'tpope/vim-surround'
" Add extra text objects, e.g. for function arguments
Plug 'wellle/targets.vim'
" Run test under cursor
Plug 'janko-m/vim-test'
" Repeat command works with external plugins
Plug 'tpope/vim-repeat'
" Assisted closing of HTML etc. tags
Plug 'alvan/vim-closetag'
" Automatically close strings and brackets and braces etc.
Plug 'jiangmiao/auto-pairs'
" CSS3 Syntax
Plug 'hail2u/vim-css3-syntax'
" See CSS colours within Vim
Plug 'ap/vim-css-color'
" Needed solely to get textobj-function-syntax working
Plug 'kana/vim-textobj-function'
Plug 'haya14busa/vim-textobj-function-syntax'
" Needed only for vim-textobj-rubyblock dependency
Plug 'kana/vim-textobj-user'
" Call external programs to format code
Plug 'Chiel92/vim-autoformat'
" Fuzzy search
Plug 'junegunn/fzf.vim'
" Handy bracket mappings ]q, ]<space>, etc.
Plug 'tpope/vim-unimpaired'
" Syntax highlighting for postgres
Plug 'lifepillar/pgsql.vim'
" Convert to snake, camel, dash, or dot case
Plug 'tpope/vim-abolish'
" Support editorconfig files (e.g. in PHP)
Plug 'editorconfig/editorconfig-vim'

" Async-vim is only here because it is required by vim-lsp
Plug 'prabirshrestha/async.vim'
" Languages server protocol connection
Plug 'prabirshrestha/vim-lsp'

" Language specific
Plug 'pangloss/vim-javascript'
" Provides JSX indentation
Plug 'maxmellon/vim-jsx-pretty'
Plug 'elzr/vim-json'

Plug 'leafgarland/typescript-vim'

Plug 'vim-ruby/vim-ruby'
" Adds Ruby block objects
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'

" Text objects for python
Plug 'jeetsukumaran/vim-pythonsense'

" Modern PHP syntax highlighting
Plug 'StanAngeloff/php.vim'
" Blade PHP templates
Plug 'jwalton512/vim-blade'
" Autocomplete functionality
Plug 'prabirshrestha/asyncomplete.vim'
" Autocomplete source - the buffer
Plug 'prabirshrestha/asyncomplete-buffer.vim'
" Autocomplete source - files
Plug 'prabirshrestha/asyncomplete-file.vim'
" Autocomplete source - language server protocol
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Autocomplete source - Ultisnips
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
" Autocomplete source - ctags
Plug 'prabirshrestha/asyncomplete-tags.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let mapleader=","

" vim-lsp setup
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  echom "loaded"
  " Find definition of word under cursor
  nnoremap <buffer> <leader>ld :LspDefinition<CR>
  " Find callers of word under cursor
  nnoremap <buffer> <leader>lr :LspReferences<CR>
  " Rename symbol throughout project
  nnoremap <buffer> <leader>lR :LspRename<CR>
  " Show docs (e.g. from libraries)
  nnoremap <buffer> <leader>lK :LspHover<CR>
  " Format document layout
  nnoremap <buffer> <leader>lf :LspDocumentFormat<CR>
endfunction
augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Ultisnips must come before autocomplete declaration, possibly
" Because of clash with trigger keys.
"
" Snippets keyboard shortcuts that don't clash
let g:UltiSnipsExpandTrigger="<c-q>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" Weirdly needed to work with Neovim
let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']
" How UltiSnips splits window when editting snippets
let g:UltiSnipsEditSplit="vertical"

" Address (likely temporary bug) whereby LSP completions with asyncomplete
" Ate two characters following insertion
let g:lsp_text_edit_enabled = 0
" Ruby lsp
" Prerequisites:
" > gem install solargraph
" TODO: Get eruby filetype working. Not enough to add to whitelist, seemingly.
au User lsp_setup call lsp#register_server({
      \ 'name': 'solargraph',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bundle exec solargraph stdio']},
      \ 'initialization_options': {"diagnostics": "true"},
      \ 'whitelist': ['ruby'],
      \ })

" Prerequisites
" > go get github.com/mattn/efm-langserver
" ERB, YAML and Markdown
augroup LspEFM
  au!
  autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'efm-langserver',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, '~/go/bin/efm-langserver -c ~/.config/efm-langserver/config.yaml']},
      \ 'whitelist': ['vim', 'eruby', 'markdown', 'yaml', 'html', 'sql'],
      \ })
augroup END

" JavaScript and Typescript LSP
" Prerequisites:
" $ npm install -g typescript typescript-language-server
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
      \ 'name': 'javascript support using typescript-language-server',
      \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
      \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
      \ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
      \ })
else
  echom "ERROR: JavaScript language server not found"
endif

" Python LSP
" Prerequisites:
" $ pip3 install python-language-server
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
else
  echom "ERROR: Python language server not found"
endif

" PHP LSP
" Prerequisites: $ npm install -g intelephense@1.0
" (The latest version had no autocomplete)
if executable('intelephense')
au User lsp_setup call lsp#register_server({
    \ 'name': 'intelephense',
    \ 'cmd': {server_info->['intelephense', '--stdio']},
    \ 'initialization_options': {"storagePath": "/tmp/intelephense"},
    \ 'whitelist': ['php'],
    \ })
else
  echom "Error: PHP language server not found"
endif

" C LSP
" Prerequisites: $ brew install llvm
augroup lsp_clangd
  autocmd!
  autocmd User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->[&shell, './clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
augroup end

" Using asyncomplete-buffer.vim
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ 'config': {
    \    'max_buffer_size': 5000000,
    \  },
    \ }))


" Using asyncomplete-file.
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))


" Using Ultisnips
call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
      \ 'name': 'ultisnips',
      \ 'whitelist': ['*'],
      \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
      \ }))

" Using Ctags
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
    \ 'name': 'tags',
    \ 'whitelist': ['c', 'ruby'],
    \ 'completor': function('asyncomplete#sources#tags#completor'),
    \ 'config': {
    \    'max_file_size': 50000000,
    \  },
    \ }))
" Uncomment the following to debug `lsp` and autocomplete
"
" Log vim lsp actions
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('/tmp/vim-lsp.log')
" Log autocomplete actions
"let g:asyncomplete_log_file = expand('/tmp/asyncomplete.log')

" This works similarly to ALE. I am not sure whether
" I want to fully delegate this task to ALE.
let g:lsp_diagnostics_enabled = 0

" Tab to autocomplete with Asyncomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-e> pumvisible() ? asyncomplete#cancel_popup() : "\<C-e>"
" Ack-vim
" Use rg (ripgrep)
let g:ackprg = 'rg --vimgrep'
" Setup keyboard shortcut.
noremap <Leader>a :Ack! <left>
" Ack but literal match instead of regex

" Indent Guides - enable plugin
let g:indent_guides_enable_on_vim_startup = 1

" Vim-jsx: Enable JSX indentation in normal JS files
let g:jsx_ext_required = 0

" MatchTagAlways - enable for JSX
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'xhtml' : 1,
      \ 'xml' : 1,
      \ 'jinja' : 1,
      \ 'jsx' : 1,
      \ 'javascript' : 1
      \}

" MatchTagAlways - Jump to matched tag
nnoremap <leader>% :MtaJumpToOtherTag<cr>

" Execute file (assumes a guiding shebang is present )
nnoremap <leader>2 :w<CR>:! ./%<cr>
autocmd FileType c nnoremap <leader>2 :w \| :! make %:r && ./%:r <CR>

" Python
autocmd FileType python call SetPythonOptions()
function! SetPythonOptions()
  " Execute
  " Wrap in logging
  nmap <leader>p yssfprint<cr>
endfunction

" Closetag - expand to extra files
let g:closetag_filenames = '*.html,*.erb, *.xhtml,*.xml,*.js,*.jsx,*.html.erb,*.md,*.blade.php'
let b:closetag_emptyTags= '^\(area\|base\|br\|col\|command\|embed\|hr\|img\|input\|keygen\|link\|meta\|param\|source\|track\|wbr\)$'
" Skip closing a tag
let g:closetag_close_shortcut = '<leader>>'

" Integrate fzf via Homebrew
set rtp+=/usr/local/opt/fzf
" Integrate fzf via install on servers
set rtp+=~/.fzf

" Shortcuts for using fzf in vim
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>t :Tags<cr>
" Focus on a particular window
noremap <leader>w :Windows<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>r :Rg<cr>
" RG for word under cursor
nnoremap <silent> <Leader>ur :Rg <C-R><C-W><CR>
nnoremap <leader>v :Commands<cr>
" Shortcuts for opening up results in splits
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Needed for vim-textobj-rubyblock
runtime macros/matchit.vim

" Surround-vim addition to delete a function
nmap <silent> dsf ds)db

" Vim-better-whitespace always automatically remove
let g:strip_whitespace_on_save=1
" Do not confirm
let g:strip_whitespace_confirm=0

" Consider entities containing hyphens to be words. Originally css/scss only
"set iskeyword+=-
set iskeyword+=$

" Auto-pairs plugin
let g:AutoPairsShortcutToggle = '<leader>p'
" Handle nested pairs better
let g:AutoPairsMultilineClose = 0

" Harmonize splitjoin with Rubocop's minimization of braces in method signatures
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0

let g:ale_completion_enabled = 0

let g:ale_fix_on_save = 1

" Handle when we have installed local binaries with composer
let g:ale_php_phpstan_executable = "./vendor/bin/phpstan"

let g:ale_linters = {
      \ 'python': ['flake8', 'pyls'],
      \ 'php': ['php', 'php_cs_fixer', 'phpstan', 'intelephense'],
      \ 'ruby': ['solargraph', 'ruby'],
      \ 'yaml': ['yamllint'],
      \ 'json': ['jsonlint']
      \ }
let g:ale_fixers = {
      \ 'scss': ['stylelint'],
      \ 'javascript': ['eslint'],
      \ 'python': ['autopep8', 'isort'],
      \ 'ruby': ['rubocop']
      \ }

" Le for Lint Error
nmap <silent> <leader>le :ALENext<cr>

" The commands built-into ALE for turning it off still let switchers be active.
function! JACKtoggleALE()
  if (g:ale_fix_on_save == 1)
    let g:ale_fix_on_save=0
    :ALEDisable
    :echo "Linting disabled"
  else
    let g:ale_fix_on_save=1
    :ALEEnable
    :echo "Linting enabled"
  endif
endfunction

command! LintOff call JACKtoggleALE()
command! LintOn call JACKtoggleALE()

" Set filetype correctly for JSON-based lint config files
au BufNewFile,BufRead .eslintrc set filetype=json
au BufNewFile,BufRead .stylelintrc set filetype=json

" Airline - connect to ALE
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" Tell Vim JavaScript that you use Flow (gives syntax highlighting)
let g:javascript_plugin_flow = 1

" Shortcuts for vim-test
" Run test under cursor
nmap <silent> <space>tu :w \| :TestNearest<CR>
" Run current file (otherwise last file)
nmap <silent> <space>tf :TestFile<CR>
" Visit last test you ran
nmap <silent> <space>tl :TestLast<CR>
let g:test#preserve_screen = 1

let test#ruby#rspec#executable = 'bin/rspec'

" Allow neovim Ruby provider to be RVM system ruby instead
" Of per project
"let g:ruby_host_prog = 'rvm system do neovim-ruby-host'
"
" Enable folding by default
let ruby_fold = 1
" Set what you want to be folded
let ruby_foldable_groups = 'def'

"Switch to alternate JS files
let g:rails_projections = {
      \ "app/webpacker/javascript/__tests__/*.spec.js": { "alternate": "app/webpacker/javascript/{}.js" },
      \ "app/webpacker/javascript/*.js": { "alternate": "app/webpacker/javascript/__tests__/{}.spec.js" }
      \ }

" Tell pgsql.vim to treat all sql files as postgres
let g:sql_type_default = 'pgsql'

" Assumes sqlformat is installed
autocmd BufWritePost *.sql :% !sqlformat --reindent --keywords upper --identifiers lower --wrap_after 80 -

" Hide buffers instead of closing them
set hidden
set history=5000
" Use many muchos levels of undo
set undolevels=1000

" Write even though you did not sudo to begin with: w!!
cmap w!! w !sudo tee % >/dev/null

" Truecolor in the terminal
set termguicolors
" Configuration to work with palenight.vim color scheme
set background=dark
colorscheme palenight
let g:airline_theme = "palenight"
" Italics enabled
let g:palenight_terminal_italics=1
syntax on

" Override background color to be as dark as the terminal
highlight Normal guibg=Black
" Highlight non-ascii characters them in an obvious color
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Green ctermbg=2

" Enable line numbering
set number
set relativenumber

" Turn click-me warnings about swapfiles into discreet little messages
set shortmess+=A

" Enable backup
set backup
set backupdir=~/.local/share/nvim/backup

" Undo even after leaving vim
set undofile

set hlsearch
" Removes highlighting from last search
nmap <silent> <leader>/ :nohlsearch<CR>

" Display long lines as just one line (you have to scroll horizontally)
set nowrap
" Tabsize
set tabstop=2
" Reindent operations (<< and >>)
set shiftwidth=2
set expandtab
" Display spaces and tabs and oddities (like non-breaking white-space)
set list
set smartindent
set autoindent
set textwidth=80

" Connect tags file
" Look in current dir first, then up to containing_dir
set tags+=./tags;,tags;
" On writing a file of the following types
au BufWritePost &.c,*.rb,*.js,*.php,*.py silent! ctags &

" Search as characters are entered
set incsearch
" Ignore case when searching
set ignorecase

" Shortcut for opening/closing quickfix
nnoremap <leader>q :ccl<cr>

" Ignore hated files generally at vim level (Some autocomplete engines picks up
" on and add their own ignored files to the mix)
set wildignore+=*.swp,*.bak,*.pyc,*.class,*/tmp/*

map <leader>n :NERDTreeToggle<CR>

" Automatically reload .vimrc file on save
augroup myvimrc
  au!
  au BufWritePost .vimrc so ~/.vimrc
augroup END

set spelllang=en_us
set spellfile=$HOME/.vim/spell/en.utf-8.add
" Automatic spell check in all files

set nospell
autocmd filetype markdown,txt set spell spelllang=en_us

" Show code blocks with syntax highlighting. This is a VIM built-in.
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'c', 'ruby', 'javascript', 'php']

" Fix bug where MacVim screen goes blank when
" Returning to vim from another program
:au FocusGained * :redraw!

set clipboard=unnamedplus

" This unsets the 'last search pattern'. Register by hitting return
nnoremap <CR> :noh<CR><CR>

" Live view of substitutions when you type %s/foo/bar
:set inccommand=nosplit

" Mostly for solving git merge conflicts
:set diffopt=vertical

imap jj <ESC>

autocmd filetype json,blade,eruby setlocal nofoldenable
" Set folder color to white
highlight Folded guifg=white

" Delete buffer and move to the next one without closing split
nmap <leader>d :bp\|bd #<cr>
nmap <leader>z :cd %:p:h<cr>\| :NERDTreeCWD<cr>

" Save my fingers when saving
nmap <space>w :w<cr>

" Copy current path into the paste buffer
nmap <space>fp :let @+=expand("%:p")<cr>

" Automatically reload file when underlying files change (e.g. git)
set autoread

" By default, swap out all instances in a line during substitutions
set gdefault

" Remove excess # when joining two lines of comments
set formatoptions+=j

" Keep same flags when repeating a substitution
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Swap the word the cursor is on with the next word (which can be on a
" newline, and punctuation is 'skipped'):
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>

" Use <Leader>Esc to leave terminal mode
tnoremap <Leader><Esc> <C-\><C-n>
tnoremap <Leader>jj <C-\><C-n>

" Shortcuts for frequently accessed files
command! Vimrc e ~/.vimrc
command! Zshrc e ~/.zshrc
command! Diary e ~/code/code-diary/todo.md
command! Gitconfig e ~/.gitconfig
command! DotsREADME e ~/README-for-dotfiles.md
command! Pokemon e ~/Documents/fresh-pokemon.md
" Project based TODO list
command! TODO e ./kinsella-todo.md
