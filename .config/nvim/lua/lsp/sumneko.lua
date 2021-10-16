local M = {}

local nvim_lsp = require('lspconfig')

local sumneko_root_path = vim.fn.getenv('HOME') .. '/.bin/lua-language-server'
local sumneko_bin = sumneko_root_path .. '/bin/macOS/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

M.setup = function(on_attach, capabilities)
  local lsp_config = {
    cmd = {sumneko_bin, '-E', sumneko_root_path .. '/main.lua'},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        completion = {
          showWord = "Disable",
        },
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          maxPreload = 2000,
          preloadFileSize = 1000,
        },
        telemetry = {
          enable = false
        }
      }
    },
    flags = {
      debounce_text_changes = 150,
    }
  }

  local luadev = require('lua-dev').setup({
    lspconfig = lsp_config,
  })
  nvim_lsp.sumneko_lua.setup(luadev)
end

return M
