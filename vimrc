set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" 语法检测
Plugin 'scrooloose/syntastic'
" 文件搜索
Plugin 'kien/ctrlp.vim'
" 状态栏
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" 目录树
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" 注释
Plugin 'scrooloose/nerdcommenter'
" 自动补全
Plugin 'Valloric/YouCompleteMe'
" 垂直对齐
Plugin 'godlygeek/tabular'
"Plugin 'vim-scripts/taglist.vim'
" Tag浏览
Plugin 'majutsushi/tagbar'
" Markdown
Plugin 'plasticboy/vim-markdown'
"Plugin 'Shougo/neocomplcache.vim'
" 多光标操作
Plugin 'terryma/vim-multiple-cursors'
" surroundings
Plugin 'tpope/vim-surround'
" HTML、XML 标签跳转
Plugin 'vim-scripts/matchit.zip'
" 符号自动补全
Plugin 'Raimondi/delimitMate'
" Visual模式增强
Plugin 'terryma/vim-expand-region'
" Undo工具
Plugin 'mbbill/undotree'
" git命令行
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
" 快速跳转
Plugin 'easymotion/vim-easymotion'
" grep工具
Plugin 'mhinz/vim-grepper'
" 文件对比
Plugin 'AndrewRadev/linediff.vim'
"Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" 自动保存
"Plugin 'vim-scripts/vim-auto-save'
"Plugin 'garbas/vim-snipmate'
"Plugin 'fholgado/minibufexpl.vim'
" 查找
Plugin 'vim-scripts/FuzzyFinder'
" snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

"Plugin 'thiderman/nginx-vim-syntax'
"Plugin 'jiangmiao/auto-pairs'

Plugin 'Chiel92/vim-autoformat'
Plugin 'mileszs/ack.vim'
"Plugin 'vim-scripts/ShowMarks'

" For front-end
Plugin 'ternjs/tern_for_vim'
Plugin 'yuezk/xtpl.vim'
Plugin 'mxw/vim-jsx'
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'ap/vim-css-color'
"Plugin 'othree/yajs.vim'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'groenewege/vim-less' 
Plugin 'digitaltoad/vim-jade'
Plugin 'mattn/emmet-vim'
Plugin 'lepture/vim-velocity'
Plugin 'tpope/vim-eunuch'
Plugin 'yuezk/weex.vim'
Plugin 'leafgarland/typescript-vim'

" For Golang
Plugin 'fatih/vim-go'
Bundle 'Blackrush/vim-gocode'
Plugin 'nsf/gocode', {'rtp': 'vim/'}

call vundle#end()
filetype plugin indent on

set showcmd
set showmode
set autoread
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set clipboard=unnamed
set incsearch
set hlsearch
set noswapfile
set nobackup
set nowb
set cursorcolumn
set cursorline
set nowrap
set ignorecase

set foldmethod=indent
set foldnestmax=8
set foldlevelstart=99

set number
set relativenumber
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
set previewheight=20
set wildchar=<Tab> wildcharm=<C-z> wildmenu wildmode=full
set tags=tags
set wildignore=node_modules,build,demo,mui,.git,track,*.vim,*.log,tags

" 使用Gdiff时默认垂直划分窗口
set diffopt+=vertical

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_no_updatetime = 1

" YCM
let g:ycm_complete_in_comments = 1 
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

let g:vim_markdown_folding_disabled = 1
let g:javascript_enable_domhtmlcss = 1
let g:jsx_ext_requird = 0

" syntastic
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['eslint']

let g:NERDTreeWinSize = 36
let g:NERDTreeShowHidden = 1
"let g:typescript_indent_disable = 1

" 全局搜文件时忽略的目录和文件
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn|rvm)|node_modules|build|tags)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc|session.vim|gitignore)$',
    \ }

" snippets
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsEditSplit="vertical"
"ActivateAddons vim-snippets snipmate
"
"let g:miniBufExplMapCTabSwitchBufs = 1

imap <F6> <C-x><C-o>  

"let g:delimitMate_expand_cr = 1

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
map <C-m> :NERDTreeToggle<CR>

"noremap <C-b> :b <C-n>

" 缩进后再次选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" map <F1> :execute "Ack /" . expand("<cword>") <Bar> cw<CR>

nnoremap <F2> :set number! number?<CR>
" F3 显示可打印字符开关
nnoremap <F3> :set list! list?<CR>
" F4 换行开关
nnoremap <F4> :set wrap! wrap?<CR>
" F5切换paste模式
nnoremap <F5> :set paste! paste?<CR>
" F6 语法开关，关闭语法可以加快大文件的展示
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
" F7 打开tagbar
nnoremap <F7> :TagbarToggle<CR>

" 解决git冲突时用
nnoremap <F8> :diffget //2<CR>
nnoremap <F9> :diffget //3<CR>
nnoremap <F10> :diffupdate<CR>

noremap <Leader>a :Ack! <cword><cr>

" F5 set paste问题已解决, 粘贴代码前不需要按F5了
" F5 粘贴模式paste_mode开关,用于有格式的代码粘贴
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

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

function! InitEslint()
    if filereadable(getcwd() . './node_modules/.bin/eslint')
        let g:syntastic_javascript_eslint_exec = './node_modules/.bin/eslint'
    else
        let g:syntastic_javascript_eslint_exec = 'eslint'
    endif
endfunction

autocmd VimEnter * call InitEslint()

autocmd VimLeave * NERDTreeClose
autocmd VimLeave * call SaveSession()

autocmd VimEnter * wincmd l
autocmd VimEnter * NERDTree
"autocmd VimEnter * TagbarToggle

colorscheme monokai
au BufNewFile,BufRead *.vue set filetype=html
au BufNewFile,BufRead *.jsx set filetype=js
"au BufNewFile,BufRead *.tsx set filetype=js

" source helloworld.vim

