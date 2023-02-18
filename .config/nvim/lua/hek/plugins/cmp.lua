return {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    event = "InsertEnter",
    dependencies = {
        'windwp/nvim-autopairs',
        'L3MON4D3/LuaSnip', -- Snippets plugin
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'windwp/nvim-autopairs',
    },
    config = function()
        local util = require("hek.util")
        local luasnip = require('luasnip')
        local autopairs = require('nvim-autopairs')
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        require("luasnip/loaders/from_vscode").lazy_load()

        -- Set completeopt to have a better completion experience
        vim.opt.completeopt = 'menuone,noselect'

        local icons = util.kinds

        -- nvim-cmp setup
        cmp.setup {
            completion = {
                -- completeopt = "menu,menuone,noinsert",
                -- keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
                keyword_length = 1,
            },
            -- preselect = cmp.PreselectMode.None,
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            -- window = {
            --   -- completion = cmp.config.window.bordered(),
            --   documentation = cmp.config.window.bordered(),
            -- },
            formatting = {
                -- fields = { "kind", "abbr", "menu" },
                format = function(_, vim_item)
                    -- vim_item.menu = vim_item.kind
                    -- vim_item.kind = icons[vim_item.kind]
                    vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

                    return vim_item
                end,
            },
            -- formatting = {
            --   format = lspkind.cmp_format ({
            --     mode = 'symbol',
            --     maxwidth = 50,
            --     with_text = true,
            --     menu = {
            --       nvim_lsp = '[lsp]',
            --       buffer = '[buf]',
            --       path = '[fs]',
            --       luasnip = '[snip]',
            --     },
            --   }),
            -- },
            mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ---@diagnostic disable-next-line: missing-parameter
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                        -- elseif has_words_before() then
                        --   cmp.complete()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            sources = {
                { name = 'nvim_lsp', priority = 100 },
                { name = 'luasnip' },
                { name = 'path' },
                { name = 'buffer', priority = 2, keyword_length = 5, max_item_count = 5 },
                { name = 'nvim_lsp_signature_help' },
            },
        }

        autopairs.setup({
            check_ts = true,
        })
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
}
