return {
    'akinsho/nvim-bufferline.lua',
    event = "VeryLazy",
    config = function()
        local bufferline = require('bufferline')
        -- Bufferine
        bufferline.setup {
            options = {
                offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
                buffer_close_icon = "",
                modified_icon = "",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 14,
                max_prefix_length = 13,
                tab_size = 20,
                show_tab_indicators = true,
                enforce_regular_tabs = false,
                view = "multiwindow",
                show_buffer_close_icons = true,
                separator_style = "thin",
                -- mappings = true,
                always_show_bufferline = true
            }
        }

        vim.keymap.set("n", "<S-t>", ":enew<CR>", { silent = true })
        vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { silent = true })
        vim.keymap.set("n", "<S-x>", ":bd!<CR>", { silent = true })
        vim.keymap.set("n", "<TAB>", ":BufferLineCycleNext<CR>", { silent = true })
        vim.keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { silent = true })
    end
}
