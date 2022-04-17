local u = require('utils')
local M = {}

-- neoscroll
M.neoscroll = function()
  local ns = u.check_plugin('neoscroll')
  if ns then
    ns.setup()
  end
end

M.neoscroll()
