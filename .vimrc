"================ sDefaults ================
" turn off beep
set vb

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"be IMproved
set nocompatible 
filetype off 

" have vim define folds automatically by indent level
augroup vimrc
	au BufReadPre * setlocal foldmethod=syntax
 	au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
augroup END

" open / close / create folds
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

"save folds / load folds at shutdown / startup
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" set fold highlighting when vim starts 
autocmd BufWinEnter *.* hi Folded ctermfg=245 ctermbg=237

" map leader key and remove timeout
let mapleader=' ' 
set notimeout

filetype plugin indent on     " required!

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set cursorline		" hilight the current line
set cursorcolumn	" hilight the current column
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"force 256 colors
set t_Co=256

"set the font
set guifont=Terminess\ Powerline\ 8
syntax enable

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent                " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                  \ | wincmd p | diffthis
endif

" always display the statusline
set laststatus=2

"always show line numbering
set number
  syntax on
  set ruler

"exclude line numbering in tagbar and nerdtree
let g:numbers_exclude = ['tagbar', 'nerdtree']

"================ eDefaults ================

"================ sPlugs ===================

" find and call vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage vundle (required)
Bundle 'gmarik/vundle'

" Configured Plugins
" PlugA
Bundle 'bling/vim-airline' 
" PlugB
Bundle 'scrooloose/nerdtree' 
" PlugC
Bundle 'lukerandall/haskellmode-vim' 
" PlugD
Bundle 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM'
" PlugE
Bundle 'Shougo/neocomplete.vim'
" PlugF
Bundle 'eagletmt/neco-ghc' 
" PlugG
Bundle 'majutsushi/tagbar' 
" PlugH
Bundle 'kien/ctrlp.vim' 
" PlugI
Bundle 'tomasr/molokai' 
" PlugJ
Bundle 'godlygeek/tabular'
" PlugK
Bundle 'Lokaltog/vim-easymotion' 

"No Configuration
Bundle 'scrooloose/nerdcommenter' 
Bundle 'bitc/lushtags' 
Bundle 'myusuf3/numbers.vim' 

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles

"================ ePlugs ===================

"================ sPlugA ===================

" set ambiwidth so the powerline symbols in vim-airline align 
set ambiwidth=single

"display all buffers
  let g:airline#extensions#tabline#enabled = 1

"set vim-airline theme and force colors
  let g:airline_force_256color = 1
  let g:airline_theme = 'xbsd'        

"populate the g:airline_symbols dictionary
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
  let g:airline_powerline_fonts = 1
endif 

" unicode symbols for airline  
  "let g:airline_left_sep = '»'
  "let g:airline_left_sep = '▶'
  "let g:airline_right_sep = '«'
  "let g:airline_right_sep = '◀'

  let g:airline_symbols.space = "\ua0" 
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''

"================ ePlugA ===================

"================ sPlugB ===================

  "show hidden dotfiles in NERDTree 
  let NERDTreeShowHidden = 1

  "set NERDTree toggle button to F7
  nmap <F7> :NERDTreeToggle<CR>
  
  "close vim when there's only a NERDTree left
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") 

  "open a NERDTree automatically if no files were specified at startup
  "autocmd vimenter * if !argc() | NERDTree | endif

"================ ePlugB ===================

"================ sPlugC ===================

"setup haskell-vim features:
  au BufEnter *.hs compiler ghc
  "or use let g:ghc="usr/local/bin/ghc-7.6.3 in the line below"
  let g:ghc="usr/local/bin/ghc"
  let g:haddock_browser="/usr/local/bin/elinks"

"================ ePlugC ===================

"================ sPlugD ===================

  "setup SHIM
   autocmd FileType haskell nmap <F3> :GhciRange<CR>
   autocmd FileType haskell vmap <F4> :GhciRange<CR>
   autocmd FileType haskell nmap <F5> :GhciFile<CR>
   autocmd FileType haskell nmap <F6> :GhciReload<CR>
   let g:shim_ghciInterp = "ghci"
   "let g:shim_ghciArgs = "" 
   "let g:shim_ghciPrompt = <-- regex 
   let g:shim_ghciTimeout = 10
   let g:shim_jumpToGhci = "false"
   let g:shim_quickfix = "true"
   let g:shim_defaultWindowSize = 15 

"================ ePlugD ===================

"================ sPlugE ===================

  "setup neocomplete:
  
  "setup colorscheme  
  highlight Pmenu ctermbg=235 guibg=#262626 ctermfg=244 guifg=#808080
  highlight PmenuSel ctermbg=148 guibg=#afd700 ctermfg=22 guifg=#005f00
  highlight PmenuSbar ctermbg=233 guibg=#121212
  highlight PmenuThumb ctermbg=244 guibg=#808080

  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  " force neocomplete completefunc
  let g:neocomplete#force_overwrite_completefunc = 1
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

  " Define dictionary.
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

  " Define keyword.
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Plugin key-mappings.
  inoremap<expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " Recommended key-mappings.
  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
  endfunction
  " <TAB>: completion.
  inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h>   neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>    neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><C-y>   neocomplete#close_popup()
  inoremap <expr><C-e>   neocomplete#cancel_popup()
  " Close popup by <Space>.
  inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
  
  " For cursor moving in insert mode(Not recommended)
  "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
  "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
  "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
  "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
  " Or set this.
  "let g:neocomplete#enable_cursor_hold_i = 1
  " Or set this.
  "let g:neocomplete#enable_insert_char_pre = 1
  
  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1

  " Shell like behavior(not recommended).
  set completeopt+=longest
  let g:neocomplete#enable_auto_select = 1
  let g:neocomplete#disable_auto_complete = 1
  inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"================ ePlugE ===================

