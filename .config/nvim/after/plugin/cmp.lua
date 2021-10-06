local okLK, lspkind = pcall(require, 'lspkind')
local okLS, luasnip = pcall(require, 'luasnip')
local okCmp, cmp = pcall(require, 'cmp')
if not (okLK or okLS or okCmp) then
  return
end

local utils = require('utils')
lspkind.init()


local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'
vim.opt.shortmess:append 'c'

-- nvim-cmp setup
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  documentation = {
    border = utils.border
  },
  formatting = {
    format = function (entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        buffer = '[Buf]',
        path = '[FS]',
        luasnip = '[Snip]',
      })[entry.source.name]
      vim_item.kind = lspkind.presets.default[vim_item.kind] .. ' ' .. vim_item.kind
      return vim_item
    end
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        feedkey('<C-n>')
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if vim.fn.pumvisible() == 1 then
        feedkey('<C-p>')
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp', priority = 1 },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
}

