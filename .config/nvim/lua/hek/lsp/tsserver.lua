local M = {}

local nvim_lsp = require('lspconfig')

M.setup = function(on_attach, capabilities)
    nvim_lsp.tsserver.setup {
        on_attach = function(client, bufnr)
            client.server_capabilities.document_formatting = false
            client.server_capabilities.document_range_formatting = false
            on_attach(client, bufnr)

            vim.keymap.set("n", "<leader>tso", function()
                vim.lsp.buf.code_action({
                    apply = true,
                    context = {
                        only = { "source.organizeImports.ts" },
                        diagnostics = {},
                    },
                })
            end, { buffer = bufnr })
        end,
        capabilities = capabilities,
        settings = {
            typescript = {
                format = {
                    indentSize = vim.o.shiftwidth,
                    convertTabsToSpaces = vim.o.expandtab,
                    tabSize = vim.o.tabstop,
                },
            },
            javascript = {
                format = {
                    indentSize = vim.o.shiftwidth,
                    convertTabsToSpaces = vim.o.expandtab,
                    tabSize = vim.o.tabstop,
                },
            },
            completions = {
                completeFunctionCalls = true,
            },
        },
    }
end

return M
