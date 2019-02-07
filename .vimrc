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
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'airblade/vim-gitgutter'
" Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'hzchirs/vim-material'
Plugin 'kaicataldo/material.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-syntastic/syntastic'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'ryanoasis/vim-devicons'
Plugin 'jdsimcoe/abstract.vim'
Plugin 'Jimeno0/vim-chito'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'simeji/winresizer'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" colorscheme hybrid_material
"let g:material_theme_style = 'dark'
"set background=dark
colorscheme abstract
set splitbelow
set splitright
set number
set colorcolumn=79      " set line marker at 79 char
set noswapfile          " ignore swap
set encoding=UTF-8

set expandtab           " enter spaces when tab is pressed
set softtabstop=4
set tabstop=4           " show existing tab with 4 spaces width
set shiftwidth=4        " when indenting with '>', use 4 spaces width 
set smarttab

" To activate custom plugin in .vim/ftplugins
filetype plugin indent on

syntax enable
"Automatically_removing_all_trailing_whitespace
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e

map <C-A-l> gg=G<CR>
map <C-l> :NERDTreeToggle<CR>
map <C-p> :FZF<CR>
map <C-a> <esc>ggVG<CR>
map <C-z> <esc>:u<CR>
map <C-y> <esc>:red<CR>
map <C-d> <esc>yyp<CR>
map <C-c> "+y<CR>
map <C-S-v> <esc>"+gP<CR>
map <C-x> <esc>sp\ .<CR>
map <C-w> <esc>vsp\ .<CR>
" Font setting
set guifont=Hack\ 12
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Plugin 'pisva/vim-vue'
" Drop Syntastic settings at the end of the config file "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" For example: replace the default Python checker with flake8 and pylint "
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint', 'jshint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

" Check XML files.
let b:ale_linters = ['xmllintr']
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"airlline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_theme = 'material'
let g:airline#extensions#whitespace#enabled = 0

"https://github.com/Yggdroot/indentLine
let g:indentLine_char = '|'
let g:indentLine_faster = 1

" DevIcons
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" NerdTree
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

map <C-b>  <Plug>NERDCommenterToggle
map <C-b>  <Plug>NERDCommenterToggle<CR>gv

"Move b/w panes Cmd Opt Arrow
nnoremap <C-A-Right> <C-W><C-L> 
nnoremap <C-A-Left> <C-W><C-H>
nnoremap <C-A-Down> <C-W><C-J>
nnoremap <C-A-Up> <C-W><C-K>

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
