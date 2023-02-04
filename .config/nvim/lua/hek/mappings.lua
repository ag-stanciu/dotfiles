local function smart_dd()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return "\"_dd"
  else
    return "dd"
  end
end

local opts = { noremap = false }

--Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true})
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true})

-- Y yank until the end of line
-- vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

--Add move line shortcuts
vim.keymap.set('n', '<a-j>', ':m .+1<cr>==', opts)
vim.keymap.set('n', '<a-k>', ':m .-2<cr>==', opts)
vim.keymap.set('i', '<a-j>', '<esc>:m .+1<cr>==gi', opts)
vim.keymap.set('i', '<a-k>', '<esc>:m .-2<cr>==gi', opts)
vim.keymap.set('v', '<a-j>', ':m \'>+1<cr>gv=gv', opts)
vim.keymap.set('v', '<a-k>', ':m \'<-2<cr>gv=gv', opts)

-- copy whole file content
-- vim.api.nvim_set_keymap("n", "<c-a>", ":%y+<cr>", { noremap = true})

-- center search
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
-- vim.api.nvim_set_keymap('n', 'j', 'mzj`z', { noremap = true})
vim.keymap.set("n", "dd", smart_dd, { noremap = true, expr = true } )

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP", opts)

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
