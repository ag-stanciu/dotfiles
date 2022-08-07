local u = require('hek.utils')
local M = {}

-- neoscroll
M.neoscroll = function()
    local ns = u.check_plugin('neoscroll')
    if ns then
        ns.setup()
    end
end

M.lsp_fidget = function()
    local fidget = u.check_plugin('fidget')
    if fidget then
        fidget.setup({
            text = {
                spinner = 'dots'
            }
        })
    end
end

M.gps = function()
    local gps = u.check_plugin('nvim-gps')
    if gps then
        gps.setup()
    end
end

M.neoscroll()
M.lsp_fidget()
M.gps()
