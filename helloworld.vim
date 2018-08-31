function! HelloWorld()
    echo "Hello, world!"
endfunction

command -nargs=0 HelloWorld call HelloWorld()
