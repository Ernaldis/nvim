call plug#begin()
Plug 'https://github.com/nvim-tree/nvim-web-devicons'
Plug 'https://github.com/nvim-tree/nvim-tree.lua'
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/frazrepo/vim-rainbow'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/Yggdroot/indentLine'
Plug 'https://github.com/preservim/nerdcommenter'
Plug 'https://github.com/lukas-reineke/indent-blankline.nvim'
Plug 'https://github.com/tmhedberg/matchit'
" Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/williamboman/mason.nvim'
Plug 'https://github.com/williamboman/mason-lspconfig.nvim'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/hrsh7th/cmp-nvim-lsp'
Plug 'https://github.com/hrsh7th/cmp-buffer'
Plug 'https://github.com/hrsh7th/cmp-path'
Plug 'https://github.com/hrsh7th/cmp-cmdline'
Plug 'https://github.com/hrsh7th/nvim-cmp'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'https://github.com/nvim-lualine/lualine.nvim'
Plug 'https://github.com/phaazon/hop.nvim'
Plug 'https://github.com/RishabhRD/popfix'
Plug 'https://github.com/RishabhRD/nvim-cheat.sh'
Plug 'https://github.com/iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'https://github.com/google/vim-jsonnet'
" Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jvgrootveld/telescope-zoxide'
Plug 'nanotee/zoxide.vim'
Plug 'Canop/nvim-bacon'

call plug#end()

syntax on
filetype plugin indent on
set number
set noswapfile                  
set wildmenu
set backspace=indent,eol,start
set undodir=~/.cache/nvim/undo
set undofile
set incsearch
set smartindent
set ic
set expandtab
set showmatch
set hlsearch incsearch
set softtabstop=2 
set shiftwidth=2
set tabstop=2
set list
set listchars=tab:-\|
set smartindent
set autoindent
set shell=bash\ -i
set encoding=UTF-8
set wildmode=longest,list
" set spelllang=en_us
" set spell
set mouse=

augroup common
  autocmd!
  autocmd FileType sh setlocal noexpandtab
augroup end

" Keybind Ctrl+l to clear search
nnoremap <C-l> :nohl<CR><C-l>:echo "Search Cleared"<CR>

" When python filetype is detected, F5 can be used to execute script 
autocmd FileType python nnoremap <buffer> <F5> :w<cr>:exec '!clear'<cr>:exec '!python3' shellescape(expand('%:p'), 1)<cr>

" Activate rainbow
let g:rainbow_active = 1

" configure nerdcommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" Configure python files
let g:python_recommended_style=0

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nvim-cmp
set completeopt=menu,menuone,noselect

" markdown-preview
let g:mkdp_auto_start = 1

" auto hashbangs
augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl>\"|$
  autocmd BufNewFile *.sh 0put =\"#!/usr/bin/bash bash\<nl>\"|$
augroup end

lua require('init')
