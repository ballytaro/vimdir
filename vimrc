set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'

Plugin 'pangloss/vim-javascript'
Plugin 'three/yajs.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'isRuslan/vim-es6'
Plugin 'mxw/vim-jsx'
Plugin 'groenewege/vim-less' 
Plugin 'digitaltoad/vim-jade'
Plugin 'mattn/emmet-vim'
Plugin 'lepture/vim-velocity'

call vundle#end()
filetype plugin indent on

set showcmd
set showmode
set autoread
set cindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set clipboard=unnamed
set incsearch
set hlsearch
set noswapfile
set nobackup
set nowb

set foldmethod=syntax
set foldnestmax=8
set foldlevelstart=99

set number
syntax on
set backspace=2
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set completeopt=preview,menu
set confirm
set iskeyword+=_,$,@,%,#,-
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*)}

let g:ycm_complete_in_comments = 1 
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:vim_markdown_folding_disabled = 1
let g:javascript_enable_domhtmlcss = 1
let g:jsx_ext_requird = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:NERDTreeWinSize = 36
let g:NERDTreeShowHidden = 1

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
map <C-m> :NERDTreeToggle<CR>

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

function! SaveSession()
    execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

function! RestoreSession()
    if filereadable(getcwd() . '/.session.vim')
        execute 'so ' . getcwd() . '/.session.vim'
        if bufexists(1)
            for l in range(1, bufnr('$'))
                if bufwinnr(l) == -1
                    exec 'sbuffer ' . l
                endif
            endfor
        endif
    endif
    syntax on
endfunction

autocmd VimLeave * NERDTreeClose
autocmd VimLeave * call SaveSession()

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd l

colorscheme monokai
