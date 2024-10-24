return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        javascript = { 'eslint_d' },
        -- typescript = { "prettier" },
        javascriptreact = { 'eslint_d' },
        -- typescriptreact = { "prettier" },
        css = { 'prettier' },
        html = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        graphql = { 'prettier' },
        lua = { 'stylua' },
        python = { 'isort', 'black' },
      },
      -- format_on_save = {
      --   lsp_fallback = false,
      --   async = false,
      --   timeout_ms = 1000,
      -- },
    })

    vim.keymap.set(
      { 'n', 'v' },
      '<leader>pp',
      function()
        conform.format({
          lsp_fallback = true,
          async = true,
          timeout_ms = 1000,
        })
      end,
      { desc = 'Format file or range (in visual mode)' }
    )
  end,
}
