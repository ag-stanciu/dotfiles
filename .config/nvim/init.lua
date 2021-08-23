-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
      },
      {
        "nvim-telescope/telescope-media-files.nvim",
      }
    }
  }
  -- use 'folke/tokyonight.nvim'
  -- use 'navarasu/onedark.nvim'
  use 'ful1e5/onedark.nvim'
  -- use 'eddyekofo94/gruvbox-flat.nvim'
  -- use 'EdenEast/nightfox.nvim'
  -- use 'shaunsingh/nord.nvim'
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'ray-x/lsp_signature.nvim'
  -- use 'hrsh7th/nvim-compe' -- Autocompletion plugin
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'hoob3rt/lualine.nvim'
  use 'akinsho/nvim-bufferline.lua'
  use 'onsails/lspkind-nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'windwp/nvim-autopairs'
  use 'andymass/vim-matchup'
  use 'terrortylor/nvim-comment'
  use 'karb94/neoscroll.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- TS stuff
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
end)

-- disable builtin vim plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

--Incremental live completion
vim.o.inccommand = 'nosplit'

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true
vim.opt.numberwidth = 2

vim.opt.ruler = false
vim.opt.cul = true
vim.opt.cursorline = true

-- Idenline
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Pum height
vim.o.pumheight = 10
vim.o.pumblend = 5
vim.o.timeoutlen = 400
vim.o.clipboard = 'unnamedplus'

--Set colorscheme (order is important here)
vim.o.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.cmdheight = 1
vim.opt.list = true
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.listchars = {
  eol = "↲",
  tab = "» ",
} -- set listchars

-- stolen from tjdevries
vim.opt.formatoptions = vim.opt.formatoptions
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
vim.opt.guifont = "CaskaydiaCove Nerd Font:h14"
-- vim.opt.guifont = "Liga SFMono Nerd Font:h14"

-- colors
-- vim.g.onedark_terminal_italics = 2
-- vim.g.tokyonight_style = "storm"
-- vim.cmd [[colorscheme tokyonight]]
-- vim.g.onedark_style = 'darker'
-- vim.cmd[[colorscheme onedark]]
-- vim.cmd[[colorscheme nord]]
-- vim.cmd[[colorscheme gruvbox-flat]]
-- vim.cmd[[colorscheme nightfox]]
require('onedark').setup({
  colors = {
    bg = '#1e222a'
  }
})

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = {hl = "GitGutterAdd", text = "│"},
    change = {hl = "GitGutterChange", text = "│"},
    delete = {hl = "GitGutterDelete", text = "_"},
    topdelete = {hl = "GitGutterDelete", text = "‾"},
    changedelete = {hl = "GitGutterChange", text = "~"}
},
  numhl = false,
  keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,
      ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
      ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
      ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
  },
  watch_index = {
      interval = 100
  },
  sign_priority = 5,
  status_formatter = nil -- Use default,
}

-- Telescope
require('telescope').setup(
  {
    defaults = {
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
      selection_caret = " ",
      entry_prefix = " ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8
        },
        vertical = {
          mirror = false
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = {"absolute"},
      winblend = 0,
      border = {},
      borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
      color_devicons = true,
      use_less = true,
      set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case" -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      media_files = {
        filetypes = {"png", "webp", "jpg", "jpeg"},
        find_cmd = "rg" -- find command (defaults to `fd`)
      }
    }
  }
)
--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fs', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fw', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fo', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gt', [[<cmd>lua require('telescope.builtin').git_status()<CR>]], { noremap = true, silent = true })

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- borders
-- vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
-- vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=#ccc guibg=#1f2335]]

local border = {
  {"╭", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╮", "FloatBorder"},
  {"│", "FloatBorder"},
  {"╯", "FloatBorder"},
  {"─", "FloatBorder"},
  {"╰", "FloatBorder"},
  {"│", "FloatBorder"},
}
local popup_opts = { boder = border, focusable = false }
-- LSP settings
local nvim_lsp = require 'lspconfig'
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, popup_opts)
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, popup_opts)

  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

  require('lsp_signature').on_attach({
    bind = true,
    fix_pos = true,
    floating_window = false,
    hint_prefix = " ",
    handler_opts = {
      border = 'single'
    },
  })

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

local servers = {
  'gopls',
  'pyright'
}
for _, server in ipairs(servers) do
  nvim_lsp[server].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150
    }
  }
end

