return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- "jose-elias-alvarez/typescript.nvim",
        "b0o/schemastore.nvim",
        "folke/neodev.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
    },
    config = function()
        local u = require('hek.util')
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "eslint",
                -- "terraformls",
                "bashls",
                "gopls",
                "jsonls",
                "yamlls",
                "graphql",
                "zls",
                "prismals"
            }
        })
        local nvim_lsp = require('lspconfig')
        local lsp_lines = require("lsp_lines")
        lsp_lines.setup()
        local popup_opts = { border = u.border_chars_outer_thin, focusable = false }

        -- Diagnostic keymaps
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
        vim.keymap.set('n', '<leader>l', lsp_lines.toggle)

        -- LSP settings
        local on_attach = function(client, bufnr)
            -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
            vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, popup_opts)
            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, popup_opts)

            local opts = { buffer = bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set('n', '<leader>wl', function()
                vim.inspect(vim.lsp.buf.list_workspace_folders())
            end, opts)
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
            -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', '<leader>rn', function()
                require("inc_rename")
                return ":IncRename " .. vim.fn.expand("<cword>")
            end, { expr = true })
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
            -- vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, opts)
            vim.api.nvim_create_user_command('Format', vim.lsp.buf.format, {})

            -- Set some keybinds conditional on server capabilities
            if client.supports_method("textDocument/formatting") then
                -- if client.server_capabilities.document_formatting then
                vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, opts)
            elseif client.supports_method 'textDocument/rangeFormatting' then
                vim.keymap.set('n', '<leader>fm', vim.lsp.buf.range_formatting, opts)
            end

            -- vim.api.nvim_create_autocmd("CursorHold", {
            --     buffer = bufnr,
            --     callback = function()
            --         local o = {
            --             focusable = false,
            --             close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            --             source = 'always',
            --             prefix = ' ',
            --             scope = 'cursor',
            --             border = 'rounded',
            --         }
            --         vim.diagnostic.open_float(nil, o)
            --     end
            -- })
        end

        -- replace the default lsp diagnostic symbols
        for type, icon in pairs(u.signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        vim.diagnostic.config {
            virtual_text = false,
            float = {
                -- header = false,
                source = true,
            },
            signs = true,
            underline = false,
            update_in_insert = false,
            severity_sort = true,
            virtual_lines = false
        }

        local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        local capabilities = vim.tbl_deep_extend("force", nvim_lsp.util.default_config.capabilities, cmp_capabilities)

        local servers = {
            -- 'pyright',
            'graphql',
            -- 'rust_analyzer',
            -- 'tailwindcss',
            'dockerls',
            -- 'terraformls',
            'bashls',
            -- 'clangd',
            'rnix',
            'zls',
            'prismals',
        }
        for _, server in ipairs(servers) do
            nvim_lsp[server].setup {
                capabilities = capabilities,
                on_attach = on_attach,
                flags = {
                    debounce_text_changes = 150
                }
            }
        end

        -- json
        nvim_lsp.jsonls.setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                json = {
                    schemas = require('schemastore').json.schemas(),
                    validate = { enable = true },
                }
            }
        }

        -- custom settings servers
        require('hek.lsp.tsserver').setup(on_attach, capabilities)
        require('hek.lsp.luals').setup(on_attach, capabilities)
        require('hek.lsp.yaml').setup(on_attach, capabilities)
        require('hek.lsp.gopls').setup(on_attach, capabilities)
        require('hek.lsp.eslint').setup(on_attach, capabilities)
    end
}
