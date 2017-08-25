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
" APPEARANCE + THEMES
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'chauncey-garrett/vim-colorizer'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'kh3phr3n/python-syntax'
Plug 'edkolev/tmuxline.vim'
Plug 'reedes/vim-thematic'
Plug 'matze/vim-move'
Plug 'junegunn/rainbow_parentheses.vim', { 'for': ['c', 'cpp', 'python'] }
Plug 'arakashic/chromatica.nvim', { 'for': ['c', 'cpp'] }
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'altercation/vim-colors-solarized'
Plug 'liuchengxu/space-vim-dark'
Plug 'mhartington/oceanic-next'
Plug 'whatyouhide/vim-gotham'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-janah'
" UTILITY
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/a.vim'
Plug 'w0rp/ale'
Plug 'junegunn/vim-easy-align'
Plug 'kshenoy/vim-signature'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'shime/vim-livedown', { 'on': ['LivedownToggle', 'LivedownPreview'], 'for': 'md'  }
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag', {'for': ['html']}
Plug 'junegunn/vim-peekaboo'
Plug 'pseewald/anyfold', { 'for': ['c', 'cpp', 'python'] }
Plug 'haya14busa/incsearch.vim'
Plug 'FredKSchott/CoVim', { 'on': 'CoVim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'cazador481/fakeclip.neovim'
Plug 'zchee/deoplete-jedi'
Plug 'wellle/targets.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tyru/caw.vim'
Plug 'tpope/vim-sleuth'
Plug 'ryanoasis/vim-devicons'
Plug 'coderifous/textobj-word-column.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }
Plug 'elzr/vim-json'
Plug 'itchyny/vim-cursorword'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'terryma/vim-expand-region'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/dsf.vim'
Plug 'tpope/tpope-vim-abolish'
" NON CODE
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'itchyny/calendar.vim', { 'on': 'Calendar' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()
"------------------------------------------------------------------------------------------}}}

" PLUGIN SETTINGS----------------------------------------------------------------------------{{{
" Airline
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_section_error = '%{ALEGetStatusLine()}'

" Async Linter Engine
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = '⨉'
let g:ale_echo_msg_warning_str = '⚠ '
let g:ale_echo_msg_format = '%severity% [%linter%] %s'
nmap <silent> <Leader><Leader>z <Plug>(ale_next_wrap)
nmap <silent> <Leader><Leader>x <Plug>(ale_previous_wrap)
let g:ale_python_pylint_options = '--disable=W0621,C0111,C0103,C0303,C0326 --extension-pkg-whitelist=numpy,cv2'

" Easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
map  <Space>f <Plug>(easymotion-bd-f)
nmap <Space>f <Plug>(easymotion-overwin-f)
" s{char}{char} to move to {char}{char}
"nmap <Leader><Leader>f <Plug>(easymotion-overwin-f2)
" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)
map <Space>l <Plug>(easymotion-bd-jk)
nmap <Space>l <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map  <Space>w <Plug>(easymotion-bd-w)
nmap <Space>w <Plug>(easymotion-overwin-w)

" Indent Guides
colorscheme default
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 3
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" NERDTree
map <Leader><Leader>t :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1

" NERDTree Syntax Highlight
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

let s:green = "8FAA54"
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['py'] = s:green " sets the color of python files to green

" Gundo
nnoremap <Leader><Leader>g :GundoToggle<CR>
let g:gundo_close_on_revert=1

" Gitgutter
set updatetime=250

" Multiple Cursors
let g:multi_cursor_use_default_mapping=1

" NeoTex
let g:neotex_enabled = 1
let g:neotex_delay = 1000
let g:neotex_latexdiff = 1
let g:tex_conceal = ""

" VimTex
let g:vimtex_compiler_latexmk = {
\ 'backend' : 'nvim',
\ 'background' : 1,
\ 'build_dir' : '',
\ 'callback' : 1,
\ 'continuous' : 1,
\ 'executable' : 'latexmk',
\ 'options' : [
\   '-pdf',
\   '-verbose',
\   '-file-line-error',
\   '-synctex=1',
\   '-interaction=nonstopmode',
\ ],
\}
let g:vimtex_view_method = 'skim'
let g:airline#extensions#vimtex#enabled = 1

" Deoplete 
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#omni#input_patterns = {}
imap <expr> <Tab> pumvisible() ? '<C-n>' : '<Tab>'
imap <expr> <S-Tab> pumvisible() ? '<C-p>' : '<S-Tab>'
"call deoplete#util#set_default('g:deoplete#sources', {})
"let g:deoplete#sources._=['buffer', 'file']
"let g:deoplete#omni_patterns = {}
let g:deoplete#omni#input_patterns.ocaml = '[.\w]+'
"
set completeopt-=preview
"autocmd CompleteDone * pclose
"
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:deoplete#omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
" let g:deoplete#omni_patterns.python = '[^. \t]\.\w*'

" Tmux Navigator
nmap <BS> :TmuxNavigateLeft<cr>

" Rainbow Parens
let g:rainbow_active = 0

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"
au Filetype html,text let b:delimitMate_autoclose = 0

" Anyfold
filetype plugin indent on
"syntax on
let anyfold_activate=1
set foldlevel=0

" Calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" FZF
" Mapping selecting mappings
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)
nmap <silent> <leader><leader><tab> :Lines<cr>
nmap <silent> <leader><tab> :BLines<cr>
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
nmap <silent> <c-p> :FZF<cr>

" Ultisnips
let g:UltiSnipsExpandTrigger='<C-e>'
let g:UltiSnipsListSnippets='<C-Tab>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsSnippetsDir="~/.config/nvim/snips"
let g:UltiSnipsSnippetDirectories=["snips", "UltiSnips"]
nmap <silent> <Leader>u :UltiSnipsEdit<CR>

" Fakeclip Neovim
let g:vim_fakeclip_tmux_plus=1 

" Chromatica
let g:chromatica#libclang_path='/usr/local/opt/llvm/lib'
let g:chromatica#enable_at_startup=1

" Vim Thematic
nnoremap <Leader>T :ThematicNext<CR>
nnoremap <Leader>P :ThematicPrevious<CR>

" Incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Devicons
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''

" Limelight and Goyo
let g:goyo_width = '80%'
let g:goyo_height = '85%'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Python Syntax
let python_highlight_all = 1

" Vim Table Mode
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

" Tmux Complete
let g:tmuxcomplete#trigger = ''

" Emmet
" let g:user_emmet_leader_key='<C-l>'

" Operator Flashy
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" Sideways
nnoremap <M-h> :SidewaysLeft<cr>
nnoremap <M-l> :SidewaysRight<cr>

"------------------------------------------------------------------------------------------}}}

" NAVIGATION--------------------------------------------------------------------------------{{{
" remap escape key
"inoremap jj <ESC>
"inoremap jk <ESC>
"inoremap kj <ESC>

" remap buffer switching
map <Tab> :bnext<CR>
map <S-Tab> :bprevious<CR>

" line numbers
set relativenumber
set number

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd
"
" use indents of 4 spaces, and have them copied down lines:
set tabstop=4
set shiftwidth=4
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
" General
syntax enable

" Vim Thematic
if has('mac') == 1
    set termguicolors
    let g:thematic#theme_name = 'oceanic'
else
    set t_Co=256
    let g:thematic#theme_name = 'gruvbox'
endif

let g:thematic#defaults = {
\   'colorscheme': 'OceanicNext',
\ 'airline-theme': 'oceanicnext',
\    'background': 'dark',
\ }

