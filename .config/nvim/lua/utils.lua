local M = {}

M.check_plugin = function (plugin_name)
  local ok, ret = pcall(require, plugin_name)
  if not ok then
    return false
  end
  return ret
end


M.border = {
  {"╭", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╮", "FloatBorder"},
  {"│", "FloatBorder"},
  {"╯", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╰", "FloatBorder"},
  {"│", "FloatBorder"},
}

M.lua_lsp_status = function()
  local clients = vim.lsp.get_active_clients()
  local msg = " "--"  n/a"
  if next(clients) ~= nil then
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return " "
      end
    end
    return msg
  else
    return msg
  end
end

M.filepath = function ()
  return vim.fn.expand('%f')
end

M.lua_lsp_progress = function()
  local lspP = vim.lsp.util.get_progress_messages()[1]
  if lspP then
    local msg = lspP.message or ''
    local percentage = lspP.percentage or 0
    local title = lspP.title or ''
    local spinners = {"⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"}

    local ms = vim.loop.hrtime() / 1000000
    local frame = math.floor(ms / 120) % #spinners
    return string.format("%%<%s %s %s (%s%%%%)", spinners[frame + 1], title, msg, percentage)
  end
  return ''
end

return M
