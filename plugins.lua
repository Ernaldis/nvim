return require('packer').startup(function()
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use 'towolf/vim-helm'
  use 'rafamadriz/friendly-snippets'
  use 'wbthomason/packer.nvim'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'simrat39/rust-tools.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'
  use 'windwp/nvim-autopairs'
  use 'frazrepo/vim-rainbow'
  use 'tpope/vim-surround'
  use 'Yggdroot/indentLine'
  use 'preservim/nerdcommenter'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'tmhedberg/matchit'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.x' }
  use 'nvim-lualine/lualine.nvim'
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-cheat.sh'
  use 'google/vim-jsonnet'
  use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end }
  use 'jvgrootveld/telescope-zoxide'
  use 'nanotee/zoxide.vim'
  use 'Canop/nvim-bacon'
end)
