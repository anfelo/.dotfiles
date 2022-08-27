set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set cursorline

set inccommand=split
set mouse=a
set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set listchars=tab:>·,trail:~,extends:>,precedes:<
set list
set autowrite
set colorcolumn=80

" Syntax
filetype plugin indent on
syntax on

" True color if available
let term_program = $TERM_PROGRAM

" Check for conflicts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
    set termguicolors
else
    if $TERM !=? 'xterm-256color'
        set termguicolors
    endif
endif

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Appearance
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Autocomplete, Linting, Prettier
Plug 'neoclide/coc.nvim',  {'branch': 'master', 'do': 'yarn install'}

" File browser
Plug 'preservim/nerdtree'

Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'petertriho/nvim-scrollbar'
Plug 'tpope/vim-commentary'
Plug 'rust-lang/rust.vim'

call plug#end()

let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1

" File browser
let NERDTreeShowHidden = 1

" Ayu Theme
set termguicolors     " enable true colors support
let ayucolor="mirage" " Options: mirage, dark, light
colorscheme ayu

" Airline
let g:airline_theme = 'ayu'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Scrollbar
lua require("scrollbar").setup()

" IndentLine
let g:indentLine_setColors = 0

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
" Status line types/signatures
let g:go_auto_type_info = 1

" Rust things
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

" Remaps
let mapleader = " "

" General
nnoremap <leader>pv :NERDTreeToggle<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-q> :q!<CR>
" nnoremap <C-;> :sp<CR>:terminal<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
nnoremap <silent> <C-h> :silent !tmux neww tmux-cht.sh<CR>
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Telescope remaps
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

" Coc Autocomplete remaps
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<cr>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Tab navigation
nnoremap <C-S-tab> :bprevious<CR>
nnoremap <C-tab> :bnext<CR>

