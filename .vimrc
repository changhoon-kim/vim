autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype cpp setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype java setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

"au FileType cpp set tags^=/home1/irteam/worksOne/oneapp-api/tags
au FileType java set tags^=/home1/irteam/worksOne/oneapp-im/tags

"FlexibleTagsStart
set tags=/home1/irteam/worksOne/oneapp-im/tags
"FlexibleTagsEnd

"FixedTagsStart
"set tags=/home1/irteam/my_directory/oneapp-api/tags
"set tags=/home1/irteam/worksOne/oneapp-api/tags
"set tags=/home1/irteam/worksOne/carbon/tags
"FixedTagsEnd

set nu
set laststatus=2
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

autocmd VimEnter * if filereadable("/home1/irteam/my_directory/daily-log/script/ctags-change.sh") | :silent !ctags-change.sh | endif

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
