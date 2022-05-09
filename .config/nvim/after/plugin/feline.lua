local ok, feline = pcall(require, 'feline')
if not ok then
  return
end
local u = require('utils')
---------------------------------PROPERTIES--------------------------------- {{{
local M = {}

local function get_icon(filename, extension, opts)
  local dok, devicons = pcall(require, "nvim-web-devicons")
  if not dok then
    return
  end

  local icon_str, icon_color = devicons.get_icon_color(filename, extension, { default = true })

  local icon = { str = icon_str }

  if opts.colored_icon ~= false then
    icon.hl = { fg = icon_color }
  end

  return icon
end

M.components = { active = {}, inactive = {} }

M.filetypes_to_mask = {
  "^aerial$",
  "^neo--tree$",
  "^neo--tree--popup$",
  "^NvimTree$",
  "^toggleterm$",
}

M.force_inactive = {
  filetypes = {
    "^frecency$",
    "^packer$",
    "^TelescopePrompt$",
    "^undotree$",
    "^NvimTree$",
  },
}

M.disable = {
  filetypes = {
    "^alpha$",
    "^dap-repl$",
    "^dapui_scopes$",
    "^dapui_stacks$",
    "^dapui_breakpoints$",
    "^dapui_watches$",
    "^DressingInput$",
    "^DressingSelect$",
    "^floaterm$",
    "^minimap$",
    "^qfs$",
    "^tsplayground$",
  },
}
---------------------------------------------------------------------------- }}}
-----------------------------------HELPERS---------------------------------- {{{
-- local lsp = require("feline.providers.lsp")
local git = require("feline.providers.git")
local vi_mode_utils = require("feline.providers.vi_mode")

local function mask_plugin()
  -- return om.find_pattern_match(M.filetypes_to_mask, vim.bo.filetype)
  return M.filetypes_to_mask and next(vim.tbl_filter(function(pattern)
    return vim.bo.filetype:match(pattern)
  end, M.filetypes_to_mask))
end

-- local function nvim_gps()
--   local has_gps, gps = om.safe_require("nvim-gps")
--   return has_gps, gps
-- end
---------------------------------------------------------------------------- }}}
---------------------------------COMPONENTS--------------------------------- {{{
------------------------------------SETUP----------------------------------- {{{
function M.setup()
  -- local colors = require("onedarkpro").get_colors(vim.g.onedarkpro_style)
  local colors = require('onenord.colors').load()
  colors.bg = '#1e222a'
  colors.statusline_div = '#2e323b'
  colors.statusline_bg = '#2e323b'
  colors.statusline_text = '#696C77'

  if not colors then
    return
  end

  M.vi_mode_colors = {
    NORMAL = colors.purple,
    OP = colors.purple,
    INSERT = colors.green,
    VISUAL = colors.orange,
    LINES = colors.orange,
    BLOCK = colors.orange,
    REPLACE = colors.green,
    ["V-REPLACE"] = colors.green,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.purple,
    SHELL = colors.purple,
    TERM = colors.purple,
    NONE = colors.yellow,
  }

  local InactiveStatusHL = {
    fg = colors.statusline_div,
    bg = "NONE",
    style = "underline",
  }

  local function default_hl()
    return {
      fg = colors.gray,
      bg = "NONE",
    }
  end

  local function block(bg, fg)
    if not bg then
      bg = colors.statusline_bg
    end
    if not fg then
      fg = colors.statusline_text
    end
    return {
      body = {
        fg = fg,
        bg = bg,
      },
      sep_left = {
        fg = colors.bg,
        bg = bg,
      },
      sep_right = {
        fg = bg,
        bg = colors.bg,
      },
    }
  end

  local function inverse_block()
    return {
      body = {
        fg = colors.bg,
        bg = vim.o.background == "light" and colors.black or colors.gray,
      },
      sep_left = {
        fg = colors.bg,
        bg = vim.o.background == "light" and colors.black or colors.gray,
      },
      sep_right = {
        fg = vim.o.background == "light" and colors.black or colors.gray,
        bg = colors.bg,
      },
    }
  end

  M.components.inactive = { { { provider = "", hl = InactiveStatusHL } } }
  ---------------------------------------------------------------------------- }}}
  ------------------------------CUSTOM COMPONENTS----------------------------- {{{
  local function line_percentage()
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local result = 'BOT'
    local percent = 100

    if curr_line ~= lines then
      percent = math.ceil(curr_line / lines * 99)
      result = string.format('%s', percent) .. '%%'
    end

    if percent == 1 then
      result = 'TOP'
    end

    return result
  end
  local function line_col()
    local row = vim.api.nvim_win_get_cursor(0)[1]
    local col = vim.api.nvim_win_get_cursor(0)[2]

    return row .. ":" .. col
  end
  ---------------------------------------------------------------------------- }}}
  -------------------------------LEFT COMPONENTS------------------------------ {{{
  M.components.active[1] = {
    ------------------------------------MODE------------------------------------ {{{
    {
      provider = function()
        return require("feline.providers.vi_mode").get_vim_mode() .. " "
      end,
      icon = "",
      hl = function()
        return {
          fg = colors.bg,
          bg = vi_mode_utils.get_mode_color(),
          style = 'bold'
        }
      end,
      left_sep = {
        str = "vertical_bar_thin",
        hl = function()
          return {
            fg = vi_mode_utils.get_mode_color(),
            bg = vi_mode_utils.get_mode_color(),
          }
        end,
      },
      right_sep = {
        str = "slant_right",
        hl = function()
          return {
            fg = vi_mode_utils.get_mode_color(),
            bg = colors.bg,
          }
        end,
      },
    },
    ---------------------------------------------------------------------------- }}}
    -------------------------------------GIT------------------------------------ {{{
    {
      provider = function()
        return "  " .. require("feline.providers.git").git_branch() .. " "
      end,
      truncate_hide = true,
      enabled = function()
        return git.git_info_exists()
      end,
      hl = function()
        return inverse_block().body
      end,
      left_sep = {
        str = "slant_right",
        hl = function()
          return inverse_block().sep_left
        end,
      },
      right_sep = {
        str = "slant_right",
        hl = function()
          return inverse_block().sep_right
        end,
      },
    },
    ---------------------------------------------------------------------------- }}}
    ----------------------------------FILE INFO--------------------------------- {{{
    {
      provider = function()
        local file = require("feline.providers.file").file_info({ icon = "" }, { type = "relative" })

        if mask_plugin() then
          file = vim.bo.filetype
        end

        return " " .. file .. " "
      end,
      hl = function()
        return block().body
      end,
      left_sep = {
        str = "slant_right",
        hl = function()
          return block().sep_left
        end,
      },
      right_sep = {
        str = "slant_right",
        hl = function()
          return block().sep_right
        end,
      },
    },
    ---------------------------------------------------------------------------- }}}
    ---------------------------------LSP ERRORS--------------------------------- {{{
    {
      provider = "diagnostic_errors",
      icon = " ",
      hl = function()
        return block(colors.red, colors.bg).body
      end,
      left_sep = {
        str = "slant_right",
        hl = function()
          return block(colors.red).sep_left
        end,
      },
      right_sep = {
        str = "slant_right",
        hl = function()
          return block(colors.red).sep_right
        end,
      },
    },
    ---------------------------------------------------------------------------- }}}
    --------------------------------LSP WARNINGS-------------------------------- {{{
    {
      provider = "diagnostic_warnings",
      icon = " ",
      hl = function()
        return block(colors.yellow, colors.bg).body
      end,
      left_sep = {
        str = "slant_right",
        hl = function()
          return block(colors.yellow).sep_left
        end,
      },
      right_sep = {
        str = "slant_right",
        hl = function()
          return block(colors.yellow).sep_right
        end,
      },
    },
    ---------------------------------------------------------------------------- }}}
    ----------------------------------LSP HINTS--------------------------------- {{{
    {
      provider = "diagnostic_hints",
      icon = " ",
      hl = function()
        return default_hl()
      end,
      left_sep = {
        str = " ",
        hl = function()
          return default_hl()
        end,
      },
      right_sep = {
        str = " ",
        hl = function()
          return default_hl()
        end,
      },
    },
    ---------------------------------------------------------------------------- }}}
    ----------------------------------LSP INFO---------------------------------- {{{
    {
      provider = "diagnostic_info",
      icon = " ",
      hl = function()
        return default_hl()
      end,
      left_sep = {
        str = " ",
        hl = function()
          return default_hl()
        end,
      },
      right_sep = {
        str = " ",
        hl = function()
          return default_hl()
        end,
      },
    },
    ---------------------------------------------------------------------------- }}}
    -------------------------------------GPS------------------------------------ {{{
    -- {
    --   provider = function()
    --     local _, gps = nvim_gps()
    --     return gps.get_location()
    --   end,
    --   short_provider = function()
    --     return ""
    --   end,
    --   enabled = function()
    --     local has_gps, gps = nvim_gps()
    --     return has_gps and vim.g.enable_gps and gps.is_available()
    --   end,
    --   hl = function()
    --     return default_hl()
    --   end,
    --   left_sep = {
    --     str = " ",
    --     hl = function()
    --       return default_hl()
    --     end,
    --   },
    --   right_sep = {
    --     str = " ",
    --     hl = function()
    --       return default_hl()
    --     end,
    --   },
    -- },
    ---------------------------------------------------------------------------- }}}
    -----------------------------------FILLER----------------------------------- {{{
    -- Fill in the section between the left and the right components
    {
      hl = function()
        return default_hl()
      end,
    },
  }
  ---------------------------------------------------------------------------- }}}
  ---------------------------------------------------------------------------- }}}
  ------------------------------RIGHT COMPONENTS------------------------------ {{{
  M.components.active[2] =
    --------------------------------ASYNC TESTING------------------------------- {{{
    {
      -- {
      --   provider = function()
      --     return async_run()
      --   end,
      --   enabled = function()
      --     return async_run() ~= nil
      --   end,
      --   hl = function()
      --     return default_hl()
      --   end,
      --   left_sep = {
      --     str = " ",
      --     hl = function()
      --       return default_hl()
      --     end,
      --   },
      --   right_sep = {
      --     str = "",
      --     hl = function()
      --       return default_hl()
      --     end,
      --   },
      -- },
      ---------------------------------------------------------------------------- }}}
      -----------------------------------LSP-------------------------------------- {{{
      {
        provider = function ()
          return "  "
        end,
        enabled = function()
          return u.lsp_active()
        end,
        hl = function()
          return block().body
        end,
        left_sep = {
          str = "slant_left",
          hl = function()
            return block().sep_right
          end,
        },
        right_sep = {
          str = "slant_left",
          hl = function()
            return block().sep_left
          end,
        },
      },
      ---------------------------------------------------------------------------- }}}
      ----------------------------------FILETYPE---------------------------------- {{{
      {
        provider = function()
          local filename = vim.api.nvim_buf_get_name(0)
          local extension = vim.fn.fnamemodify(filename, ":e")
          local filetype = vim.bo.filetype

          local icon = get_icon(filename, extension, {})
          return " " .. icon.str .. " " .. filetype .. " "
        end,
        enabled = function()
          return not mask_plugin()
        end,
        hl = function()
          return block().body
        end,
        left_sep = {
          str = "slant_left",
          hl = function()
            return block().sep_right
          end,
        },
        right_sep = {
          str = "slant_left",
          hl = function()
            return block().sep_left
          end,
        },
      },
      ---------------------------------------------------------------------------- }}}
      ---------------------------------LINE COLUMN-------------------------------- {{{
      {
        provider = function()
          return " " .. line_col() .. " "
        end,
        padding = true,
        hl = function()
          return inverse_block().body
        end,
        left_sep = {
          str = "slant_left",
          hl = function()
            return inverse_block().sep_right
          end,
        },
        right_sep = {
          str = "slant_left",
          hl = function()
            return inverse_block().sep_left
          end,
        },
      },
      ---------------------------------------------------------------------------- }}}
      -------------------------------LINE PERCENTAGE------------------------------ {{{
      {
        provider = function()
          local percent = line_percentage()

          return " " .. percent
        end,
        hl = function()
          return inverse_block().body
        end,
        left_sep = {
          str = "slant_left",
          hl = function()
            return inverse_block().sep_right
          end,
        },
        right_sep = {
          str = " ",
          hl = function()
            return inverse_block().body
          end,
        },
      },
      ---------------------------------------------------------------------------- }}}
    }
  ---------------------------------------------------------------------------- }}}
  -------------------------------FINALISE SETUP------------------------------- {{{
  feline.setup({
    colors = { fg = "NONE", bg = "NONE" },
    vi_mode_colors = M.vi_mode_colors,
    components = M.components,
    disable = M.disable,
    force_inactive = M.force_inactive,
  })
end
---------------------------------------------------------------------------- }}}
M.setup()

