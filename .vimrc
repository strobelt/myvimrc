call plug#begin('~/.vim/plugged')

" NerdTree
Plug 'https://github.com/scrooloose/nerdtree.git'

" Dracula Theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" CtrlP
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

" vimagit
Plug 'https://github.com/jreybert/vimagit.git'

" NERD Commenter
Plug 'https://github.com/scrooloose/nerdcommenter.git'

call plug#end()

" General Config
filetype plugin on
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
    " set lines=200 columns=100
    au GUIEnter * simalt ~x

    " set guifont=Noto_Mono_for_Powerline:h11:cANSI
    set guifont=Fira_Code:h11:cANSI
    set encoding=utf8
    if has("win32") || has("win64") || has("win16")
        "   set shell=C:/PROGRA~1/Git/git-bash.exe
        set renderoptions=type:directx
        "   set shell=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
    endif

    nnoremap <C-F9> :browse confirm e<CR>
endif

" NERDTree config
map <silent> <C-n> :NERDTreeToggle<CR>

" CtrlP config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Dracula Theme
color dracula

" Airline Config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" NERDCommenter config
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
