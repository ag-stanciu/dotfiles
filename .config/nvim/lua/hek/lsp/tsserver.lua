local M = {}

M.setup = function(on_attach, capabilities)
    require("typescript").setup {
        go_to_source_definition = {
            fallback = true, -- fall back to standard LSP definition on failure
        },
        server = {
            on_attach = function(client, bufnr)
                client.server_capabilities.document_formatting = false
                client.server_capabilities.document_range_formatting = false
                on_attach(client, bufnr)

                vim.keymap.set("n", "<leader>tso", "<cmd>TypescriptOrganizeImports<CR>", { buffer = bufnr })
            end,
            capabilities = capabilities,
            flags = {
                debounce_text_changes = 150,
            }
        }
    }
end

return M
