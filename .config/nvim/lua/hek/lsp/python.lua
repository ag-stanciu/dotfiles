local M = {}

local nvim_lsp = require('lspconfig')

M.setup = function (on_attach, capabilities)
    capabilities.textDocument.signatureHelp = vim.tbl_deep_extend(
        "force",
        capabilities.textDocument.signatureHelp or {},
        {
            dynamicRegistration = false,
            signatureInformation = {
                documentationFormat = { "markdown", "plaintext" },
                parameterInformation = { labelOffsetSupport = true },
                activeParameterSupport = true,
            },
        }
    )
    vim.lsp.config('pyright', {
        on_attach = function(client, bufnr)
            client.server_capabilities.document_formatting = false
            client.server_capabilities.document_range_formatting = false
            on_attach(client, bufnr)
        end,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150
        },
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "openFilesOnly",
                    useLibraryCodeForTypes = true,
                    typeCheckingMode = "basic"
                }
            }
        }
    })
    vim.lsp.enable('pyright')

    vim.lsp.config('ruff', {
        capabilities = capabilities,
        on_attach = function (client, bufnr)
            client.server_capabilities.hoverProvider = false
            on_attach(client, bufnr)
        end
    })
    vim.lsp.enable('ruff')
end

return M
