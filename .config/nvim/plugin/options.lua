local opt = vim.opt

--Incremental live completion
opt.inccommand = 'nosplit'

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

--Do not save when switching buffers
opt.hidden = true

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
vim.wo.signcolumn = 'yes'

-- Pum height
opt.pumheight = 10
opt.pumblend = 5
opt.timeoutlen = 400
opt.clipboard = 'unnamedplus'

opt.scrolloff = 10
opt.sidescrolloff = 10
opt.cmdheight = 1
opt.list = true
opt.swapfile = false
opt.wrap = false
opt.showmode = false
opt.listchars = {
  -- eol = "↴",
  tab = "» ",
  trail = "-"
} -- set listchars

-- stolen from tjdevries
opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

-- GUI
opt.guifont = "CaskaydiaCove Nerd Font:h14"
-- opt.guifont = "Liga SFMono Nerd Font:h14"
