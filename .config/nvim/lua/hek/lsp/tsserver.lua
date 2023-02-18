local M = {}

M.setup = function(on_attach, capabilities)
    require("typescript").setup {
        server = {
            on_attach = function(client, bufnr)
                client.server_capabilities.document_formatting = false
                client.server_capabilities.document_range_formatting = false
                on_attach(client, bufnr)
            end,
            capabilities = capabilities,
            flags = {
                debounce_text_changes = 150,
            }
        }
    }
end

return M
