set nocompatible " be iMproved
filetype on "Avoid errors on close
filetype off " required!
let g:vim_markdown_preview_toggle=0
let g:vim_markdown_preview_github=1
let g:vim_markdown_preview_browser='chromium'

" tell easy tag to include members before loading.
let g:easytags_include_members = 1
let g:easytags_async = 1
let g:easytags_by_filetype = '~/.vim'
let g:easytags_always_enabled = 0
let g:easytags_autorecurse = 0
let g:easytags_resolve_links = 0
" let g:easytags_dynamic_files = 2
" let g:easytags_links = 1

" Rust configurations
let g:rust_fold = 1
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'xclip -selection clipboard'
 
let g:syntastic_rust_checkers = ['cargo']

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set termguicolors
let $GIT_SSL_NO_VERIFY = 'true'
if has('nvim')
    let s:editor_root = expand('~/.nvim')
else
    let s:editor_root = expand('~/.vim')
endif

let s:plug_path = s:editor_root . '/plugged'

"set t_Co=256
call plug#begin(s:plug_path)
 
Plug 'junegunn/seoul256.vim'
Plug 'joshdick/onedark.vim'
Plug 'zhou13/vim-easyescape'
Plug 'dart-lang/dart-vim-plugin'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'cespare/vim-toml'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
"Plug 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'
Plug 'venantius/vim-cljfmt', {'for':'clojure'}
"Plug 'bhurlow/vim-parinfer'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-speeddating'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-repeat'
Plug 'kotarak/vimpire', { 'for': 'clojure' }
"using vim-sexp instead.
"Plug 'vim-scripts/paredit.vim'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
Plug 'lambdalisue/shareboard.vim'
Plug 'keith/swift.vim'
Plug 'fatih/vim-go'
" neomake
Plug 'neomake/neomake'
" Python and PHP Debugger
" Plug 'fisadev/vim-debug.vim'
" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Syntax checking
Plug 'vim-syntastic/syntastic'
" Class/module browser
Plug 'majutsushi/tagbar'
" Code and files fuzzy finder
" Plug 'ctrlpvim/ctrlp.vim'
" Surround
Plug 'tpope/vim-surround'
" Autoclose
Plug 'Townk/vim-autoclose'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
" Plug 'klen/python-mode'
Plug 'python-mode/python-mode'
" Visualize indents.
Plug 'Yggdroot/indentLine'
" Improved folding
Plug 'tmhedberg/SimpylFold'
" Persist folds and buffer states.
Plug 'kopischke/vim-stay'

" Snippets manager (SnipMate), dependencies, and snippets repo
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'honza/vim-snippets'
" Plug 'garbas/vim-snipmate'
" Plug 'scrooloose/snipmate-snippets'
"
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Markdown
Plug 'plasticboy/vim-markdown'

" Pug templates
Plug 'digitaltoad/vim-pug'

" Color scheme mustang
Plug 'croaker/mustang-vim'
"Plug 'vim-scripts/vim-python-virtualenv'
" Autocompletion
"Plug 'vim-scripts/AutoComplPop'
" Python code checker
Plug 'vim-scripts/pyflakes.vim'
" Search results counter
Plug 'vim-scripts/IndexedSearch'
" XML/HTML tags navigation
Plug 'vim-scripts/matchit.zip'
" Gvim colorscheme
"Plug 'Wombat'
" Yank history navigation
Plug 'vim-scripts/YankRing.vim'
Plug 'mhinz/vim-signify'
Plug 'vim-ruby/vim-ruby'
" Plug 'davidhalter/jedi-vim'
" Plug 'vim-scripts/autoproto.vim'
Plug 'keyworks/vim-lodgeit'
" matchit.zip has a name collision.
"Plug 'vim-scripts/matchit.zip'
" Plug 'fholgado/minibufexpl.vim'
Plug 'vim-scripts/pep8'
 
" Plug 'Chiel92/vim-autoformat'
" vim org-mode
Plug 'jceb/vim-orgmode'
 
" webapi-vim
Plug 'mattn/webapi-vim'
" vim-gist
Plug 'mattn/gist-vim'

Plug 'fsharp/vim-fsharp', { 'for': 'fsharp', 'do': 'make fsautocomplete' }
Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }

"airline for status bar management
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Buffergator for buffer navigation
Plug 'jeetsukumaran/vim-buffergator'
 
"javascript stuff
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"diagrams
Plug 'aklt/plantuml-syntax'

" autocomplete plugings
" Plug 'ervandew/supertab'

" Adding rust racer, go and javascript support.
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

" Better c family color coding.
Plug 'jeaye/color_coded', { 'do': 'rm -f CMakeCache.txt && mkdir -p build && cd build && cmake .. && make && make install && make clean && make clean_clang' }
" Trying ALE
" Plug 'w0rp/ale'

