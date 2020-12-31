"""""""""""""
"  VIMPLUG  "
"""""""""""""
call plug#begin(stdpath('data') . '/plugged')

" Appearence
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'sainnhe/gruvbox-material'
Plug 'edkolev/tmuxline.vim'

" nvim tools
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'

" Utilities
Plug 'scrooloose/nerdtree'

" Language-specific
Plug 'lervag/vimtex'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()

"""""""""""""
"  GENERAL  "
"""""""""""""
set nocompatible            " Don't try to work with vi

filetype plugin indent on   " Load plugins according to detected filetype
syntax on                   " Enable syntax highlighting
set synmaxcol=0             " Highlight all columns

set wrap                    " Wrap lines if they get too long
set linebreak               " Linebreak between words
set display=lastline        " Show as much as possible of the last line.
set number                  " Always show line numbers
set relativenumber          " Use relative line numbering
set cursorline              " Highlight the current line

set autoindent              " Indent according to previous line
set expandtab               " Replace tabs with spaces
set tabstop=4               " Tabs are 4 spaces
set softtabstop=4           " Tab key (or backspace) indents by 4 spaces
set shiftwidth=4            " Shifting indentation (>>) is 4 spaces
set shiftround              " >> indents to next multiple of shiftwidth

set backspace=indent,eol,start " Make backspace work as you would expect
set hidden                  " Switch between buffers without having to save first

set laststatus=2            " Always show statusline
set showmode                " Show current mode in command-line
set showcmd                 " Show commands in statusline

set incsearch               " Highlight incrementally while searching with / or ?
set hlsearch                " Keep matches highlighted
set ignorecase              " Ignore case while searching
set smartcase               " If search has a captial letter, turn on case-sensitive
set wrapscan                " Searches wrap around end-of-file.

set splitbelow              " Open new windows below the current window
set splitright              " Open new windows right of the current window

set belloff=all             " No annoying bells
set report=0                " Always report changed lines (ex. for yanking)
set mouse=a                 " Mouse enabled in all modes
set termguicolors           " Color compatibility
set conceallevel=0          " Don't hide things and make me go crazy

set list                    " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" Set spellcheck for specific file types
autocmd FileType latex,markdown setlocal spell

" Appearence
set background=dark
colorscheme gruvbox-material


"""""""""""""
"  PLUGINS  "
"""""""""""""

" vim-airline
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox_material'
let g:gruvbox_material_background='medium'
let g:airline#extensions#whitespace#enabled=0

" gitgutter
let g:gitgutter_override_sign_column_highlight=0

" vimtex
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:vimtex_syntax_conceal_default=0
let g:tex_conceal=''
let g:vimtex_view_method='skim'

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:snips_author='Reid Sox-Harris'

" indent-line
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

" NERDTree Magic
" Opens NERDTree on '$ vim' with no arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Opens NERDTree if opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Maps NERDTree
map <C-n> :NERDTreeToggle<CR>

"JSX intergration
let g:jsx_ext_required = 0

"""""""""""""""""""""""""
" tmux statusbar config "
"""""""""""""""""""""""""
let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmuxline"

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : "#P",
      \'win'  : ['#I #F', '#W'],
      \'cwin' : ['#I #F', '#W'],
      \'x'    : '#{prefix_highlight}',
      \'y'    : ['%m/%d','%R'],
      \'z'    : '#H',
      \'options': {
        \'status-justify': 'left'}}

