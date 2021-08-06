if has("nvim")
	let g:plug_home = stdpath('data') . '/plugged'
endif

if (has("termguicolors"))
	set termguicolors
endif



call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'


Plug 'andymass/vim-matchup'

Plug 'drewtempelmeyer/palenight.vim'

Plug 'majutsushi/tagbar'
nmap <leader>t :TagbarToggle<CR>

"Plug 'Shougo/defx.nvim'
"Plug 'kristijanhusak/defx-git'
"Plug 'kristijanhusak/defx-icons'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'glepnir/galaxyline.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239			" 设置缩进线颜色
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileTypeExclude = ['calendar', 'floaterm']
let g:indentLine_concealcursor = ''
let g:indentLine_char = '|'
"let g:indentLine_char = '¦' 
nnoremap <leader>ig :IndentLinesToggle <CR>
"Plug 'nathanaelkane/vim-indent-guides'

Plug 'norcalli/nvim-colorizer.lua'


Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'folke/lsp-colors.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/completion-nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/trouble.nvim'


Plug 'vim-airline/vim-airline'
let g:airline_theme='palenight'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
"let g:airline#extensions#tabline#fnamecollapse = 0

"Plug 'romgrk/barbar.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

call plug#end()

"let g:airline_theme_patch_func = 'AirlineThemePatch'
"function! AirlineThemePatch(palette)
"	if g:airline_theme == 'palenight'
"		for colors in values(a:palette.inactive)
"			let colors[3] = 245
"		endfor
"	endif
"endfunction
