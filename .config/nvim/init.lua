-- first load ?
if require('first_load')() then
  return
end
vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

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
  -- use 'navarasu/onedark.nvim'
  use 'olimorris/onedark.nvim'
  -- use 'ful1e5/onedark.nvim'
  -- use 'eddyekofo94/gruvbox-flat.nvim'
  -- use 'EdenEast/nightfox.nvim'
  -- use 'shaunsingh/nord.nvim'
  -- use 'rmehri01/onenord.nvim'
  -- use "rebelot/kanagawa.nvim"
  -- use 'kvrohit/rasmus.nvim'

  -- Git
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'  -- Additional textobjects for treesitter
	use 'JoosepAlviste/nvim-ts-context-commentstring'

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
  use 'hrsh7th/cmp-nvim-lsp-signature-help'

  -- UI
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/nvim-bufferline.lua'
  use 'kyazdani42/nvim-web-devicons'
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use 'karb94/neoscroll.nvim'
  use 'lukas-reineke/indent-blankline.nvim'  -- Add indentation guides even on blank lines

  -- Misc
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'andymass/vim-matchup'
  -- use 'terrortylor/nvim-comment'
  use { "dstein64/vim-startuptime", cmd = "StartupTime", }
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  -- TS stuff
  use {
    'jose-elias-alvarez/nvim-lsp-ts-utils'
    -- ft = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}
  }

  -- Lua
  use "folke/lua-dev.nvim"
end)

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- diable builtin
require('disable_builtin')

-- LSP
require('lsp')
