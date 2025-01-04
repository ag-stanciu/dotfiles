local M = {}

local nvim_lsp = require('lspconfig')

M.setup = function(on_attach, capabilities)
    nvim_lsp.vtsls.setup {
        on_attach = function(client, bufnr)
            client.server_capabilities.document_formatting = false
            client.server_capabilities.document_range_formatting = false
            on_attach(client, bufnr)

            vim.keymap.set("n", "<leader>tso", function()
                vim.lsp.buf.code_action({
                    apply = true,
                    context = {
                        only = { "source.organizeImports" },
                        diagnostics = {},
                    },
                })
            end, { buffer = bufnr })
        end,
        capabilities = capabilities,
        settings = {
            complete_function_calls = true,
            vtsls = {
                enableMoveToFileCodeAction = true,
                autoUseWorkspaceTsdk = true,
                experimental = {
                    completion = {
                        enableServerSideFuzzyMatch = true,
                    },
                },
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
            },
            typescript = {
                -- updateImportsOnFileMove = { enabled = "always" },
                suggest = {
                    completeFunctionCalls = true,
                },
                -- inlayHints = {
                --     enumMemberValues = { enabled = true },
                --     functionLikeReturnTypes = { enabled = true },
                --     parameterNames = { enabled = "literals" },
                --     parameterTypes = { enabled = true },
                --     propertyDeclarationTypes = { enabled = true },
                --     variableTypes = { enabled = false },
                -- },
            },
        },
    }
end

return M
