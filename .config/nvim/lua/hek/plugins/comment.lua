return {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function()
        local comment = require("Comment")
        comment.setup {
            padding = true,
            sticky = true,
            toggler = {
                line = "gcc",
                block = "gbc",
            },
            opleader = {
                line = "gc",
                block = "gb",
            },
            mappings = {
                basic = true,
                extra = true,
                extended = false,
            },
        }
    end
}
