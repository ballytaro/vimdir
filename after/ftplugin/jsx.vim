setlocal shiftwidth=2
setlocal tabstop=2

function! InitEslint()
    if filereadable(getcwd() . './node_modules/.bin/eslint')
        let g:syntastic_javascript_checkers = ['eslint']
        let g:syntastic_javascript_eslint_exec = './node_modules/.bin/eslint'
    else
        let g:syntastic_javascript_checkers = ['eslint'] 
        let g:syntastic_javascript_eslint_exec = 'eslint'
    endif
endfunction

autocmd VimEnter * call InitEslint()
