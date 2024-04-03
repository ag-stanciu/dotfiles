return {
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        keys = {
            { "<C-n>", ":NvimTreeToggle<CR>", { silent = true } },
        },
        config = function()
            local nvimtree = require("nvim-tree")
            local util = require("hek.util")
            local signs = util.signs
            local width_ratio = 0.2
            local height_ratio = 0.9

            nvimtree.setup {
                auto_reload_on_write = true,
                disable_netrw = false,
                hijack_cursor = false,
                hijack_netrw = true,
                hijack_unnamed_buffer_when_opening = false,
                -- ignore_buffer_on_setup = false,
                -- open_on_setup = false,
                -- open_on_setup_file = false,
                open_on_tab = false,
                sort_by = "name",
                update_cwd = true,
                reload_on_bufenter = true,
                respect_buf_cwd = false,
                select_prompts = true,
                view = {
                    float = {
                        enable = true,
                        open_win_config = function()
                            local screen_w = vim.opt.columns:get()
                            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                            local window_w = screen_w * width_ratio
                            local window_h = screen_h * height_ratio
                            local window_w_int = math.floor(window_w)
                            local window_h_int = math.floor(window_h)
                            local center_x = (screen_w - window_w) / 0.8
                            local center_y = ((vim.opt.lines:get() - window_h) / 2)
                                - vim.opt.cmdheight:get()
                            return {
                                border = util.border_chars_outer_thin,
                                relative = 'editor',
                                row = center_y,
                                col = center_x,
                                width = window_w_int,
                                height = window_h_int,
                            }
                        end,
                    },
                    width = 35,
                    --[[ height = 30, ]]
                    -- hide_root_folder = false,
                    side = "right",
                    preserve_window_proportions = false,
                    number = false,
                    relativenumber = false,
                    signcolumn = "yes",
                    -- mappings = {
                    --     custom_only = false,
                    --     list = {},
                    -- },
                },
                renderer = {
                    add_trailing = false,
                    group_empty = false,
                    highlight_git = true,
                    highlight_opened_files = "none",
                    root_folder_modifier = ":t",
                    indent_markers = {
                        enable = true,
                        icons = {
                            corner = "└ ",
                            edge = "│ ",
                            none = "  ",
                        },
                    },
                    icons = {
                        webdev_colors = true,
                        git_placement = "signcolumn",
                        padding = " ",
                        symlink_arrow = " ➛ ",
                        show = {
                            file = true,
                            folder = true,
                            folder_arrow = false,
                            git = false,
                        },
                        glyphs = {
                            default = "",
                            symlink = "",
                            folder = {
                                default = "󰉋",
                                empty = "󰉖",
                                empty_open = "",
                                open = "󰝰",
                                symlink = "󰉒",
                                symlink_open = "",
                                arrow_open = "",
                                arrow_closed = "",
                            },
                            git = {
                                unstaged = "",
                                staged = "ﰶ",
                                unmerged = "",
                                renamed = "➜",
                                untracked = "●",
                                deleted = "﯀",
                                ignored = "",
                            },
                        },
                    },
                    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "package.json" },
                },
                hijack_directories = {
                    enable = false,
                    auto_open = true,
                },
                update_focused_file = {
                    enable = true,
                    update_cwd = true,
                    ignore_list = {},
                },
                -- ignore_ft_on_setup = {},
                system_open = {
                    cmd = "",
                    args = {},
                },
                diagnostics = {
                    enable = false,
                    show_on_dirs = false,
                    icons = {
                        hint = signs.Hint,
                        info = signs.Info,
                        warning = signs.Warning,
                        error = signs.Error,
                    },
                },
                filters = {
                    dotfiles = false,
                    custom = {
                        "^.git$",
                    },
                    exclude = {},
                },
                git = {
                    enable = true,
                    ignore = false,
                    timeout = 400,
                },
                actions = {
                    use_system_clipboard = true,
                    change_dir = {
                        enable = true,
                        global = false,
                        restrict_above_cwd = false,
                    },
                    open_file = {
                        quit_on_open = true,
                        resize_window = true,
                        window_picker = {
                            enable = true,
                            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                            exclude = {
                                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                                buftype = { "nofile", "terminal", "help" },
                            },
                        },
                    },
                },
                trash = {
                    cmd = "trash",
                    require_confirm = true,
                },
                live_filter = {
                    prefix = "[FILTER]: ",
                    always_show_folders = true,
                },
                log = {
                    enable = false,
                    truncate = false,
                    types = {
                        all = false,
                        config = false,
                        copy_paste = false,
                        diagnostics = false,
                        git = false,
                        profile = false,
                    },
                },
            }

            vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
        end
    },
    -- {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     cmd = "Neotree",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-tree/nvim-web-devicons",
    --         "MunifTanjim/nui.nvim",
    --     },
    --     keys = {
    --         { "<C-n>", ":Neotree toggle<CR>", { silent = true } },
    --     },
    --     init = function()
    --         vim.g.neo_tree_remove_legacy_commands = 1
    --     end,
    --     opts = {
    --         popup_border_style = "single",
    --         filesystem = {
    --             bind_to_cwd = true,
    --             follow_current_file = true,
    --             filtered_items = {
    --                 hide_dotfiles = false,
    --             },
    --             window = {
    --                 popup = {
    --                     position = { col = "100%", row = "2" },
    --                     size = function(state)
    --                         local root_name = vim.fn.fnamemodify(state.path, ":~")
    --                         local root_len = string.len(root_name) + 4
    --                         return {
    --                             width = math.max(root_len, 50),
    --                             height = vim.o.lines - 6
    --                         }
    --                     end
    --                 }
    --             }
    --         },
    --         default_component_configs = {
    --             indent = {
    --                 with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
    --                 expander_collapsed = "",
    --                 expander_expanded = "",
    --                 expander_highlight = "NeoTreeExpander",
    --             },
    --         },
    --         source_selector = {
    --             winbar = true,
    --         },
    --         window = {
    --             position = "float"
    --         }
    --     },
    -- }
}
