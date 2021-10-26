local M = {}

local nvim_lsp = require('lspconfig')

M.setup = function (on_attach, capabilities)
  nvim_lsp.gopls.setup {
    cmd = { 'gopls', 'serve' },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      }
    }
  }
end

return M
