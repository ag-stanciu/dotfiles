local M = {}

local nvim_lsp = require('lspconfig')
M.setup = function(on_attach, capabilities)
    require('neodev').setup({})
    nvim_lsp.sumneko_lua.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
                }
            }
        },
        flags = {
            debounce_text_changes = 150,
        }
    })
end

return M