"================ sPlugF ===================

  "setup neco-ghc features:
  let g:necoghc_enable_detailed_browse = 1

  "set path neco-ghc to my .cabal/bin directory
  let $PATH = $PATH . ':' . expand("~/.cabal/bin")

"================ ePlugF ===================

"================ sPlugG ===================

  "set tagbar toggle Button to F8
  nmap <F8> :TagbarToggle<CR>

"================ ePlugG ===================

"================ sPlugH ===================

  "set ctrlp runtime path
  set runtimepath^=~/.vim/bundle/ctrlp.vim
  
  "set CrtlP default mappings
  "nmap <C-p> :CtrlP<CR>
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'

  "set Ctrlp at top of window
  let g:ctrlp_match_window_bottom = 0
  let g:ctrlp_match_window_reversed = 0
  
  "set Ctrlp local working directory
  let g:ctrlp_working_path_mode = 0

  "Exclude these files and directories
  set wildignore+=*/tmp/*,*.so,*.swp,*.zip
  
  "include dotfiles in Ctrlp search
  let g:ctrlp_show_hidden = 1 

  "Use custom file listing command
  let g:ctrlp_user_command = 'find %s -type f'

"================ ePlugH ===================

"================ sPlugI ===================

let g:rehash256=1
let g:molokai_original=0
colorscheme molokai
set background=dark

"================ ePlugI ===================

"================ sPlugJ ===================

"set tabularize key combinations
nmap <Leader>a=  :Tabularize /=<CR>
nmap <Leader>a== :Tabularize /==<CR>
nmap <Leader>a:  :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /::<CR>
nmap <Leader>a,  :Tabularize /,<CR>
nmap <Leader>a;  :Tabularize /\|/l1<CR>
nmap <Leader>a"  :Tabularize /"<CR>
nmap <Leader>a[  :Tabularize /[<CR>
nmap <Leader>a]  :Tabularize /]<CR>
nmap <Leader>a(  :Tabularize /(<CR>
nmap <Leader>a)  :Tabularize /)<CR>
nmap <Leader>a{  :Tabularize /{<CR>
nmap <Leader>a}  :Tabularize /}<CR>
nmap <Leader>a<  :Tabularize /<<CR>
nmap <Leader>a>  :Tabularize /><CR>
nmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a<= :Tabularize /<=<CR>
nmap <Leader>a{- :Tabularize /{-<CR>
nmap <Leader>a-} :Tabularize /-}<CR>
nmap <Leader>a-  :Tabularize /--<CR>
nmap <Leader>a+  :Tabularize /++<CR>
nmap <Leader>a-> :Tabularize /-><CR>
nmap <Leader>a<- :Tabularize /<-<CR>

"================ ePlugJ ===================

"================ sPlugK ===================

" configure easymotion
let g:Easymotion_use_smartsign_us = 1

let g:EasyMotion_re_anywhere = '\v' .
        \       '(<.|^$)' . '|' .
        \       '(.>|^$)' . '|' .
        \       '(\l)\zs(\u)'

highlight EasyMotionTarget ctermbg=none guibg=none ctermfg=197 guifg=#ff005f
highlight EasyMotionTarget2First ctermbg=none guibg=none ctermfg=148 guifg=#afd700
highlight EasyMotionTarget2Second ctermbg=none guibg=none ctermfg=148 guifg=#afd700

map <Leader> <Plug>(easymotion-prefix)
nmap , <Plug>(easymotion-jumptoanywhere)
nmap . <Plug>(easymotion-lineanywhere)
nmap ; <Plug>(easymotion-bd-jk)
nmap ' <Plug>(easymotion-sn)

"================ ePlugK ===================

"=============== Additional ================

"split buffers the i3 way
nnoremap <Leader>v :vnew<CR>
nnoremap <Leader>h :new<CR>
nnoremap <Leader>q :close<CR>
nnoremap <Leader>\ <C-w><C-w>

" set search highlight colors to airline colors;
" pressing return clears highlighted search
set hlsearch
nnoremap <CR> :nohlsearch<CR>/<BS>
highlight IncSearch cterm=none gui=none ctermbg=166 guibg=#d75f00 ctermfg=232 guifg=#080808
highlight Search cterm=none gui=none ctermbg=148 guibg=#afd700 ctermfg=22 guifg=#005f00

"=============== Additional ================
