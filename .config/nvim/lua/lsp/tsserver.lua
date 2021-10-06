local M = {}

local nvim_lsp = require('lspconfig')

M.setup = function(on_attach, capabilities)
  local enable_ts = true
  nvim_lsp.tsserver.setup {
    capabilities = capabilities,
    on_attach = function (client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false

      on_attach(client, bufnr)

      -- ts utils?
      if enable_ts then
        local ts_utils = require('nvim-lsp-ts-utils')
        ts_utils.setup({
          enable_import_on_completion = true,
          import_all_scan_buffers = 100,
          eslint_bin = 'eslint_d',
          eslint_enable_diagnostics = true,
          eslint_show_rule_id = true,
          enable_formatting = true,
          formatter = 'prettier_d_slim',
          update_imports_on_move = true,
        })
        ts_utils.setup_client(client)
      end
    end,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

return M
