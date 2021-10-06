-- first load ?
if require('first_load')() then
  return
end
vim.cmd [[packadd packer.nvim]]

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  -- Telescope
  use { 'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    }
  }

  -- Colorschemes
  -- use 'folke/tokyonight.nvim'
  use 'navarasu/onedark.nvim'
  -- use 'ful1e5/onedark.nvim'
  -- use 'eddyekofo94/gruvbox-flat.nvim'
  -- use 'EdenEast/nightfox.nvim'
  -- use 'shaunsingh/nord.nvim'

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'  -- Additional textobjects for treesitter

  -- LSP
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'onsails/lspkind-nvim'

  -- Snippets
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- Completion
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'saadparwaiz1/cmp_luasnip'

  -- UI
  -- use 'hoob3rt/lualine.nvim'
  use 'shadmansaleh/lualine.nvim'
  use 'akinsho/nvim-bufferline.lua'
  use 'kyazdani42/nvim-web-devicons'
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use 'karb94/neoscroll.nvim'
  use 'lukas-reineke/indent-blankline.nvim'  -- Add indentation guides even on blank lines

  -- Misc
  use 'windwp/nvim-autopairs'
  use 'andymass/vim-matchup'
  use 'terrortylor/nvim-comment'
  use { "dstein64/vim-startuptime", cmd = "StartupTime", }

  -- TS stuff
  use {
    'jose-elias-alvarez/nvim-lsp-ts-utils',
    ft = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}
  }
end)

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- diable builtin
require('disable_builtin')

-- LSP
require('lsp')
