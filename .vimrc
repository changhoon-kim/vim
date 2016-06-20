autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype cpp setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype java setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
au FileType cpp set tags^=/home1/irteam/worksOne/oneapp-api/tags
"au FileType cpp set tags^=/home1/irteam/my_directory/test-tmp/oneapp-api/tags
au FileType java set tags^=/home1/irteam/worksOne/oneapp-im/tags

set nu
set laststatus=2
"set tags=/home1/irteam/worksOne/oneapp-api/tags
set cursorline
set autoindent
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
set encoding=utf-8
set mouse=a
set nobackup
set nowritebackup
set hlsearch

syntax on

" remove extraneous ".netrwhist" file
autocmd VimLeave * if filereadable("/home1/irteam/.vim/.netrwhist") | call delete("/home1/irteam/.vim/.netrwhist") | endif

if version >= 500
func! Sts()
	let st = expand("<cword>")
	exe "sts ".st
endfunc
nmap ,st :call Sts()<cr>

func! Tj()
	let st = expand("<cword>")
	exe "tj ".st
endfunc
nmap ,tj :call Tj()<cr>
endif

colors solarized8_dark_flat
