local null_ls = require("null-ls")
local b = null_ls.builtins

local nvim_lsp = require('lspconfig')
local lsp_util = nvim_lsp.util

local eslint_opts = {
    condition = function(utils)
        return utils.root_has_file(".eslintrc.json")
    end,
    diagnostics_format = "#{m} [#{c}]",
}

local sources = {
    b.diagnostics.eslint_d.with(eslint_opts),
    b.formatting.eslint_d.with(eslint_opts),
    b.code_actions.eslint_d.with(eslint_opts),
}

local M = {}
M.setup = function(on_attach, capabilities)
    null_ls.setup({
        -- debug = true,
        sources = sources,
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = function(fname)
            return lsp_util.root_pattern("tsconfig.json")(fname)
        end
    })
end

return M
