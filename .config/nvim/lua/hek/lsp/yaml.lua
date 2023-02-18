local M = {}

local nvim_lsp = require('lspconfig')

M.setup = function(on_attach, capabilities)
    nvim_lsp.yamlls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { 'yaml', 'yml' },
        settings = {
            yaml = {
                validate = true,
                format = {
                    enable = true
                },
                hover = true,
                schemaDownload = {
                    enable = true
                },
				schemas = {
					["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				},
                schemaStore = {
                    url = "https://www.schemastore.org/api/json/catalog.json",
                    enable = true,
                },
                customTags = {
                    "!Base64 scalar",
                    "!Cidr scalar",
                    "!And sequence",
                    "!Equals sequence",
                    "!If sequence",
                    "!Not sequence",
                    "!Or sequence",
                    "!Condition scalar",
                    "!FindInMap sequence",
                    "!GetAtt scalar",
                    "!GetAtt sequence",
                    "!GetAZs scalar",
                    "!ImportValue scalar",
                    "!Join sequence",
                    "!Select sequence",
                    "!Split sequence",
                    "!Sub scalar",
                    "!Sub sequence",
                    "!Transform mapping",
                    "!Ref scalar",
                }
            }
        },
        flags = {
            debounce_text_changes = 150,
        }
    }
end

return M
