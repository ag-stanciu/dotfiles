return {
    -- Treesitter
    'nvim-treesitter/nvim-treesitter',
    event = {"BufReadPost", "BufNewFile"},
    build = ":TSUpdate",
    dependencies = {
        'JoosepAlviste/nvim-ts-context-commentstring',
        'windwp/nvim-ts-autotag',
        'andymass/vim-matchup',
    },
    config = function()
        local ts = require('nvim-treesitter.configs')
        ts.setup {
            ensure_installed = {
                'bash',
                'c',
                'html',
                'lua',
                'luadoc',
                'vim',
                'vimdoc',
                'css',
                'diff',
                'dockerfile',
                'go',
                'gomod',
                'gosum',
                'graphql',
                'json',
                'jsonc',
                'javascript',
                'rust',
                'sql',
                'terraform',
                'typescript',
                'yaml',
                'zig',
                'prisma',
            },
            highlight = {
                enable = true, -- false will disable the whole extension
                use_languagetree = true
            },
            autopairs = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
            matchup = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = 'gnn',
                    node_incremental = 'grn',
                    scope_incremental = 'grc',
                    node_decremental = 'grm',
                },
            },
            indent = {
                enable = true,
                -- disable = { 'yaml' },
            },
            -- context_commentstring = {
            --     enable = true,
            --     enable_autocmd = false,
            -- },
            -- textobjects = {
            --     select = {
            --         enable = true,
            --         lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
            --         keymaps = {
            --             -- You can use the capture groups defined in textobjects.scm
            --             ['af'] = '@function.outer',
            --             ['if'] = '@function.inner',
            --             ['ac'] = '@class.outer',
            --             ['ic'] = '@class.inner',
            --         },
            --     },
            --     move = {
            --         enable = true,
            --         set_jumps = true, -- whether to set jumps in the jumplist
            --         goto_next_start = {
            --             [']m'] = '@function.outer',
            --             [']]'] = '@class.outer',
            --         },
            --         goto_next_end = {
            --             [']M'] = '@function.outer',
            --             [']['] = '@class.outer',
            --         },
            --         goto_previous_start = {
            --             ['[m'] = '@function.outer',
            --             ['[['] = '@class.outer',
            --         },
            --         goto_previous_end = {
            --             ['[M'] = '@function.outer',
            --             ['[]'] = '@class.outer',
            --         },
            --     },
            -- },
        }
        vim.g.skip_ts_context_commentstring_module = true
        require("ts_context_commentstring").setup()
    end
}
