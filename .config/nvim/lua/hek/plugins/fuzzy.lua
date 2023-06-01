return {
    {
        -- Telescope
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
        },
        keys = {
            { "<leader><space>", "<cmd>Telescope buffers<CR>" },
            { "<leader>ff",      "<cmd>Telescope find_files<CR>" },
            { "<leader>fb",      "<cmd>Telescope current_buffer_fuzzy_find<CR>" },
            { "<leader>fh",      "<cmd> Telescope help_tags<CR>" },
            { "<leader>ft",      "<cmd> Telescope tags<CR>" },
            { "<leader>fs",      "<cmd> Telescope grep_string<CR>" },
            { "<leader>fw",      "<cmd> Telescope live_grep<CR>" },
            -- { "<leader>fo", function(}
            --     <cmd>Telescope tags { only_current_buffer = true }
            -- end}
            { "<leader>?",       "<cmd> Telescope oldfiles<CR>" },
            { "<leader>gt",      "<cmd> Telescope git_status<CR>" },
            { "<leader>fr",      "<cmd> Telescope lsp_references<CR>" }
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local u = require("hek.util")

            -- Telescope
            telescope.setup(
                {
                    defaults = {
                        mappings = {
                            i = {
                                ["<esc>"] = actions.close,
                                ["<Tab>"] = "move_selection_previous",
                                ["<S-Tab>"] = "move_selection_next",
                            },
                        },
                        vimgrep_arguments = {
                            "rg",
                            "--color=never",
                            "--no-heading",
                            "--with-filename",
                            "--line-number",
                            "--column",
                            "--smart-case"
                        },
                        prompt_prefix = "  ",
                        selection_caret = " ▶ ",
                        entry_prefix = "   ",
                        initial_mode = "insert",
                        selection_strategy = "reset",
                        sorting_strategy = "descending",
                        layout_strategy = "horizontal",
                        results_title = "",
                        layout_config = {
                            horizontal = {
                                prompt_position = "bottom",
                                preview_width = 0.55,
                                results_width = 0.8
                            },
                            vertical = {
                                mirror = false,
                            },
                            width = 0.80,
                            height = 0.80,
                            preview_cutoff = 120
                        },
                        file_sorter = require("telescope.sorters").get_fuzzy_file,
                        file_ignore_patterns = {},
                        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                        path_display = { "absolute" },
                        winblend = 0,
                        border = true,
                        -- borderchars = { "" },
                        borderchars = {
                            -- u.border_square,
                            prompt = u.border_chars_outer_thin_telescope_prompt,
                            results = u.border_chars_outer_thin_telescope,
                            preview = u.border_chars_outer_thin_telescope
                        },
                        color_devicons = true,
                        use_less = true,
                        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                        -- Developer configurations: Not meant for general override
                        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker
                    },
                    extensions = {
                        fzf = {
                            fuzzy = true,                    -- false will only do exact matching
                            override_generic_sorter = false, -- override the generic sorter
                            override_file_sorter = true,     -- override the file sorter
                            case_mode = "smart_case"         -- or "ignore_case" or "respect_case"
                            -- the default case_mode is "smart_case"
                        }
                    },
                }
            )
            telescope.load_extension('fzf')
            telescope.load_extension('ui-select')

            --Add leader shortcuts
            -- vim.keymap.set("n", "<leader><space>", require('telescope.builtin').buffers)
            -- vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files)
            -- vim.keymap.set("n", "<leader>fb", require('telescope.builtin').current_buffer_fuzzy_find)
            -- vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
            -- vim.keymap.set("n", "<leader>ft", require("telescope.builtin").tags)
            -- vim.keymap.set("n", "<leader>fs", require("telescope.builtin").grep_string)
            -- vim.keymap.set("n", "<leader>fw", require("telescope.builtin").live_grep)
            -- vim.keymap.set("n", "<leader>fo", function()
            --     require('telescope.builtin').tags { only_current_buffer = true }
            -- end)
            -- vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles)
            -- vim.keymap.set("n", "<leader>gt", require("telescope.builtin").git_status)

            -- vim.keymap.set("n", "<leader><space>", "<cmd>Telescope buffers<CR>")
            -- vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
            -- vim.keymap.set("n", "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
            -- vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags<CR>")
            -- vim.keymap.set("n", "<leader>ft", "<cmd> Telescope tags<CR>")
            -- vim.keymap.set("n", "<leader>fs", "<cmd> Telescope grep_string<CR>")
            -- vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep<CR>")
            -- -- vim.keymap.set("n", "<leader>fo", function()
            -- --     <cmd>Telescope tags { only_current_buffer = true }
            -- -- end)
            -- vim.keymap.set("n", "<leader>?", "<cmd> Telescope oldfiles<CR>")
            -- vim.keymap.set("n", "<leader>gt", "<cmd> Telescope git_status<CR>")
        end
    },
    -- {
    --     "ibhagwan/fzf-lua",
    --     cmd = "FzfLua",
    --     dependencies = { 'nvim-tree/nvim-web-devicons' },
    --     keys = {
    --         { "<leader><space>", "<cmd>FzfLua buffers<CR>" },
    --         { "<leader>ff",      "<cmd>FzfLua files<CR>" },
    --         { "<leader>fb",      "<cmd>FzfLua lgrep_curbuf<CR>" },
    --         { "<leader>fh",      "<cmd>FzfLua help_tags<CR>" },
    --         { "<leader>ft",      "<cmd>FzfLua tags<CR>" },
    --         { "<leader>fs",      "<cmd>FzfLua grep<CR>" },
    --         { "<leader>fw",      "<cmd>FzfLua live_grep<CR>" },
    --         { "<leader>?",       "<cmd>FzfLua oldfiles<CR>" },
    --         { "<leader>gt",      "<cmd>FzfLua git_status<CR>" }
    --     },
    --     config = function()
    --         local fzflua = require("fzf-lua")
    --         local utils = fzflua.utils
    --         local function hl_validate(hl)
    --             return not utils.is_hl_cleared(hl) and hl or nil
    --         end
    --         fzflua.setup({
    --             desc       = "match telescope default highlights|keybinds",
    --             fzf_opts   = { ["--layout"] = "default",["--marker"] = "+" },
    --             files      = {
    --                 prompt = "Files> "
    --             },
    --             winopts    = {
    --                 width   = 0.8,
    --                 height  = 0.85,
    --                 preview = {
    --                     hidden       = "nohidden",
    --                     vertical     = "up:45%",
    --                     horizontal   = "right:50%",
    --                     layout       = "flex",
    --                     flip_columns = 120,
    --                     scrollbar    = false,
    --                     winopts = {
    --                         cursorline = false,
    --                     }
    --                 },
    --                 hl      = {
    --                     normal       = hl_validate "TelescopeNormal",
    --                     border       = hl_validate "TelescopeBorder",
    --                     help_normal  = hl_validate "TelescopeNormal",
    --                     help_border  = hl_validate "TelescopeBorder",
    --                     -- builtin preview only
    --                     cursor       = hl_validate "Cursor",
    --                     cursorline   = hl_validate "TelescopePreviewLine",
    --                     cursorlinenr = hl_validate "TelescopePreviewLine",
    --                     search       = hl_validate "IncSearch",
    --                     title        = hl_validate "TelescopeTitle",
    --                 },
    --             },
    --             fzf_colors = {
    --                 ["fg"] = { "fg", "TelescopeNormal" },
    --                 ["bg"] = { "bg", "TelescopeNormal" },
    --                 ["hl"] = { "fg", "TelescopeMatching" },
    --                 ["fg+"] = { "fg", "TelescopeSelection" },
    --                 ["bg+"] = { "bg", "TelescopeSelection" },
    --                 ["hl+"] = { "fg", "TelescopeMatching" },
    --                 ["info"] = { "fg", "TelescopeMultiSelection" },
    --                 ["border"] = { "fg", "TelescopeBorder" },
    --                 ["gutter"] = { "bg", "TelescopeNormal" },
    --                 ["prompt"] = { "fg", "TelescopePromptPrefix" },
    --                 ["pointer"] = { "fg", "TelescopeSelectionCaret" },
    --                 ["marker"] = { "fg", "TelescopeSelectionCaret" },
    --                 ["header"] = { "fg", "TelescopeTitle" },
    --             },
    --         })
    --     end
    -- }
}
