local M = {}

local nvim_lsp = require('lspconfig')

M.setup = function(on_attach, capabilities)
    nvim_lsp.yamlls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { 'yaml', 'yml' },
        settings = {
            yaml = {
                -- schemas = require('schemastore').json.schemas(),
                schemaStore = {
                    enable = true,
                },
            }
        },
        flags = {
            debounce_text_changes = 150,
        }
    }
end

return M
