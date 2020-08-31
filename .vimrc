call plug#begin('~/.vim/plugged')

" NerdTree
Plug 'scrooloose/nerdtree'

" Dracula Theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" vimagit
Plug 'jreybert/vimagit'

" NERD Commenter
Plug 'scrooloose/nerdcommenter'

" vimicons
Plug 'ryanoasis/vim-devicons'

" OmniSharp
Plug 'OmniSharp/omnisharp-vim'
Plug 'prabirshrestha/asyncomplete.vim'

if has('python3')
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
endif


call plug#end()

" General Config
filetype plugin indent on
let mapleader="\\"
set clipboard=unnamed
set nu rnu
syntax on
set renderoptions=type:directx
set tabstop=8
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set nocompatible
set backspace=2
set backup
set backupdir=~/temp
set dir=~/temp
if has("gui_running")
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar

"    set guifont=FuraMono_Nerd_Font_Mono:h11:cANSI
    set guifont=Ellograph_CF_Regular:h11:cANSI
    set encoding=utf8
    if has("win32") || has("win64") || has("win16")
        set renderoptions=type:directx
    endif
endif

" NERDTree config
map <silent> <C-n> :NERDTreeToggle<CR>

" CtrlP config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" Ignore files in ignore
let g:ctrlp_user_command = ['', 'cd %s && git ls-files -co --exclude-standard']

" Dracula Theme
color dracula

" Airline Config
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline#extensions#vimagit#enabled = 1

" NERDCommenter config
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" Asyncomplete tab completion
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <c-Tab> pumvisible() ? "\<C-p>" : "\<c-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
if has('python3')
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsExpandTrigger="<S-Tab>"
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
endif
