return {
    -- 'wbthomason/packer.nvim', -- Package manager

    -- Telescope
    { 'nvim-telescope/telescope.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
        }
    },

    -- Colorschemes
    'folke/tokyonight.nvim',
    -- 'olimorris/onedark.nvim'
    -- 'EdenEast/nightfox.nvim'
    -- 'rmehri01/onenord.nvim',
    -- "rebelot/kanagawa.nvim"
    -- 'kvrohit/substrata.nvim'
    -- 'kvrohit/rasmus.nvim'
    -- 'sainnhe/gruvbox-material'
    -- 'kaiuri/nvim-juliana'
    -- 'olivercederborg/poimandres.nvim',

    -- Git
    { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },

    -- Treesitter
    'nvim-treesitter/nvim-treesitter',
    -- 'nvim-treesitter/nvim-treesitter-textobjects', -- Additional textobjects for treesitter
    'JoosepAlviste/nvim-ts-context-commentstring',

    -- LSP
    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    'jose-elias-alvarez/null-ls.nvim',
    -- 'onsails/lspkind-nvim'
    'j-hui/fidget.nvim',

    -- Snippets
    'L3MON4D3/LuaSnip', -- Snippets plugin

    -- Completion
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'b0o/schemastore.nvim',

    -- UI
    -- 'nvim-lualine/lualine.nvim'
    'feline-nvim/feline.nvim',
    'akinsho/nvim-bufferline.lua',
    'kyazdani42/nvim-web-devicons',
    { 'kyazdani42/nvim-tree.lua', dependencies = 'kyazdani42/nvim-web-devicons' },
    'karb94/neoscroll.nvim',
    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines

    -- Misc
    'norcalli/nvim-colorizer.lua',
    'windwp/nvim-autopairs',
    'windwp/nvim-ts-autotag',
    'andymass/vim-matchup',
    -- { "dstein64/vim-startuptime", cmd = "StartupTime", }
    'numToStr/Comment.nvim',
    -- 'tpope/vim-surround'
    'kylechui/nvim-surround',

    { 'akinsho/git-conflict.nvim', version = "*" },

    -- TS stuff
    'jose-elias-alvarez/typescript.nvim',
    -- ft = {'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}

    -- Lua
    'folke/neodev.nvim',
}
