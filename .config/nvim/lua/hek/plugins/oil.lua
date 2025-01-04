return {
    'stevearc/oil.nvim',
    event = "VeryLazy",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        local util = require("hek.util")
        require('oil').setup({
            delete_to_trash = true,
            view_options = {
                show_hidden = true,
            },
            float = {
                border = util.border_chars_outer_thin,
            },
            confirmation = {
                border = util.border_chars_outer_thin,
            }

        })
        vim.keymap.set("n", "-", "<cmd>Oil<CR>")
        vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
    end,
}
