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
set listchars=tab:>·,trail:~,extends:>,precedes:<,eol:↲
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

Plug 'ayu-theme/ayu-vim'
Plug 'xiyaowong/nvim-transparent'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'preservim/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

Plug 'jiangmiao/auto-pairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'petertriho/nvim-scrollbar'

" Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'
Plug 'dinhhuy258/git.nvim'
Plug 'APZelos/blamer.nvim'

" Syntax Highlighting & LSP
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Snippets
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'onsails/lspkind-nvim'

" CSS
Plug 'ap/vim-css-color'

" Prettier
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

call plug#end()

" Ayu Theme
set termguicolors
let ayucolor="mirage"
colorscheme ayu

" File browser
let NERDTreeShowHidden = 1
" IndentLine
let g:indentLine_setColors = 0
" Git Blamer
let g:blamer_enabled = 1

lua require("scrollbar").setup()
lua require("_treesitter")
lua require("_cmp")
lua require("_lsp_config")
lua require("_lspsaga")
lua require("_mason")
lua require("_lualine")
lua require("bufferline").setup{}
lua require("_null_ls")
lua require("_prettier")
lua require("gitsigns").setup{}
lua require("_git")
lua require("_transparent")

autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua go_imports(1000)
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)

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

" Quickfix navigation
noremap <C-j> :cnext<CR>
noremap <C-k> :cprev<CR>

" Telescope remaps
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>

" Bufferline Tabs
nnoremap <Tab> <cmd>BufferLineCycleNext<CR>
nnoremap <S-Tab> <cmd>BufferLineCyclePrev<CR>
nnoremap <C-w> <cmd>BufferLinePickClose<CR>
