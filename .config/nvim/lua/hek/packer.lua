local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

vim.cmd [[packadd packer.nvim]]

local ok, packer = pcall(require, 'packer')
if not ok then
    return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

packer.init {
    -- display = {
    --     open_fn = function()
    --         return require("packer.util").float { border = "single" }
    --     end,
    --     prompt_border = "single",
    -- },
    git = {
        clone_timeout = 600,
    },
    auto_clean = true,
    compile_on_sync = true,
}

-- local use = packer.use
packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager

    -- Telescope
    use { 'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
        }
    }

    -- Colorschemes
    use 'folke/tokyonight.nvim'
    -- use 'olimorris/onedark.nvim'
    -- use 'EdenEast/nightfox.nvim'
    use 'rmehri01/onenord.nvim'
    -- use "rebelot/kanagawa.nvim"
    -- use 'kvrohit/substrata.nvim'
    -- use 'kvrohit/rasmus.nvim'
    -- use 'sainnhe/gruvbox-material'
    -- use 'kaiuri/nvim-juliana'

    -- Git
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects' -- Additional textobjects for treesitter
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- LSP
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use 'jose-elias-alvarez/null-ls.nvim'
    -- use 'onsails/lspkind-nvim'
    use 'j-hui/fidget.nvim'

    -- Snippets
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    -- Completion
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'b0o/schemastore.nvim'

    -- UI
    -- use 'nvim-lualine/lualine.nvim'
    use 'feline-nvim/feline.nvim'
    use 'akinsho/nvim-bufferline.lua'
    use 'kyazdani42/nvim-web-devicons'
    use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
    use 'karb94/neoscroll.nvim'
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines

    -- Misc
    use 'norcalli/nvim-colorizer.lua'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'andymass/vim-matchup'
    -- use { "dstein64/vim-startuptime", cmd = "StartupTime", }
    use 'numToStr/Comment.nvim'
    -- use 'tpope/vim-surround'
    use({
        'kylechui/nvim-surround',
        config = function()
            require('nvim-surround').setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    -- TS stuff
    use {
        'jose-elias-alvarez/typescript.nvim'
        -- ft = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}
    }

    -- Lua
    use 'folke/lua-dev.nvim'

    -- Perf
    use 'lewis6991/impatient.nvim'

    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
