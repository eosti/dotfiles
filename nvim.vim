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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" nvim tools
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'preservim/nerdcommenter'
Plug 'shime/vim-livedown'

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
set smartindent
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
autocmd FileType tex,markdown setlocal spell

" yaml specific indentation
"autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=<:>

" Inline markdown highlighting
let g:markdown_fenced_languages = ['html', 'python', 'c']

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
let g:UltiSnipsExpandTrigger="<none>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:snips_author='Reid Sox-Harris'

" indent-line
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:indentLine_fileTypeExclude = ['markdown']

" pear-tree
let g:pear_tree_repeatable_expand=0
let g:pear_tree_smart_openers=1
let g:pear_tree_smart_closers=1
let g:pear_tree_smart_backspace=1

" CHADTree
nnoremap <leader>v <cmd>CHADopen<cr>

"JSX intergration
let g:jsx_ext_required = 0

" nvim-compe
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
set shortmess+=c

" NERDcommenter
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_c = 1

" Livedown
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1

" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use, can also be firefox, chrome or other, depending on your executable
let g:livedown_browser = "firefox"

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


"""""""""""""""""""""""
"  LUA configuration  "
"""""""""""""""""""""""
" Instead of lots of Lua here, we outsource it to a different file
lua require("lsp")
" Eventually we will migrate entirely to Lua, but not right now.
