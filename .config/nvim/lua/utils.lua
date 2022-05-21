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

M.simple_border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

M.lua_lsp_status = function()
  local clients = vim.lsp.get_active_clients()
  local msg = " "--"  n/a"
  if next(clients) ~= nil then
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return "  "
      end
    end
    return msg
  else
    return msg
  end
end

M.lsp_active = function ()
  local clients = vim.lsp.get_active_clients()
  if next(clients) ~= nil then
    return true
  end
  return false
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

M.signs = { Error = "", Warn = "", Hint = "", Info = "" }

M.powerline = {
  circle = {
      left = "",
      right = "",
  },
  arrow = {
      left = "",
      right = "",
  },
  triangle = {
      left = "",
      right = "",
  },
  none = {
      left = "",
      right = "",
  },
}

M.winbar = function ()
  local colors = require("colorscheme").colors
  colors.statusline_bg = '#2e323b'
  colors.statusline_text = '#696C77'
  vim.api.nvim_set_hl(0, "WinBarSeparatorLeft", { fg = colors.statusline_bg, bg = colors.bg })
  vim.api.nvim_set_hl(0, "WinBarContent", { fg = colors.statusline_text, bg = colors.statusline_bg })
  vim.api.nvim_set_hl(0, "WinBarSeparatorRight", { fg = colors.statusline_bg, bg = colors.bg })

  if vim.api.nvim_eval_statusline("%f",{})["str"] == "[No Name]" then
    return ""
  end
  return "%#WinBarSeparatorLeft#"
    .. "█"
    .. "%*"
    .. "%#WinBarContent#"
    .. "%f"
    .. "%*"
    .. "%#WinBarSeparatorRight#"
    .. ""
    .. "%*"
end

M.str_split = function (s, delimiter)
  local result = {};
  for match in (s..delimiter):gmatch("(.-)"..delimiter) do
    table.insert(result, match);
  end
  return result;
end

return M
