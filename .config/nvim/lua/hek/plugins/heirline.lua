-- return {}
return {
    "rebelot/heirline.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "neovim/nvim-lspconfig",
    },
    config = function()
        local heirline = require("heirline")
        local conditions = require("heirline.conditions")
        local utils = require("heirline.utils")
        local colors = require("hek.color").colors
        local util = require("hek.util")

        -- Filetypes where certain elements of the statusline will not be shown
        local filetypes = {
            "^neo--tree$",
            "^neotest--summary$",
            "^neo--tree--popup$",
            "^NvimTree$",
            "^toggleterm$",
        }

        -- Filetypes which force the statusline to be inactive
        local force_inactive_filetypes = {
            "^aerial$",
            "^alpha$",
            "^chatgpt$",
            "^DressingInput$",
            "^frecency$",
            "^lazy$",
            "^netrw$",
            "^TelescopePrompt$",
            "^undotree$",
        }

        conditions.buffer_not_empty = function()
            return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
        end

        conditions.hide_in_width = function(size)
            return vim.api.nvim_get_option_value("columns", {}) > (size or 140)
        end

        local Align = { provider = "%=", hl = { bg = colors.bg } }
        local Space = { provider = " " }
        local RightSep = { provider = util.powerline.triangle.right, hl = { bg = colors.bg, fg = colors.bg_dark } }
        local LeftSep = { provider = util.powerline.triangle.left_2, hl = { bg = colors.bg, fg = colors.bg_dark } }
        local InvRightSep = { provider = util.powerline.triangle.right_2, hl = { bg = colors.bg, fg = colors.bg_dark } }
        local InvLeftSep = { provider = util.powerline.triangle.left, hl = { bg = colors.bg, fg = colors.bg_dark } }

        local VIMODE_COLORS = {
            ["n"] = colors.purple,
            ["no"] = colors.purple,
            ["nov"] = colors.purple,
            ["noV"] = colors.purple,
            ["no"] = colors.purple,
            ["niI"] = colors.blue,
            ["niR"] = colors.blue,
            ["niV"] = colors.blue,
            ["v"] = colors.orange,
            ["vs"] = colors.orange,
            ["V"] = colors.orange,
            ["Vs"] = colors.orange,
            [""] = colors.yellow,
            ["s"] = colors.yellow,
            ["s"] = colors.teal,
            ["S"] = colors.teal,
            [""] = colors.yellow,
            ["i"] = colors.green,
            ["ic"] = colors.green,
            ["ix"] = colors.green,
            ["R"] = colors.green,
            ["Rc"] = colors.green,
            ["Rv"] = colors.green,
            ["Rx"] = colors.green,
            ["c"] = colors.red,
            ["cv"] = colors.red,
            ["rm"] = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.cyan,
            ["t"] = colors.purple,
            ["nt"] = colors.purple,
            ["null"] = colors.dark3,
        }

        local ViMode = {
            init = function(self)
                self.mode = vim.api.nvim_get_mode().mode
                if not self.once then
                    vim.api.nvim_create_autocmd("ModeChanged", {
                        pattern = "*:*o",
                        command = "redrawstatus",
                    })
                    self.once = true
                end
            end,
            static = {
                mode_names = {
                    ["n"] = "NORMAL",
                    ["no"] = "OP",
                    ["nov"] = "OP",
                    ["noV"] = "OP",
                    ["no"] = "OP",
                    ["niI"] = "NORMAL",
                    ["niR"] = "NORMAL",
                    ["niV"] = "NORMAL",
                    ["v"] = "VISUAL",
                    ["vs"] = "VISUAL",
                    ["V"] = "LINES",
                    ["Vs"] = "LINES",
                    [""] = "BLOCK",
                    ["s"] = "BLOCK",
                    ["s"] = "SELECT",
                    ["S"] = "SELECT",
                    [""] = "BLOCK",
                    ["i"] = "INSERT",
                    ["ic"] = "INSERT",
                    ["ix"] = "INSERT",
                    ["R"] = "REPLACE",
                    ["Rc"] = "REPLACE",
                    ["Rv"] = "V-REPLACE",
                    ["Rx"] = "REPLACE",
                    ["c"] = "COMMAND",
                    ["cv"] = "COMMAND",
                    ["ce"] = "COMMAND",
                    ["r"] = "ENTER",
                    ["rm"] = "MORE",
                    ["r?"] = "CONFIRM",
                    ["!"] = "SHELL",
                    ["t"] = "TERM",
                    ["nt"] = "TERM",
                    ["null"] = "NONE",
                },
            },
            provider = function(self)
                return string.format("%s", self.mode_names[self.mode])
            end,
            hl = function(self)
                local mode = self.mode:sub(1, 1)
                return { fg = VIMODE_COLORS[mode], bg = colors.bg_dark, bold = true }
            end,
            update = {
                "ModeChanged",
            },
        }

        local ViModeSepLeft = {
            init = function(self)
                self.mode = vim.api.nvim_get_mode().mode
                if not self.once then
                    vim.api.nvim_create_autocmd("ModeChanged", {
                        pattern = "*:*o",
                        command = "redrawstatus",
                    })
                    self.once = true
                end
            end,
            -- provider = "▌",
            -- provider = "▊ ",
            provider = util.powerline.bar.block .. " ",
            hl = function(self)
                local mode = self.mode:sub(1, 1)
                return { fg = VIMODE_COLORS[mode], bg = colors.bg_dark }
            end,
            update = {
                "ModeChanged",
            },
        }

        local ViModeSepRight = {
            init = function(self)
                self.mode = vim.api.nvim_get_mode().mode
                if not self.once then
                    vim.api.nvim_create_autocmd("ModeChanged", {
                        pattern = "*:*o",
                        command = "redrawstatus",
                    })
                    self.once = true
                end
            end,
            -- provider = "▐",
            -- provider = "▊",
            provider = util.powerline.bar.block,
            hl = function(self)
                local mode = self.mode:sub(1, 1)
                return { fg = VIMODE_COLORS[mode], bg = colors.bg }
            end,
            update = {
                "ModeChanged",
            },
        }

        local FileNameBlock = {
            init = function(self)
                self.filename = vim.api.nvim_buf_get_name(0)
            end,
            condition = conditions.buffer_not_empty,
            hl = { bg = colors.bg, fg = colors.fg },
            Space,
        }

        local FileIcon = {
            init = function(self)
                local filename = self.filename
                local extension = vim.fn.fnamemodify(filename, ":e")
                self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(
                    vim.fn.fnamemodify(filename, ":t"),
                    extension,
                    { default = true }
                )
            end,
            provider = function(self)
                return self.icon and (" " .. self.icon .. " ")
            end,
            hl = function(self)
                return { fg = self.icon_color }
            end,
        }

        local FileName = {
            provider = function(self)
                local filename = vim.fn.fnamemodify(self.filename, ":~:.")
                if filename == "" then
                    return "[No Name]"
                end
                if not conditions.width_percent_below(#filename, 0.25) then
                    filename = vim.fn.pathshorten(filename)
                end
                return filename
            end,
            hl = { fg = colors.dark5 },
        }

        local FileFlags = {
            {
                condition = function()
                    return vim.bo.modified
                end,
                provider = " ● ",
                hl = { fg = colors.dark5 },
            },
            {
                condition = function()
                    return not vim.bo.modifiable or vim.bo.readonly
                end,
                provider = "",
                hl = { fg = colors.red },
            },
        }

        local FileNameModifer = {
            hl = function()
                if vim.bo.modified then
                    return { fg = colors.dark5, bold = true, force = true }
                end
            end,
        }

        FileNameBlock = utils.insert(
            FileNameBlock,
            -- FileIcon,
            utils.insert(FileNameModifer, FileName),
            unpack(FileFlags),
            { provider = "%< " }
        )

        local FileType = {
            init = function(self)
                self.filename = vim.api.nvim_buf_get_name(0)
            end,
            hl = { bg = colors.bg_dark, fg = colors.dark5 },
            condition = function()
                return conditions.buffer_not_empty() and conditions.hide_in_width()
            end,
            InvLeftSep,
            FileIcon,
            {
                provider = function()
                    return (vim.bo.filetype) .. " "
                end,
            },
            InvRightSep
        }

        -- local FileSize = {
        --     provider = function()
        --         local suffix = { "b", "k", "M", "G", "T", "P", "E" }
        --         local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
        --         fsize = (fsize < 0 and 0) or fsize
        --         if fsize < 1024 then
        --             return " " .. fsize .. suffix[1] .. " "
        --         end
        --         local i = math.floor((math.log(fsize) / math.log(1024)))
        --         return string.format(" %.2g%s ", fsize / math.pow(1024, i), suffix[i + 1])
        --     end,
        --     condition = function()
        --         return conditions.buffer_not_empty() and conditions.hide_in_width()
        --     end,
        --     hl = { bg = colors.bg_dark, fg = colors.dark5 },
        -- }

        local LineCol = {
            condition = function()
                return conditions.buffer_not_empty() and conditions.hide_in_width()
            end,
            hl = { bg = colors.bg_dark, fg = colors.dark5 },
            InvLeftSep,
            {
                provider = " %l:%2c ",
            },
            InvRightSep,
        }

        local FilePercent = {
            condition = function()
                return conditions.buffer_not_empty() and conditions.hide_in_width()
            end,
            hl = { bg = colors.bg_dark, fg = colors.dark5 },
            InvLeftSep,
            {
                provider = "  %P ",
            }
        }

        local LSPActive = {
            condition = function()
                return conditions.hide_in_width(120) and conditions.lsp_attached()
            end,
            update = { "LspAttach", "LspDetach" },
            hl = { bg = colors.bg_dark, fg = colors.green, bold = true, italic = false },
            InvLeftSep,
            {
                provider = function()
                    local names = {}
                    for _, server in pairs(vim.lsp.get_clients()) do
                        if server.name ~= "null-ls" then
                            table.insert(names, server.name)
                        end
                    end
                    -- return "  " .. table.concat(names, " ") .. " "
                    return " "
                end,
            },
            InvRightSep,
        }

        local Diagnostics = {
            condition = function()
                return conditions.buffer_not_empty() and conditions.hide_in_width() and conditions.has_diagnostics()
            end,
            static = {
                error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
                warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
                info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
                hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
            },
            init = function(self)
                self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
                self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
                self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
                self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
            end,
            update = { "DiagnosticChanged", "BufEnter" },
            hl = { bg = colors.bg },
            Space,
            {
                provider = function(self)
                    return self.errors > 0 and (self.error_icon .. self.errors .. " ")
                end,
                hl = { fg = colors.red },
            },
            {
                provider = function(self)
                    return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
                end,
                hl = { fg = colors.yellow },
            },
            {
                provider = function(self)
                    return self.info > 0 and (self.info_icon .. self.info .. " ")
                end,
                hl = { fg = colors.fg },
            },
            {
                provider = function(self)
                    return self.hints > 0 and (self.hint_icon .. self.hints)
                end,
                hl = { fg = colors.fg },
            },
            Space,
        }

        local head_cache = {}

        local function get_git_detached_head()
            local git_branches_file = io.popen("git branch -a --no-abbrev --contains", "r")
            if not git_branches_file then
                return
            end
            local git_branches_data = git_branches_file:read("*l")
            io.close(git_branches_file)
            if not git_branches_data then
                return
            end

            local branch_name = git_branches_data:match(".*HEAD (detached %w+ [%w/-]+)")
            if branch_name and string.len(branch_name) > 0 then
                return branch_name
            end
        end

        local function parent_pathname(path)
            local i = path:find("[\\/:][^\\/:]*$")
            if not i then
                return
            end
            return path:sub(1, i - 1)
        end

        local function get_git_dir(path)
            local function has_git_dir(dir)
                local git_dir = dir .. "/.git"
                if vim.fn.isdirectory(git_dir) == 1 then
                    return git_dir
                end
            end

            local function has_git_file(dir)
                local gitfile = io.open(dir .. "/.git")
                if gitfile ~= nil then
                    local git_dir = gitfile:read():match("gitdir: (.*)")
                    gitfile:close()

                    return git_dir
                end
            end

            local function is_path_absolute(dir)
                local patterns = {
                    "^/",
                    "^%a:[/\\]",
                }
                for _, pattern in ipairs(patterns) do
                    if string.find(dir, pattern) then
                        return true
                    end
                end
                return false
            end

            if not path or path == "." then
                path = vim.fn.getcwd()
            end

            local git_dir
            while path do
                git_dir = has_git_dir(path) or has_git_file(path)
                if git_dir ~= nil then
                    break
                end
                path = parent_pathname(path)
            end

            if not git_dir then
                return
            end

            if is_path_absolute(git_dir) then
                return git_dir
            end
            return path .. "/" .. git_dir
        end

        local Git = {
            condition = function()
                return conditions.buffer_not_empty() and conditions.is_git_repo()
            end,
            init = function(self)
                ---@diagnostic disable-next-line: undefined-field
                self.status_dict = vim.b.gitsigns_status_dict
                self.has_changes = self.status_dict.added ~= 0
                    or self.status_dict.removed ~= 0
                    or self.status_dict.changed ~= 0
            end,
            hl = { bg = colors.bg_dark, fg = colors.blue },
            LeftSep,
            {
                provider = function()
                    if vim.bo.filetype == "help" then
                        return
                    end
                    local current_file = vim.fn.expand("%:p")
                    local current_dir

                    if vim.fn.getftype(current_file) == "link" then
                        local real_file = vim.fn.resolve(current_file)
                        current_dir = vim.fn.fnamemodify(real_file, ":h")
                    else
                        current_dir = vim.fn.expand("%:p:h")
                    end

                    local git_dir = get_git_dir(current_dir)
                    if not git_dir then
                        return
                    end

                    local git_root = git_dir:gsub("/.git/?$", "")
                    local head_stat = vim.loop.fs_stat(git_dir .. "/HEAD")

                    if head_stat and head_stat.mtime then
                        if
                            head_cache[git_root]
                            and head_cache[git_root].mtime == head_stat.mtime.sec
                            and head_cache[git_root].branch
                        then
                            return "  " .. head_cache[git_root].branch
                        else
                            local head_file = vim.loop.fs_open(git_dir .. "/HEAD", "r", 438)
                            if not head_file then
                                return
                            end
                            local head_data = vim.loop.fs_read(head_file, head_stat.size, 0)
                            if not head_data then
                                return
                            end
                            vim.loop.fs_close(head_file)

                            head_cache[git_root] = {
                                head = head_data,
                                mtime = head_stat.mtime.sec,
                            }
                        end
                    else
                        return
                    end

                    local branch_name = head_cache[git_root].head:match("ref: refs/heads/([^\n\r%s]+)")
                    if not branch_name then
                        branch_name = get_git_detached_head()
                        if not branch_name then
                            head_cache[git_root].branch = ""
                            return
                        end
                    end

                    head_cache[git_root].branch = branch_name
                    return "  " .. branch_name
                end,
                hl = { fg = colors.blue, bold = true },
            },
            -- {
            -- 	provider = function(self)
            -- 		local count = self.status_dict.added or 0
            -- 		return count > 0 and ("  " .. count)
            -- 	end,
            -- 	hl = { fg = colors.green },
            -- },
            -- {
            -- 	provider = function(self)
            -- 		local count = self.status_dict.removed or 0
            -- 		return count > 0 and ("  " .. count)
            -- 	end,
            -- 	hl = { fg = colors.red },
            -- },
            -- {
            -- 	provider = function(self)
            -- 		local count = self.status_dict.changed or 0
            -- 		return count > 0 and ("  " .. count)
            -- 	end,
            -- 	hl = { fg = colors.peach },
            -- },
            Space,
            RightSep,
        }

        -- local FileEncoding = {
        --     provider = function()
        --         local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc
        --         return " " .. enc:upper() .. " "
        --     end,
        --     condition = function()
        --         return conditions.buffer_not_empty() and conditions.hide_in_width()
        --     end,
        --     hl = { bg = colors.bg, fg = colors.dark5 },
        -- }
        --
        -- local FileFormat = {
        --     provider = function()
        --         local fmt = vim.bo.fileformat
        --         if fmt == "unix" then
        --             return " LF "
        --         elseif fmt == "mac" then
        --             return " CR "
        --         else
        --             return " CRLF "
        --         end
        --     end,
        --     hl = { bg = colors.bg, fg = colors.dark5 },
        --     condition = function()
        --         return conditions.buffer_not_empty() and conditions.hide_in_width()
        --     end,
        -- }

        -- local IndentSizes = {
        --     provider = function()
        --         local indent_type = vim.api.nvim_buf_get_option(0, "expandtab") and "Spaces" or "Tab Size"
        --         local indent_size = vim.api.nvim_buf_get_option(0, "tabstop")
        --         return (" %s: %s "):format(indent_type, indent_size)
        --     end,
        --     hl = { bg = colors.bg, fg = colors.dark5 },
        --     condition = function()
        --         return conditions.buffer_not_empty() and conditions.hide_in_width()
        --     end,
        -- }

        local SearchCount = {
            condition = function()
                return vim.v.hlsearch ~= 0 and vim.o.cmdheight == 0
            end,
            init = function(self)
                local ok, search = pcall(vim.fn.searchcount)
                if ok and search.total then
                    self.search = search
                end
            end,
            provider = function(self)
                local search = self.search
                return string.format("[%d/%d]", search.current, math.min(search.total, search.maxcount))
            end,
        }

        local MacroRec = {
            condition = function()
                return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0
            end,
            provider = " ",
            hl = { fg = "orange", bold = true },
            utils.surround({ "[", "]" }, nil, {
                provider = function()
                    return vim.fn.reg_recording()
                end,
                hl = { fg = "green", bold = true },
            }),
            update = {
                "RecordingEnter",
                "RecordingLeave",
                -- redraw the statusline on recording events
                callback = vim.schedule_wrap(function()
                    vim.cmd("redrawstatus")
                end),
            }
        }

        local StatusLine = {
            static = {
                filetypes = filetypes,
                force_inactive_filetypes = force_inactive_filetypes,
            },
            condition = function(self)
                return not conditions.buffer_matches({
                    filetype = self.force_inactive_filetypes,
                })
            end,
            ViModeSepLeft,
            ViMode,
            RightSep,
            Git,
            -- FileNameBlock,
            -- FileSize,
            SearchCount,
            MacroRec,
            Align,
            Diagnostics,
            LSPActive,
            -- FileEncoding,
            FileType,
            LineCol,
            FilePercent,
            -- FileFormat,
            -- IndentSizes,
            -- GitPowerline,
            ViModeSepRight,
        }

        heirline.setup({ statusline = StatusLine })
    end,
}