" Better ctags and universal ctags support.
Plug 'xolox/vim-easytags'
" Prerequisite for easytags.
Plug 'xolox/vim-misc'
" NOTE: make universal-ctags from source and set the version to be equivalent
" to the exuberant ctags.
" generate tags automatically.
Plug 'jsfaint/gen_tags.vim'
" Auto window resize (Tagbar still too small).
" Plug 'zhaocai/GoldenView.Vim'
Plug 'roman/golden-ratio'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end() 

" ALE config
" let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 1
" let g:airline#extensions#ale#enabled = 1

" Snippets
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsUsePythonVersion=2

" YouCompleteMe settings
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:Show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1
" let g:ycm_error_symbol = "⚛"
" let g:ycm_warning_symbol = "⚠"
let g:ycm_collect_identifiers_from_tags_files = 1

" ycm additional
" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
let g:ycm_confirm_extra_conf = 0

" Python - ycm needs to know which python.
let g:ycm_python_binary_path = '/usr/bin/python3'
au FileType python nmap <leader>g :YcmCompleter GoTo<CR>
au FileType python nmap <leader>d :YcmCompleter GoToDefinition<CR>
"" let g:pymode_doc_key='K'
"" let g:pymode_breakpoint_bind='<leader>b'
let g:SimpylFold_docstring_preview = 1

" Rust source code for autocomplete (ycm).
let g:ycm_rust_src_path = '/opt/code/repos/rust/src'

" configure racer
set hidden
let g:racer_cmd = '$HOME/.cargo/bin/racer'
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" configure c
au FileType c nmap <leader>g :YcmCompleter GoTo<CR>
au FileType c nmap <leader>d :YcmCompleter GoToDeclaration<CR>
au FileType c nmap <leader>D :YcmCompleter GoToDefinition<CR>

" configure neomake
call neomake#configure#automake('rw', 1000)
let g:neomake_rust_enabled_makers = ['cargo']
let g:neomake_rust_cargo_command = ['test', '--no-run']

" settings for vim-stay
" set viewoptions=cursor,folds,slash/unix
"enable rainbow.
let g:rainbow_active = 1 
let g:rainbow_conf = {
	\	'guifgs': ['#005faf', '#0087af', '#00afaf', '#00d7af', '#00ffd7'],
	\	'ctermfgs': ['25', '31', '37', '43', '50']
\}
"trying to fix jedi crashing python shell !# syntax.
"let g:jedi#auto_initialization = 0

"trying to get autocompletion working and jump to source in python working
"let g:jedi#completions_enabled = 0

" Settings {{{-
filetype plugin indent on " required!
" tabs and spaces handling
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
" tablength exceptions
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType clojure setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4 textwidth=79
" system ctags files
autocmd FileType java set tags=tags,.tags,/opt/code/javasrc/tags
" always show status bar
set ls=2
" incremental search
set incsearch
" highlighted search results
set hlsearch
map <F2> :nohl<CR>
" line numbers
set nu
" show fold indicator
set fdc=1

" toggle Tagbar display
map <silent> <F4> :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 0

"vim-airline:
let g:airline#extensions#tabline#enabled = 1
"just file name:
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
" NERDTree (better file browser) toggle
map <F3> :NERDTreeToggle<CR>
 
" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>
 
" navigate windows with meta+arrows
"map <M-Right> <c-w>l
"map <M-Left> <c-w>h
"map <M-Up> <c-w>k
"map <M-Down> <c-w>j
"imap <M-Right> <ESC><c-w>l
"imap <M-Left> <ESC><c-w>h
"imap <M-Up> <ESC><c-w>k
"imap <M-Down> <ESC><c-w>j
 
" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
 
" old autocomplete keyboard shortcut
" imap <C-J> <C-X><C-O>
 
" save as sudo
ca w!! w !sudo tee "%"
 
" colors and settings of autocompletion
highlight Pmenu ctermbg=4 guibg=LightGray
" highlight PmenuSel ctermbg=8 guibg=DarkBlue guifg=Red
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black
 
" debugger keyboard shortcuts
map <F5> :Dbg over<CR>
map <F6> :Dbg into<CR>
map <F7> :Dbg out<CR>
map <F8> :Dbg here<CR>
map <F9> :Dbg break<CR>
map <F10> :Dbg watch<CR>
map <F11> :Dbg down<CR>
map <F12> :Dbg up<CR>
 
" CtrlP (new fuzzy finder)
" let g:ctrlp_map = ',e'
" nmap ,g :CtrlPBufTag<CR>
" nmap ,G :CtrlPBufTagAll<CR>
" nmap ,f :CtrlPLine<CR>
" nmap ,m :CtrlPMRUFiles<CR>
" " to be able to call CtrlP with default search text
" function! CtrlPWithSearchText(search_text, ctrlp_command_end)
" execute ':CtrlP' . a:ctrlp_command_end
" call feedkeys(a:search_text)
" endfunction
" CtrlP with default text
" nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
" nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
" nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
" nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
" nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
" nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
" " Don't change working directory
" let g:ctrlp_working_path_mode = 0
" " Ignore files on fuzzy finder
" let g:ctrlp_custom_ignore = {
" \ 'dir': '\v[\/](\.git|\.hg|\.svn)$',
" \ 'file': '\.pyc$\|\.pyo$',
" \ }
 
" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
 
" simple recursive grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
nmap ,R :RecurGrep
nmap ,r :RecurGrepFast
nmap ,wR :RecurGrep <cword><CR>
nmap ,wr :RecurGrepFast <cword><CR>
 
 
" python-mode settings
" Load the whole plugin
let g:pymode = 1
" Load run code plugin
let g:pymode_run = 1
" Key for run python code
let g:pymode_run_key = '<leader>r'
" Load pylint code plugin
let g:pymode_lint = 1
"pep8 to the list below if wanted.
let g:pymode_lint_checker = "pep8,pyflakes,mccabe"
 
" Check code every save
let g:pymode_lint_write = 1
 
" Load rope plugin
let g:pymode_rope = 0
" Enable python objects and motion
let g:pymode_motion = 1
" Auto fix vim python paths if virtualenv enabled
let g:pymode_virtualenv = 1
" Set default pymode python options
let g:pymode_options = 1
" python 3:
let g:pymode_python = 'python3'

let g:pymode_syntax = 1
let g:pymode_breakpoint = 1

let g:pymode_folding = 1
 
" avoid conflict with buffergator <leader>b
let pymode_breakpoint_bind = '<leader>B'
let pymode_breakpoint_key = '<leader>B'

let g:pep8_map='<leader>5'

"my custom python stuff:
let g:pymode_trim_whitespaces = 1
 
 
" rope (from python-mode) settings
"nmap ,d :RopeGotoDefinition<CR>
"nmap ,D :tab split<CR>:RopeGotoDefinition<CR>
"nmap ,o :RopeFindOccurrences<CR>
 
" don't let pyflakes allways override the quickfix list
let g:pyflakes_use_quickfix = 0
" colors for gvim
"" colorscheme Mustang
"colorscheme zenburn
"colorscheme seoul256
colorscheme onedark
 
" minibufexpl
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1
" :MiniBufExplorer on
 
" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3
 
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest
 
" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}
" Disable autocomplete in python mode - conflicts with jedi
"let g:acp_enableAtStartup = 1
 
"fun! CheckAcpStatus()
"  if &ft =~ 'python'
"    :AcpDisable
"  else
"    :AcpEnable
"  endif
"endfun
"autocmd WinEnter,BufRead,BufNewFile * call CheckAcpStatus()

let python_highlight_all = 1
 
" autocmd WinEnter * if &ft==python | :AcpDisable | else | :AcpEnable | endif
" autocmd WinEnter * if &omnifunc!='' | :AcpDisable | else | :AcpEnable | endif
" autocmd WinEnter,TabEnter * call CheckAcpStatus()
 
"supertab configuration
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
" let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabMappingForward  = "<s-tab>"
" let g:SuperTabMappingBackward = "<tab>"

" Stop that darned noise
:set visualbell
" Seriously, shut up!
:set noerrorbells
 
" I have enough stuff already, no need for more files
set nobackup
set noswapfile
 
:syntax on
"set guifont=Inconsolata:h13
"set guifont=Source\ Code\ Pro:h12
set guifont=Anonymous\ Pro
:let mapleader=","
set smartindent
 
nmap <C-D-e> :cnext<CR>
set listchars=tab:▸\ ,eol:¬,trail:-
 
:set guioptions-=m "remove menu bar
:set guioptions-=T "remove toolbar
:set autochdir
nmap <leader>H :%!xxd<CR>

"make jsx work for js files:
let g:jsx_ext_required = 0
set nowrap

"syntax highlighting in markdown fenced code blocks.
"https://www.reddit.com/r/vim/comments/2x5yav/markdown_with_fenced_code_blocks_is_great/
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['javascript', 'css', 'html', 'json=javascript', 'clojure', 'fsharp', 'java', 'xml', 'sh=bash']

" qss is a qt style sheet file for qt5, good for lxqt.
au BufNewFile,BufRead *.qss set filetype=css

autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1

"syntastic configuration:
let g:syntastic_swift_checkers = ['tailor', 'swiftpm', 'swiftlint']
let g:syntastic_asciidoc_asciidoc_exec = "asciidoctor"
let g:syntastic_asciidoc_checkers = ['asciidoc', 'proselint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:synastic_javascript_checkers=['jshint']

" already commented out
"let g:syntastic_error_symbol = '❌'
"let g:syntastic_style_error_symbol = '⁉️'
"let g:syntastic_warning_symbol = '⚠️'
"let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

"jk combo as esc
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 400
cnoremap jk <ESC>
cnoremap kj <ESC>
"let g:easyescape_chars = { "j": 2 }
"let g:easyescape_timeout = 200
"cnoremap jj <ESC>

autocmd BufEnter * nested :call tagbar#autoopen(0)
"autocmd FileType python call StartOpenTagBar()
"autocmd FileType rust call StartOpenTagBar()
"autocmd FileType javascript call StartOpenTagBar()
"function! StartOpenTagBar()
  ":call tagbar#autoopen(0)
"endfunction
