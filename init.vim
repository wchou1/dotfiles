"
"
 "______________________ 
"< Wistan's NVIM Config >
 "---------------------- 
        "\   ^__^
         "\  (oo)\_______
            "(__)\       )\/\
                "||----w |
                "||     ||
"
" 

" PLUGINS----------------------------------------------------------------------------{{{
" Vim Plug
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'wikitopian/hardmode'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/a.vim'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'floobits/floobits-neovim', { 'on': ['FlooAddBuf', 'FlooInfo', 'FlooJoinWorkspace']}
Plug 'kshenoy/vim-signature'
Plug 'edkolev/tmuxline.vim'
Plug 'sjl/gundo.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'xuhdev/vim-latex-live-preview', { 'on': 'LLPStartPreview' }
Plug '907th/vim-auto-save'
Plug 'shime/vim-livedown', { 'on': ['LivedownToggle', 'LivedownPreview'], 'for': 'md'  }
Plug 'Shougo/deoplete.nvim', { 'on': 'DeopleteEnable' }
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['c', 'cpp'] }
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag', {'for': ['html']}
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/gv.vim'
Plug 'morhetz/gruvbox'
call plug#end()
"------------------------------------------------------------------------------------------}}}

" PLUGIN SETTINGS----------------------------------------------------------------------------{{{
" Airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0

" Hardmode
" autocmd VimEnter,BufNewFile,BufReadPost * if !strlen(&buftype) | silent! call HardMode() | endif

" Ctrl-P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.dmg,*.doc,*.pdf,*.docx,*.png,*.jpeg,*.jpg,*.app,*.mp3,*.flac,*.mp4,*.mkv,*.nfo,*.webloc,*.plist,*.epub,*.sqlite,*.srt,*.ape,*.key,*.pptx,*.psd,*.pages,*.avi,*.sfv,*.cache,*.mobi,*.log,*.cue,*.search?,*.rst,*.search
let g:ctrp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" NERDTree
map <Leader><Leader>t :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" Gundo
nnoremap <Leader><Leader>g :GundoToggle<CR>
let g:gundo_close_on_revert=1

" Gitgutter
set updatetime=250

" Multiple Cursors
let g:multi_cursor_use_default_mapping=1

" Latex Live Preview
let g:livepreview_previewer = 'open -a Skim'
let g:tex_conceal = ""

" Deoplete 
let g:deoplete#enable_at_startup = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
"call deoplete#util#set_default('g:deoplete#sources', {})
"let g:deoplete#sources._=['buffer', 'file']

" Vim-Tmux Navigator
nmap <BS> :TmuxNavigateLeft<cr>

" Rainbow Parens
let g:rainbow_active = 0

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
au Filetype html,text let b:delimitMate_autoclose = 0
"------------------------------------------------------------------------------------------}}}

" NAVIGATION--------------------------------------------------------------------------------{{{
" remap escape key
"inoremap jj <ESC>
"inoremap jk <ESC>
"inoremap kj <ESC>

" remap buffer switching
map <Tab> :bnext<CR>
map <S-Tab> :bprevious<CR>
:nmap <C-w> :bd<CR>

" line numbers
set relativenumber
set number

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd
"
" use indents of 4 spaces, and have them copied down lines:
set shiftwidth=4
set shiftround
set expandtab
set autoindent
" 
" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" toggle highlight
nnoremap <leader><leader>l :set cursorline!<cr> :highlight CursorLine ctermbg=black<cr>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

"move to beginning/end of line
nnoremap B ^
nnoremap E $

"------------------------------------------------------------------------------------------}}}

" APPEARANCE------------------------------------------------------------------------------{{{
" Appearance
"let g:airline_theme = "solarized"
"let g:solarized_termcolors=256
"set t_Co=256
"syntax enable
"set background=dark
"colorscheme solarized
"set background=dark

" Sorialized Theme
" let g:solarized_termtrans = 1
" set background=dark
" colorscheme solarized

" Gruvbox Theme
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:airline_theme = "gruvbox"
let g:gruvbox_contrast = "medium"
let g:gruvbox_hls_cursor = "orange"
let g:gruvbox_termcolors = 256
set background=dark
colorscheme gruvbox

" Visual autocomplete for command menu
set wildmenu

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"------------------------------------------------------------------------------------------}}}

" SAVED MACROS----------------------------------------------------------------------------------{{{
let @t = 'i#include <iostream>using namespace std;int main(int argc, char** argvA {O//TODOgg'
let @j = 'i#include <iostream>#include <vector>#include <bitset>#include <string>#include <algorithm>#include <cmath>using namespace std;int main() {int cases;cin >> cases;for (int C=0; C<=cases; C++) {cout << "Case #" << C << ": ";// JAM ON!}}'

"
"
"
" -----------------------------------------------------------------------------------------}}}

" OTHER------------------------------------------------------------------------------------{{{
" enable filetype detection:
filetype on
filetype indent on
filetype plugin on

" using the marker folding method
set foldmethod=marker

" run commands
noremap Q !!sh<CR>

" switch lines down and up
nnoremap - ddp
nnoremap _ ddkP

" source file
nnoremap <leader>sop :source %<cr>

"------------------------------------------------------------------------------------------}}}
"
" FUN--------------------------------------------------------------------------------------{{{
function! s:RotateString(string)
    let split_string = split(a:string, '\zs')
    return join(split_string[-1:] + split_string[:-2], '')
endfunction

function! s:RotateLine(line, leading_whitespace, trailing_whitespace)
    return substitute(
        \ a:line,
        \ '^\(' . a:leading_whitespace . '\)\(.\{-}\)\(' . a:trailing_whitespace . '\)$',
        \ '\=submatch(1) . <SID>RotateString(submatch(2)) . submatch(3)',
        \ ''
    \ )
endfunction

function! s:RotateLines()
    let saved_view = winsaveview()
    let first_visible_line = line('w0')
    let last_visible_line = line('w$')
    let lines = getline(first_visible_line, last_visible_line)
    let leading_whitespace = map(
        \ range(len(lines)),
        \ 'matchstr(lines[v:val], ''^\s*'')'
    \ )
    let trailing_whitespace = map(
        \ range(len(lines)),
        \ 'matchstr(lines[v:val], ''\s*$'')'
    \ )
    try
        while 1 " <C-c> to exit
            let lines = map(
                \ range(len(lines)),
                \ '<SID>RotateLine(lines[v:val], leading_whitespace[v:val], trailing_whitespace[v:val])'
            \ )
            call setline(first_visible_line, lines)
            redraw
            sleep 50m
        endwhile
    finally
        if &modified
            silent undo
        endif
        call winrestview(saved_view)
    endtry
endfunction

nnoremap <silent> <Plug>(RotateLines) :<C-u>call <SID>RotateLines()<CR>

nmap \r <Plug>(RotateLines)
" -----------------------------------------------------------------------------------------}}}
"
" end NVIM config
