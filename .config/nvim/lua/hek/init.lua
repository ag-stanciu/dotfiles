--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
    vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" }) -- last stable release
  end
end
vim.opt.rtp:prepend(lazypath)

-- diable builtin
require('hek.disable_builtin')

--Options
require('hek.options')

-- plugins
-- require('hek.packer')
require("lazy").setup('hek.plugins')

-- LSP
require('hek.lsp')

-- Mappings
require('hek.mappings')

-- ident
require('hek.utils').setIndentSize { go = 4, python = 4, rust = 4, cpp = 4, c = 4, make = 4, lua = 4 }

-- Colorscheme
require('hek.colors')

