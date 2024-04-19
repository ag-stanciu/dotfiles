return {
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    event = "InsertEnter",
    dependencies = {
        'windwp/nvim-autopairs',
        -- 'L3MON4D3/LuaSnip', -- Snippets plugin
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        -- 'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'windwp/nvim-autopairs',
    },
    config = function()
        local util = require("hek.util")
        -- local luasnip = require('luasnip')
        -- luasnip.config.setup({
        --     history = true,
        --     region_check_events = "InsertEnter",
        --     delete_check_events = "TextChanged,InsertLeave",
        -- })
        local autopairs = require('nvim-autopairs')
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        -- require("luasnip/loaders/from_vscode").lazy_load()

        -- Set completeopt to have a better completion experience
        vim.opt.completeopt = 'menuone,noselect'

        local icons = util.new_kinds

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
                    vim.snippet.expand(args.body)
                end,
            },

            window = {
                -- completion = cmp.config.window.bordered {
                --     border = util.border_chars_outer_thin,
                -- },
                -- documentation = cmp.config.window.bordered {
                --     border = util.border,
                -- },
                completion = {
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
                    col_offset = -3,
                    side_padding = 0
                },
                -- completion = cmp.config.window.bordered {
                --     winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder,CursorLine:PmenuSel,Search:None",
                --     -- scrollbar = true,
                --     border = util.border_chars_outer_thin,
                --     col_offset = -3,
                --     side_padding = 0
                -- },
                documentation = cmp.config.window.bordered {
                    winhighlight = "Normal:Pmenu,FloatBorder:PmenuDocBorder,CursorLine:PmenuSel,Search:None",
                    scrollbar = true,
                    border = util.border_chars_outer_thin,
                    side_padding = 1 -- Not working?
                },
            },
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    -- vim_item.menu = vim_item.kind
                    local src = ({
                        buffer = "buf",
                        nvim_lsp = "lsp",
                        nvim_lua = "lua",
                        path = "path"
                    })[entry.source.name]
                    -- vim_item.menu = "   (" .. string.format("%s", vim_item.kind) .. ")   "
                    vim_item.menu = string.format("(%s) - %s", vim_item.kind, src)
                    vim_item.kind = " " .. icons[vim_item.kind]
                    -- vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

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
                    elseif vim.snippet.jumpable(1) then
                        vim.snippet.jump(1)
                        -- elseif has_words_before() then
                        --   cmp.complete()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif vim.snippet.jumpable(-1) then
                        vim.snippet.jump(-1)
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
                { name = 'nvim_lsp',               priority = 100 },
                -- { name = 'luasnip' },
                { name = 'path' },
                { name = 'buffer',                 priority = 2,  keyword_length = 5, max_item_count = 5 },
                { name = 'nvim_lsp_signature_help' },
            },
            sorting = {
                -- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
                priority_weight = 1000,
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,

                    -- copied from cmp-under, but I don't think I need the plugin for this.
                    -- I might add some more of my own.
                    function(entry1, entry2)
                        local _, entry1_under = entry1.completion_item.label:find "^_+"
                        local _, entry2_under = entry2.completion_item.label:find "^_+"
                        entry1_under = entry1_under or 0
                        entry2_under = entry2_under or 0
                        if entry1_under > entry2_under then
                            return false
                        elseif entry1_under < entry2_under then
                            return true
                        end
                    end,

                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
        }

        autopairs.setup({
            check_ts = true,
        })
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
}
