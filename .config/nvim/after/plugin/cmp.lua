-- local okLK, lspkind = pcall(require, 'lspkind')
local okLS, luasnip = pcall(require, 'luasnip')
local okAU, autopairs = pcall(require, 'nvim-autopairs')
local okAP, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
local okCmp, cmp = pcall(require, 'cmp')
if not (okLS or okCmp or okAP or okAU) then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

-- lspkind.init()

-- local has_words_before = function()
--   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
--     return false
--   end
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

-- local feedkey = function(key)
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
-- end

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

local icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "⌘",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "廓",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

-- nvim-cmp setup
cmp.setup {
    completion = {
        -- completeopt = "menu,menuone,noinsert",
        -- keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
        keyword_length = 1,
    },
    -- preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    -- window = {
    --   -- completion = cmp.config.window.bordered(),
    --   documentation = cmp.config.window.bordered(),
    -- },
    formatting = {
        -- fields = { "kind", "abbr", "menu" },
        format = function(_, vim_item)
            -- vim_item.menu = vim_item.kind
            -- vim_item.kind = icons[vim_item.kind]
            vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

            return vim_item
        end,
    },
    -- formatting = {
    --   format = lspkind.cmp_format ({
    --     mode = 'symbol',
    --     maxwidth = 50,
    --     with_text = true,
    --     menu = {
    --       nvim_lsp = '[LSP]',
    --       buffer = '[Buf]',
    --       path = '[FS]',
    --       luasnip = '[Snip]',
    --     },
    --   }),
    -- },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
                -- elseif has_words_before() then
                --   cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    sources = {
        { name = 'nvim_lsp', priority = 100 },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer', priority = 2, keyword_length = 5, max_item_count = 5 },
        { name = 'nvim_lsp_signature_help' },
    },
}

autopairs.setup({
    check_ts = true,
})
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
