"Disabled direction key
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
nnoremap <UP> <NOP>
nnoremap <DOWN> <NOP>
nnoremap <LEFT> <NOP>
nnoremap <RIGHT> <NOP>
nnoremap Q <NOP>

nnoremap <PageUp> <Nop>
nnoremap <PageDown> <Nop>
inoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>

"Mapping key
inoremap jk <Esc>
nnoremap H ^
nnoremap L $
nnoremap ,h H
nnoremap tn gt
nnoremap tp gT


" 跳转 window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <silent> <c-k> :wincmd k<CR>
noremap <silent> <c-j> :wincmd j<CR>
noremap <silent> <c-h> :wincmd h<CR>
noremap <silent> <c-l> :wincmd l<CR>
" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv




"Tab in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


nmap <leader><Space> :nohls<CR>

noremap <leader>rc :e ~/.config/nvim/init.vim<CR>
