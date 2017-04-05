autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype cpp setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype java setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

"au FileType cpp set tags^=/home1/irteam/worksOne/oneapp-api/tags
au FileType java set tags^=/home1/irteam/worksOne/oneapp-im/tags

"FlexibleTagsStart
set tags=/home1/irteam/worksOne/mqtt-proxy-auth/tags
"FlexibleTagsEnd

"FixedTagsStart
"set tags=/home1/irteam/my_directory/oneapp-api/tags
"set tags=/home1/irteam/worksOne/oneapp-api/tags
"set tags=/home1/irteam/worksOne/carbon/tags
"FixedTagsEnd

set nu " 행번호 표시
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
set hlsearch  " 검색어 강조, set hls 도 가능
set nocompatible " 오리지날 VI와 호환하지 않음
set nowrapscan " 검색할 때 문서의 끝에서 처음으로 안돌아감
set visualbell " 키를 잘못눌렀을 때 화면 프레시
set ruler " 화면 우측 하단에 현재 커서의 위치(줄,칸) 표시
" set ignorecase " 검색시 대소문자 무시, set ic 도 가능
" set incsearch "  키워드 입력시 점진적 검색

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
