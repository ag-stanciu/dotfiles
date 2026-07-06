local M = {}

-- local nvim_lsp = require('lspconfig')
local nvim_lsp = vim.lsp.config
M.setup = function(on_attach, capabilities)
    require('neodev').setup({})
    nvim_lsp.lua_ls.setup({
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
