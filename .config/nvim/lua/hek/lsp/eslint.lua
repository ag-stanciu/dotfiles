local M = {}

local nvim_lsp = require('lspconfig')

M.setup = function(on_attach, capabilities)
    nvim_lsp.eslint.setup({
        on_attach = function(client, bufnr)
            client.server_capabilities.document_formatting = true
            on_attach(client, bufnr)
        end,
        capabilities = capabilities,
        settings = {
            format = {
                enable = true,
            }
        },
    })
end

return M
