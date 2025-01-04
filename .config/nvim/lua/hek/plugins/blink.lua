local u = require('hek.util')
return {
    {
        "saghen/blink.cmp",
        event = "InsertEnter",
        version = "v0.*", -- REQUIRED `tag` needed to download pre-built binary
        dependencies = {
            "echasnovski/mini.icons",
        },
        opts = {
            appearance = {
                -- use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "buffer", "lazydev" },
                providers = {
                    path = {
                        opts = {
                            get_cwd = vim.uv.cwd
                        },
                    },
                    buffer = {
                        max_items = 3,
                        min_keyword_length = 3,
                        score_offset = -5
                    },
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100,
                    }
                },
                cmdline = {},
            },
            keymap = {
                preset = "enter",
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
            },
            completion = {
                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
                },
                list = {
                    selection = "auto_insert",
                },
                menu = {
                    -- border = u.border_chars_outer_thin,
                    scrollbar = false,
                    draw = {
                        treesitter = { "lsp" },
                        -- padding = { 1, 0 },
                        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
                        -- components = {
                        --     kind_icon = { width = { fill = true } },
                        -- },
                        components = {
                            kind_icon = {
                                ellipsis = false,
                                text = function(ctx)
                                    local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                                    return kind_icon
                                end,
                                -- Optionally, you may also use the highlights from mini.icons
                                highlight = function(ctx)
                                    local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                    return hl
                                end,
                            }
                        }
                    },
                },
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                    window = {
                        border = u.border_chars_outer_thin,
                        scrollbar = false,
                    }
                },
            },
            signature = {
                enabled = true,
                window = {
                    border = u.border_chars_outer_thin,
                }
            },
        }
    },
}
