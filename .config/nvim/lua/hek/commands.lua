-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            timeout = 40,
        })
    end,
    group = highlight_group,
})

-- trim white space
vim.cmd [[autocmd BufWritePre * :%s/\s\+$//e]]

-- Disable comment new line
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove { "c", "r", "o" }
    end,
})

vim.api.nvim_create_autocmd("BufRead", {
    pattern = "tsconfig*.json",
    callback = function()
        vim.opt.filetype = "jsonc"
    end,
})

local gen_group = vim.api.nvim_create_augroup("_general_settings", {})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf,lspinfo,man,help",
    callback = function ()
       vim.keymap.set("n", "q", ":close<CR>", { silent = true })
    end,
    group = gen_group,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function ()
        vim.opt.buflisted = false
    end,
    group = gen_group,
})

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})
