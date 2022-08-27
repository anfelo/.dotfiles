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

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

Plug 'ayu-theme/ayu-vim'
Plug 'ryanoasis/vim-devicons'

Plug 'preservim/nerdtree'

Plug 'jiangmiao/auto-pairs'

call plug#end()

" Ayu Theme
set termguicolors
let ayucolor="mirage"
colorscheme ayu

" File browser
let NERDTreeShowHidden = 1

" Remaps
let mapleader = " "

" General
nnoremap <leader>pv :NERDTreeToggle<CR>
nnoremap <leader>pt :sp<CR>:terminal<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <C-q> :q!<CR>
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
" inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<cr>"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Tab navigation
nnoremap <C-S-tab> :bprevious<CR>
nnoremap <C-tab> :bnext<CR>

