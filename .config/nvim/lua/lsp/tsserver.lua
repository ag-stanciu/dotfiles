local M = {}

local nvim_lsp = require('lspconfig')
local util = nvim_lsp.util

M.setup = function(on_attach, capabilities)
  -- null-ls
  local null_ls = require('null-ls')
  null_ls.config({
    -- debug = true,
  })
  nvim_lsp["null-ls"].setup({
    on_attach = on_attach,
    root_dir = function(fname)
      return util.root_pattern("tsconfig.json")(fname)
    end,
  })

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
          -- debug = true,
          enable_import_on_completion = true,

          eslint_bin = 'eslint_d',
          eslint_enable_diagnostics = true,
          eslint_show_rule_id = true,
          -- eslint_opts = {
          --   condition = function (utils)
          --     return utils.root_has_file(".eslintrc.json")
          --   end,
          --   diagnostics_format = "#{m} [#{c}]",
          -- },

          enable_formatting = true,
          formatter = 'eslint_d',

          -- formatter = 'prettier_d_slim',
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
