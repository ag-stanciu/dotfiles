return {
    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
    event = "BufReadPost",
    config = function()
        local blankline = require('indent_blankline')
        blankline.setup {
            char = '┊',
            filetype_exclude = { 'help, packer' },
            use_treesitter = true,
            buftype_exclude = { 'terminal', 'nofile' },
            char_highlight = 'LineNr',
            show_trailing_blankline_indent = false,
            -- show_end_of_line = true,
            space_char_blankline = ' ',
            -- show_current_context = true,
            -- show_first_indent_level = false,
        }
    end
}
