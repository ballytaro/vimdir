set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'                            
Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'groenewege/vim-less' 
Plugin 'isRuslan/vim-es6'
Plugin 'mxw/vim-jsx'
Plugin 'ternjs/tern_for_vim'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/emmet-vim'
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

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

map <C-m> :NERDTreeToggle<CR>

" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

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
set noswapfile
set nobackup
set nowb

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
let g:jsx_ext_requird = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['standard'] 
"let g:syntastic_javascript_standard_generic = 1 
"let g:syntastic_javascript_checkers = ['eslint'] 
"let g:syntastic_javascript_eslint_exec = 'eslint'

let g:NERDTreeWinSize = 36

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

fu! SaveSession()
    execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSession()
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

fu! InitEslint()
    if filereadable(getcwd() . './node_modules/.bin/eslint')
        let g:syntastic_javascript_checkers = ['eslint']
        let g:syntastic_javascript_eslint_exec = './node_modules/.bin/eslint'
    else
        let g:syntastic_javascript_checkers = ['eslint'] 
        let g:syntastic_javascript_eslint_exec = 'eslint'
    endif
endfunction

autocmd VimEnter * call InitEslint()

colorscheme monokai
