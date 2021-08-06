let g:mapleader=","
let g:maplocalleader=';'
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/plugs.vim



augroup user_events
	autocmd!
augroup END

set nocompatible
set mouse-=a
set encoding=utf-8
set number
set relativenumber
set clipboard^=unnamed,unnamedplus
set noswapfile
set tabstop=2
set shiftwidth=2

set title
set hlsearch
set ignorecase
set smartcase

set laststatus=2
set nowrap

set hidden
set t_Co=256

set scrolloff=3

" Set cursor line color on visual mode
"highlight visual cterm=none ctermbg=236 ctermfg=none guibg=grey40

"highlight linenr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000
"hi visual term=reverse cterm=reverse guibg=grey
"hi visual cterm=none ctermbg=darkgrey ctermfg=cyan


augroup bghighlight
  autocmd!
  autocmd winenter * set cul
  autocmd winleave * set nocul
augroup end

highlight visual cterm=none ctermbg=76 ctermfg=16 gui=none guibg=#5fd700 guifg=#000000

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

if has('termguicolors')
	if empty($COLORTERM) || $COLORTERM =~# 'truecolor\|24bit'
		set termguicolors
	endif
endif

set termguicolors
if &compatible
	" vint: -ProhibitSetNoCompatible
	set nocompatible
	" vint: +ProhibitSetNoCompatible
endif

set background=dark

filetype plugin indent on

"colorscheme Hybrid
colorscheme palenight
let g:palenight_terminal_italics=1

set guifont=Fantasque\ Sans\ Mono:h12

set autoindent
set splitright
set splitbelow
tnoremap <Esc> <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-k> :call OpenTerminal()<CR>
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
"set statusline+=%F
set statusline+=%F

