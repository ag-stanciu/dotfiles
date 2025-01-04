-- set leader key for lazy.nvim
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("hek.disable")
require("hek.options")
local util = require("hek.util")
require("lazy").setup("hek.plugins", {
    ui = {
        border = util.border_chars_outer_thin,
        backdrop = 80,
    },
    performance = {
        rtp = {
            disabled_plugins = {
                'gzip',
                'netrwPlugin',
                'rplugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            }
        }
    }
})
require("hek.mappings")
util.setIndentSize({ go = 4, python = 4, rust = 4, cpp = 4, c = 4, make = 4, lua = 4 })
require("hek.color")
require("hek.commands")
-- require("hek.status")
