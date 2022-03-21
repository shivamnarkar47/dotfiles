set splitbelow
set splitright
:set autoread
:set autochdir
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set guifont=JetBrainsMono\ NF:h16

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/sirver/ultisnips' "Snippets
Plug 'honza/vim-snippets'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'voldikss/vim-floaterm'
set encoding=UTF-8

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <C-i> :vsplit inp.txt <bar> <bar> :split out.txt <CR>
nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews
:colorscheme jellybeans


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"Utilsnips

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
autocmd filetype cpp nmap <F5> :!g++ -std=gnu++14 -O2 % -o %:p:h/%:t:r && ./%:r < inp.txt > out.txt <CR>
autocmd filetype c nnoremap <F5> :w <bar> !gcc -std=c99 -lm % -o %:p:h/%:t:r.out && ./%:r.out<CR> 
autocmd filetype java nnoremap <F5> :!javac % && java %:p < inp.txt > out.txt <CR> 
autocmd filetype python nnoremap <F5> :w <bar> !python % <CR> 
autocmd filetype perl nnoremap <F5> :w <bar> !perl % <CR> 
autocmd filetype go nnoremap <F5> :w <bar> !go build % && ./%:p <CR> 
