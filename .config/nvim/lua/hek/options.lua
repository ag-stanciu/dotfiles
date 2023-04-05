local opt = vim.opt

--Set highlight on search
opt.hlsearch = false

--Make line numbers default
opt.number = true
opt.numberwidth = 2

opt.ruler = false
opt.cul = true
opt.cursorline = true

-- Idenline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.linespace = 1

--Do not save when switching buffers
-- opt.hidden = true

--Enable mouse mode
opt.mouse = 'a'

--Enable break indent
opt.breakindent = true

--Save undo history
opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

--Decrease update time
opt.updatetime = 250
opt.signcolumn = 'yes'

-- true colors
opt.termguicolors = true

-- Pum height
opt.pumheight = 10
opt.pumblend = 5
opt.winblend = 5
opt.timeoutlen = 400
opt.clipboard = 'unnamedplus'

opt.scrolloff = 10
opt.sidescrolloff = 10
opt.cmdheight = 0
opt.list = true
opt.swapfile = false
opt.wrap = false
opt.showmode = false
opt.listchars = {
    -- eol = "↴",
    tab = "» ",
    -- trail = "-"
    trail = "·"
} -- set listchars
opt.fillchars:append({
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┨',
    vertright = '┣',
    verthoriz = '╋',
})

opt.laststatus = 3
opt.shortmess:append('c')

-- stolen from tjdevries
opt.formatoptions = opt.formatoptions
    - "a" -- Auto formatting is BAD.
    - "t" -- Don't auto format my code. I got linters for that.
    + "c" -- In general, I like it when comments respect textwidth
    + "q" -- Allow formatting comments w/ gq
    - "o" -- O and o, don't continue comments
    - "r" -- But do continue when pressing enter.
    + "n" -- Indent past the formatlistpat, not underneath it.
    + "j" -- Auto-remove comments if possible.
    - "2" -- I'm not in gradeschool anymore

-- GUI
opt.guifont = "Hasklug Nerd Font:h13"
if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
    vim.g.neovide_input_macos_alt_is_meta = true

    vim.g.neovide_padding_top = 2
    vim.g.neovide_padding_bottom = 2
    vim.g.neovide_padding_right = 2
    vim.g.neovide_padding_left = 2

    -- vim.g.neovide_floating_blur_amount_x = 5.0
    -- vim.g.neovide_floating_blur_amount_y = 5.0
    --
    -- -- Helper function for transparency formatting
    -- local alpha = function()
    --   return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
    -- end
    -- -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    -- vim.g.neovide_transparency = 0.0
    -- vim.g.transparency = 0.9
    -- vim.g.neovide_background_color = "#1f2335" .. alpha()
end

vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
