autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype c setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype cpp setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype java setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType go setlocal noexpandtab tabstop=8

"FlexibleTagsStart
set tags=/home1/irteam/worksOne/oneapp-im/tags
"FlexibleTagsEnd

set nu " 행번호 표시
set laststatus=2 " 0: status line 을 보여주지 않음, 2: 항상 보여줌
set cursorline
set autoindent
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
set encoding=utf-8
set mouse=a
set nobackup
set nowritebackup
set noswapfile
set hlsearch  " 검색어 강조, set hls 도 가능
set nocompatible " 오리지날 VI와 호환하지 않음
"set nowrapscan " 검색할 때 문서의 끝에서 처음으로 안돌아감
set visualbell " 키를 잘못눌렀을 때 화면 프레시
set ruler " 화면 우측 하단에 현재 커서의 위치(줄,칸) 표시
" set ignorecase " 검색시 대소문자 무시, set ic 도 가능
" set incsearch "  키워드 입력시 점진적 검색(Highlight dynamically)
" set title " Show the filename in the window titlebar
set list
set listchars=tab:¦\ , " with white space

" command
" resize +5(or -5) " split mode window size 변경
" vertical resize +5(or -5) " vertical split mode window size 변경

syntax on

" for golang syntax highlight in mac
au BufRead *.go set filetype=go
au BufNewFile *.go set filetype=go
" golang syntax end

" set pathogen
filetype on
execute pathogen#infect()
filetype plugin indent on
" pathogen end

" set vim leave
" remove extraneous ".netrwhist" file
autocmd VimLeave * if filereadable("/home1/irteam/.vim/.netrwhist") | call delete("/home1/irteam/.vim/.netrwhist") | endif
" vim leave end

" set vim enter
" execute ctags-change-in-vimrc.sh
autocmd VimEnter * if filereadable("/home1/irteam/my_directory/scripts/ctags/ctags-change-in-vimrc.sh") | :silent !ctags-change-in-vimrc.sh | endif
" vim enter end

" define function
func! Sts()
	let st = expand("<cword>")
	exe "sts ".st
endfunc

func! Tj()
	let st = expand("<cword>")
	exe "tj ".st
endfunc

" Find file in current directory and edit it.
function! Find(name,...)
	let a:filetype = get(a:, 1, "") " get args2 and set default value

	if strlen(a:filetype) == 0
		let l:list=system("find . -iname '".a:name."*"."' | egrep --color=never -v '\\.o|\\.d' | perl -ne 'print \"$.\: $_\"'")
	else
		let l:list=system("find . -iname '".a:name."*"."' | grep --color=never '".a:filetype."' | perl -ne 'print \"$.\: $_\"'")
	endif
	let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
	if l:num < 1
		echo "'".a:name."' not found"
		return
	endif
	if l:num != 1
		echo l:list
		let l:input=input("Which ? (ENTER=nothing)\n")
		if strlen(l:input)==0
			return
		endif
		if strlen(substitute(l:input, "[0-9]", "", "g"))>0
			echo "Not a number"
			return
		endif
		if l:input<1 || l:input>l:num
			echo "Out of range"
			return
		endif
		let l:line=matchstr("\n".l:list, "\n".l:input.": [^\n]*")
	else
		let l:line=l:list
	endif
	let l:line=substitute(l:line, "^[^ ]* ./", "", "")
	execute ":e ".l:line
endfunction
command! -nargs=* Find :call Find(<f-args>)

" Find text in current directory and edit it.
function! Search(keyword,...)
	let a:filetype = get(a:, 1, "") " get args2 and set default value

	if strlen(a:filetype) == 0
		let l:list=system("find . -type f -name \"*.cpp\" -o -name \"*.h\" -o -name \"*.idl\" -o -name \"*.java\" -o -name \"*.go\" | xargs grep --color=never ".a:keyword." | perl -ne 'print \"$.\: $_\"'")
	else
		let l:list=system("find . -type f -name *.".a:filetype." | xargs grep -i --color=never ".a:keyword." | perl -ne 'print \"$.\: $_\"'")
	endif
	let l:num=strlen(substitute(l:list, "[^\n]", "", "g"))
	if l:num < 1
		echo "'".a:name."' not found"
		return
	endif
	if l:num != 1
		echo l:list
		let l:input=input("Which ? (ENTER=nothing)\n")
		if strlen(l:input)==0
			return
		endif
		if strlen(substitute(l:input, "[0-9]", "", "g"))>0
			echo "Not a number"
			return
		endif
		if l:input<1 || l:input>l:num
			echo "Out of range"
			return
		endif
		let l:line=matchstr("\n".l:list, "\n".l:input.": [^\n\t]*")
	else
		let l:line=l:list
	endif
	let l:line=substitute(l:line, "^[^ ]* ./", "", "")
	let l:line=l:line[0:strlen(l:line)-2]
	execute ":e ".l:line
endfunction
command! -nargs=* Search :call Search(<f-args>)

"function! InsertTabWrapper()
"    let col = col('.')-1
"    if !col||getline('.')[col-1]!~'\k'
"        return "\<TAB>"
"    else
"        if pumvisible()
"            return "\<C-N>"
"        else
"            return "\<C-N>\<C-P>"
"        end
"    endif
"endfunction
" define function end

" cursor move to last position
" if not working, check .viminfo permission
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
        \ execute("normal `\"") |
    \ endif
" cusor move end

" key mapping
nmap <C-a> :TagbarToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap <C-i> :IndentLinesToggle<CR>
nmap <C-x> :noh<CR>
" function folding
nmap <F1> v]}zf
" function open
nmap <F2> zo
nmap ,st :call Sts()<CR>
nmap ,tj :call Tj()<CR>
nmap <Leader>p :set paste<CR>i
" File find by name(+filetype)
nmap <Leader>f :Find<SPACE>
" Text search by keyword(+filetype)
nmap <Leader>s :Search<SPACE>
nmap <Leader>b :e#<CR>
"inoremap <tab> <c-r>=InsertTabWrapper()<cr> " for autocomplpop use tab key

nnoremap <silent> <Leader>= :exe "resize +3"<CR>
nnoremap <silent> <Leader>- :exe "resize -3"<CR>
nnoremap <silent> <Leader>] :exe "vertical resize +3"<CR>
nnoremap <silent> <Leader>[ :exe "vertical resize -3"<CR>
" key mapping end

" set vim theme
colors solarized8_dark_flat

" remove tab background color
hi SpecialKey ctermfg=239 ctermbg=NONE
