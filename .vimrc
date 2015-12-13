""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc file
"

" PATHOGEN
execute pathogen#infect()
"
"Airline
let g:airline_theme = "powerlineish"
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

"ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.dmg,*.doc,*.pdf,*.docx,*.png,*.jpeg,*.jpg,*.app,*.mp3,*.flac,*.mp4,*.mkv,*.nfo,*.webloc,*.plist,*.epub,*.sqlite,*.srt,*.ape,*.key,*.pptx,*.psd,*.pages,*.avi,*.sfv,*.cache,*.mobi,*.log,*.cue,*.search?,*.rst,*.search*
let g:ctrlp_root_directory = "../../"

"NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

"remap buffer switching
map <Tab> :bnext<CR>
:nmap <C-w> :bd<CR>

"line numbers
:nmap <C-l> :set invrelativenumber<CR>
highlight LineNr ctermfg=grey

"so I can paste with the mouse (hit F2 to toggle)
"set pastetoggle=<F2>
:nmap <F2> :r !pbpaste<CR>
set clipboard=unnamed

"
" auto backups
"set backup
" backup file name extension
"set backupext=.foo

" no autowrap of lines
set wrapmargin=0
"
" have fifty lines of command-line (etc) history:
set history=50
"
" have command-line completion <Tab> (for filenames, help topics, option names)
" first list the available options and complete the longest common part, then
" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full
"
" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd
"
" use indents of 2 spaces, and have them copied down lines:
set shiftwidth=2
" Rich and PEP 8 say 4 spaces....uncomment this if you want 4 spaces
" set shiftwidth=4
set shiftround
set expandtab
set autoindent
"
" enable filetype detection:
filetype on
filetype indent on
filetype plugin on

"set term=builtin_ansi
syntax enable
colo vendetta
let g:molokai_original = 1
let g:rehash256 = 1

" in human-language files, automatically format everything at 72 chars:
autocmd FileType mail,human set formatoptions+=t textwidth=72

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for python
autocmd FileType python setlocal expandtab shiftwidth=2 softtabstop=2

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" use <F6> to cycle through split windows (and <Shift>+<F6> to cycle backwards,
" where possible):
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W

" python run with F9
map <f9> :w<CR>:!python %<CR>

" ####

"
"
" end .vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