let g:thematic#themes = {
\ 'oceanic' :       {'colorscheme': 'OceanicNext',
\                    'airline-theme': 'oceanicnext',
\                   },
\ 'gruvbox' :       {'colorscheme': 'gruvbox',
\                    'airline-theme': 'gruvbox',
\                   },
\ 'janah' :         {'colorscheme': 'janah',
\                    'airline-theme': 'zenburn',
\                   },
\ 'railscasts' :    {'colorscheme': 'railscasts',
\                    'airline-theme': 'zenburn',
\                   },
\ 'deepspace' :     {'colorscheme': 'deep-space',
\                    'airline-theme': 'deep_space',
\                   },
\ 'spacevimdark' :  {'colorscheme': 'space-vim-dark',
\                    'airline-theme': 'deep_space',
\                   },
\ 'gotham' :        {'colorscheme': 'gotham',
\                    'airline-theme': 'gotham',
\                   },
\ 'onedark' :       {'colorscheme': 'onedark',
\                    'airline-theme': 'onedark',
\                   },
\ }

" Gruvbox Theme
 ""let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"colorscheme gruvbox
"let g:airline_theme = "gruvbox"
"let g:gruvbox_contrast = "medium"
let g:gruvbox_contrast_dark = "medium"
let g:gruvbox_hls_cursor = "orange"
let g:gruvbox_termcolors = 256

" Oceanic Theme
"colorscheme OceanicNext
"let g:airline_theme='oceanicnext'

" Visual autocomplete for command menu
set wildmenu

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" 80 character color column
" set colorcolumn=80
"------------------------------------------------------------------------------------------}}}

" SAVED MACROS----------------------------------------------------------------------------------{{{
let @t = 'i#include <iostream>using namespace std;int main(int argc, char** argvA {O//TODOgg'
let @j = 'i#include <iostream>#include <vector>#include <bitset>#include <string>#include <algorithm>#include <cmath>using namespace std;int main() {int cases;cin >> cases;for (int C=0; C<=cases; C++) {cout << "Case #" << C << ": ";// JAM ON!}}'

"
"
"
" -----------------------------------------------------------------------------------------}}}

" OTHER------------------------------------------------------------------------------------{{{
" reformat python
autocmd FileType python nnoremap <LocalLeader>= :0,$!python -m yapf<CR>
autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>

" better spit defaults
set splitright
set splitbelow

" error bell off
set belloff=all

" yank to system clipboard
autocmd VimEnter * set clipboard=unnamed
set clipboard+=unnamedplus

" enable filetype detection:
filetype on
filetype indent on
filetype plugin on

" using the marker folding method
set foldmethod=marker

" run commands
noremap Q !!sh<CR>

" close quickfix quickly
nmap <silent> \` :ccl<CR>

" generate ctags
command GenCtags !ctags -R -o .tags .
set tags=.tags;

" resize vim split
" nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" source file
nnoremap <leader>sop :source %<cr>

" word count
nnoremap <leader><leader>c :w !detex \| wc -w<CR>

" open pdf version in Skim
nnoremap <leader><leader>o :!open -a Skim %:r.pdf <CR>

" close quickfix on CR or ESC
autocmd Filetype qf nmap <buffer> <cr> <cr>:ccl<cr>
autocmd Filetype qf nmap <buffer> <Esc> :q<cr>

" Neovim terminal better mode switching
tnoremap jj <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

"------------------------------------------------------------------------------------------}}}

" OCAML------------------------------------------------------------------------------------{{{
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## ec98a12ad38bb92f64500ad0ce40de52 ## you can edit, but keep this line
if has('mac') == 1
    if count(s:opam_available_tools,"ocp-indent") == 0
      source '/Users/wistanchou97/.opam/4.02.3/share/vim/syntax/ocp-indent.vim'
    endif
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line

" -----------------------------------------------------------------------------------------}}}

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
"
"
"
