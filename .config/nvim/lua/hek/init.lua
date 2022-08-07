--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- diable builtin
require('hek.disable_builtin')

-- plugins
require('hek.packer')

--Options
require('hek.options')

-- LSP
require('hek.lsp')

-- Colorscheme
require('hek.colorscheme')

-- Mappings
require('hek.mappings')

-- ident
require('hek.utils').setIndentSize { go = 4, python = 4, rust = 4, cpp = 4, c = 4, make = 4, lua = 4 }
