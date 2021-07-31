local present1, gl = pcall(require, "galaxyline")
local present2, condition = pcall(require, "galaxyline.condition")
if not (present1 or present2) then
    return
end
local fn = vim.fn

local gls = gl.section

gl.short_line_list = {" "}

local global_theme = "themes/" .. vim.g.nvchad_theme
local colors = require(global_theme)

local function mode_alias(m)
  local alias = {
    n = 'NORMAL',
    i = 'INSERT',
    c = 'COMMAND',
    R = 'REPLACE',
    t = 'TERMINAL',
    [''] = 'V-BLOCK',
    V = 'V-LINE',
    v = 'VISUAL',
  }

  return alias[m] or ''
end

local function mode_color(m)
  local mode_colors = {
    normal =  colors.nord_blue,
    insert =  colors.green,
    visual =  colors.cyan,
    replace =  colors.green,
    command = colors.orange,
  }

  local color = {
    n = mode_colors.normal,
    i = mode_colors.insert,
    c = mode_colors.command,
    R = mode_colors.replace,
    t = mode_colors.insert,
    [''] = mode_colors.visual,
    V = mode_colors.visual,
    v = mode_colors.visual,
  }

  return color[m] or colors.bg_light
end

gls.left[1] = {
    FirstElement = {
        provider = function()
          return "▋"
        end,
        highlight = {colors.nord_blue, colors.nord_blue}
    }
}

gls.left[2] = {
    statusIcon = {
        provider = function()
            -- return "  "
            -- return " ﯑ "
            return "  "
        end,
        highlight = {colors.statusline_bg, colors.nord_blue},
        separator = "  ",
        separator_highlight = {colors.nord_blue, colors.lightbg}
    }
}

gls.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
        highlight = {colors.white, colors.lightbg}
    }
}

gls.left[4] = {
    FileName = {
         -- provider = {"FileName"},
        provider = function()
          return fn.expand("%:f")
        end,
        condition = condition.buffer_not_empty,
        highlight = {colors.white, colors.lightbg},
        separator = " ",
        separator_highlight = {colors.lightbg, colors.lightbg2}
    }
}

gls.left[5] = {
    current_dir = {
        provider = function()
            local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            return "  " .. dir_name .. " "
        end,
        highlight = {colors.grey_fg2, colors.lightbg2},
        separator = " ",
        separator_highlight = {colors.lightbg2, colors.statusline_bg}
    }
}

local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
        return true
    end
    return false
end

gls.left[6] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.white, colors.statusline_bg}
    }
}

gls.left[7] = {
    DiffModified = {
        provider = "DiffModified",
        condition = checkwidth,
        icon = "   ",
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

gls.left[8] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

gls.left[9] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = {colors.red, colors.statusline_bg}
    }
}

gls.left[10] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = {colors.yellow, colors.statusline_bg}
    }
}

gls.right[1] = {
    lsp_status = {
        provider = function()
            local clients = vim.lsp.get_active_clients()
            if next(clients) ~= nil then
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return " " .. "  " .. " LSP "
                    end
                end
                return ""
            else
                return ""
            end
        end,
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

gls.right[2] = {
    GitIcon = {
        provider = function()
            return " "
        end,
        condition = require("galaxyline.condition").check_git_workspace,
        highlight = {colors.grey_fg2, colors.statusline_bg},
        separator = " ",
        separator_highlight = {colors.statusline_bg, colors.statusline_bg}
    }
}

gls.right[3] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.condition").check_git_workspace,
        highlight = {colors.grey_fg2, colors.statusline_bg}
    }
}

-- gls.right[4] = {
--     viMode_icon = {
--         provider = function()
--             return " "
--         end,
--         highlight = {colors.statusline_bg, colors.red},
--         separator = " ",
--         separator_highlight = {colors.red, colors.statusline_bg}
--     }
-- }
-- 
-- gls.right[6] = {
--     some_icon = {
--         provider = function()
--             return " "
--         end,
--         separator = "",
--         separator_highlight = {colors.green, colors.lightbg},
--         highlight = {colors.lightbg, colors.green}
--     }
-- }

gls.right[7] = {
    line_percentage = {
        provider = function()
            local current_line = vim.fn.line(".")
            local total_line = vim.fn.line("$")

            if current_line == 1 then
                return "Top"
            elseif current_line == vim.fn.line("$") then
                return "Bot"
            end
            local result, _ = math.modf((current_line / total_line) * 100)
            return "" .. result .. "%"
        end,
        separator_highlight = {colors.lightbg, colors.statusline_bg},
        highlight = {colors.white, colors.lightbg},
        separator = " ",
        icon = " ",
    }
}

vim.api.nvim_command('hi GalaxyViModeReverse guibg=' .. colors.lightbg)
gls.right[8] = {
    ViMode = {
      separator = " ",
      icon = "  ",
      highlight = {colors.statusline_bg, mode_color()},
      separator_highlight = 'GalaxyViModeReverse',
      provider = function()
          local m = vim.fn.mode() or vim.fn.visualmode()
          local mode = mode_alias(m)
          local color = mode_color(m)
          vim.api.nvim_command('hi GalaxyViMode guibg=' .. color)
          vim.api.nvim_command('hi GalaxyViModeReverse guifg=' .. color)
          return '' .. mode .. ' '
      end,
    }
}