-- tsserver
local enable_ts = true
nvim_lsp.tsserver.setup {
  on_attach = function (client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    on_attach(client, bufnr)

    -- ts utils?
    if enable_ts then
      local ts_utils = require('nvim-lsp-ts-utils')
      ts_utils.setup({
        import_all_scan_buffers = 100,
        eslint_bin = 'eslint_d',
        eslint_enable_diagnostics = true,
        eslint_show_rule_id = true,
        enable_formatting = true,
        formatter = 'prettier_d_slim',
        update_imports_on_move = true,
      })
      ts_utils.setup_client(client)
    end
  end,
  flags = {
    debounce_text_changes = 150,
  }
}

-- null-ls
require('null-ls').config{}
nvim_lsp["null-ls"].setup({
  on_attach = on_attach
})

-- lua lang server
USER = vim.fn.expand('$USER')
local sumneko_root_path = ""
local sumneko_bin = ""
if vim.fn.has('mac') == 1 then
  sumneko_root_path = '/Users/' .. USER .. '/.config/nvim/lua-language-server'
  sumneko_bin = '/Users/' .. USER .. '/.config/nvim/lua-language-server/bin/macOS/lua-language-server'
elseif vim.fn.has('unix') == 1 then
  sumneko_root_path = '/home/' .. USER .. '/.config/nvim/lua-language-server'
  sumneko_bin = '/home/' .. USER .. '/.config/nvim/lua-language-server/bin/Linux/lua-language-server'
else
  print('Unsupported sumneko')
end
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_bin, '-E', sumneko_root_path .. '/main.lua'},
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostic = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        maxPreload = 2000,
        preloadFileSize = 1000,
      },
      telemetry = {
        enable = false
      }
    }
  }
}

-- replace the default lsp diagnostic symbols
local function lspSymbol(name, icon)
  vim.fn.sign_define("LspDiagnosticsSign" .. name, {text = icon, numhl = "LspDiagnosticsDefaul" .. name})
end

lspSymbol("Error", "")
lspSymbol("Warning", "")
lspSymbol("Information", "")
lspSymbol("Hint", "")

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = {
      prefix = "",
      spacing = 4
    },
    signs = true,
    underline = true,

    -- set this to true if you want diagnostics to show in insert mode
    update_in_insert = false
  }
)

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true, -- false will disable the whole extension
    use_languagetree = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}

-- Misc
local lspkind = require('lspkind')
lspkind.init()
require('neoscroll').setup()

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  documentation = {
    border = border,
  },
  formatting = {
    format = function (_, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      return vim_item
    end
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.prev_item(),
    ['<C-n>'] = cmp.mapping.next_item(),
    ['<C-d>'] = cmp.mapping.scroll(-4),
    ['<C-f>'] = cmp.mapping.scroll(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping.mode({ 'i', 's' }, function(_, fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end),
    ['<S-Tab>'] = cmp.mapping.mode({ 'i', 's' }, function(_, fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Autopairs
require('nvim-autopairs').setup()

-- Lualine
local lua_lsp_status = function()
  local clients = vim.lsp.get_active_clients()
  local msg = " "--"  n/a"
  if next(clients) ~= nil then
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return " "
      end
    end
    return msg
  else
    return msg
  end
end
local filepath = function ()
  return vim.fn.expand('%f')
end
require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = 'onedark',
    section_separators = {'', ''},
    component_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { filepath },
    lualine_x = {
      { "diagnostics", sources = { "nvim_lsp" }, symbols = {error=" " , warn=" ", info=" ", hint=" "} },
      { lua_lsp_status, color = { fg = "#fff" } }
    },
    lualine_y = { "filetype" },
    lualine_z = { "progress" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"progress"},
    lualine_y = {},
    lualine_z = {},
  }
})

-- Bufferine
require('bufferline').setup {
  options = {
    offsets = {{filetype = "NvimTree", text = "", padding = 1}},
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

vim.api.nvim_set_keymap("n", "<S-t>", ":enew<CR>", {noremap = true, silent = true}) -- new buffer
vim.api.nvim_set_keymap("n", "<C-t>b", ":tabnew<CR>", {noremap = true, silent = true}) -- new tab
vim.api.nvim_set_keymap("n", "<S-x>", ":bd!<CR>", {noremap = true, silent = true}) -- close tab
vim.api.nvim_set_keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", {noremap = true, silent = true})

-- Comment
require('nvim_comment').setup()
vim.api.nvim_set_keymap("n", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<leader>/", ":CommentToggle<CR>", {noremap = true, silent = true})

--Add move line shortcuts
vim.api.nvim_set_keymap('n', '<a-j>', ':m .+1<cr>==', { noremap = true})
vim.api.nvim_set_keymap('n', '<a-k>', ':m .-2<cr>==', { noremap = true})
vim.api.nvim_set_keymap('i', '<a-j>', '<esc>:m .+1<cr>==gi', { noremap = true})
vim.api.nvim_set_keymap('i', '<a-k>', '<esc>:m .-2<cr>==gi', { noremap = true})
vim.api.nvim_set_keymap('v', '<a-j>', ':m \'>+1<cr>gv=gv', { noremap = true})
vim.api.nvim_set_keymap('v', '<a-k>', ':m \'<-2<cr>gv=gv', { noremap = true})

-- copy whole file content
-- vim.api.nvim_set_keymap("n", "<c-a>", ":%y+<cr>", { noremap = true})

-- center search
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true})
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', { noremap = true})
-- vim.api.nvim_set_keymap('n', 'j', 'mzj`z', { noremap = true})

-- trim white space
vim.cmd [[autocmd BufWritePre * :%s/\s\+$//e]]

