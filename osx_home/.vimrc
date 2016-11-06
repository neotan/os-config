
" ====== Vundle Setting START (Must at the TOP)==================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" --------- Plug-Ins START -------------
" Track the engine.
Plugin 'SirVer/ultisnips'
"Plugin 'ervandew/supertab'

Plugin 'garbas/vim-snipmate' " Require below packages
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'honza/vim-snippets' " Optional

Plugin 'Yggdroot/indentLine'
Plugin 'vim-scripts/Mark--Karkat'
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'tpope/vim-commentary'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'tpope/vim-surround'
" --------- Plug-Ins END -------------

""""""" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" ======= Vundle brief help ========
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
  "
  " see :h vundle for more details or wiki for FAQ
  " Put your non-Plugin stuff after this line


" ====== Vundle Setting END ==========================

" ====== Neocomplete.vim START ===============
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" ====== Neocomplete.vim END ===============

" ====== NeoSnippet START =============
" ====== NeoSnippet END ===============

" ====== Vim-jsbeautify START =============

"" Binding hot keys 
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>


"" Binding a function for js, html and css in visual mode on
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" ====== Vim-jsbeautify END ===============

"""" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


"""" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed


"""" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


"""" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


"""" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

"""" Select all content
map <C-a> <esc>ggVG<CR>

"""" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


"""" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows


"""" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


"""" easier moving between tabs
"" map <Leader>n <esc>:tabprevious<CR>
"" map <Leader>m <esc>:tabnext<CR>
"map <C-S-Left> <esc>:tabprevious<CR>
"map <C-S-Right> <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>


"""" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


"""" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


"""" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
" wget -O molokai.vim http://www.vim.org/scripts/download_script.php?src_id=9750
set t_Co=256
"color wombat256mod
color molokai
"color jellybeans 


"""" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


"""" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
"highlight ColorColumn ctermbg=233
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set cursorline " highlight current line


"""" Showing indentLine
" https://github.com/Yggdroot/indentLine.git
let g:indentLine_color_term = 235
"" let g:indentLine_char = '|'
let g:indentLine_leadingSpaceEnabled=1

"""" easier formatting of paragraphs
vmap Q gq
nmap Q gg=G''


"""" Useful settings
set history=700
set undolevels=700


"""" Real programmers don't use TABs but spaces
set tabstop=4          "Indentation levels every four columns
set softtabstop=4
set shiftwidth=2       "Indent/outdent by four columns
set shiftround
set expandtab          "Convert all tabs typed to spaces


"""" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


"""" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

"""" shortcut to delete in the black hole register
"nnoremap <leader>d "_d
"vnoremap <leader>d "_d
"" shortcut to paste but keeping the current register
"vnoremap <leader>p "_dP

"""" Settings for CtrlP
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

"""" Settings for Emmet
" https://github.com/vim-airline/vim-airline.git
" Expand snippet by press 'Ctrl' + 'E', e.g. html<Ctrl+E>
let g:user_emmet_expandabbr_key = '<C-E>'


"""" Setting for vim-airline
"" https://github.com/vim-airline/vim-airline.git
"" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
"" switch buffers(tabs)
nnoremap <C-S-Right> :bn<CR>
nnoremap <C-S-Left> :bp<CR>



" ====================== End of .vimrc =================================== 
