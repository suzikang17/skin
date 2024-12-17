-- Autocompletion
return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'L3MON4D3/LuaSnip', -- snippet engine
    'saadparwaiz1/cmp_luasnip', -- for nvim-cmp
    'hrsh7th/cmp-buffer', -- source for text in buffer
    'hrsh7th/cmp-path', -- source for file system paths
    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
    'onsails/lspkind.nvim', -- vs-code like pictograms
    'rafamadriz/friendly-snippets', -- adds useful snippets
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-u>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
        ['<C-x>'] = cmp.mapping.abort(), -- close completion window
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),

      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' }, -- text within current buffer
        { name = 'path' }, -- file system paths
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = '...',
        }),
      },
    })
  end,
}
