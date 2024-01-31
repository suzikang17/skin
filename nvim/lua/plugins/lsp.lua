return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  event = { 'BufReadPost' },
  dependencies = {
    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
  },

  config = function()
    local keys = {
      { '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame' },
      { '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction' },

      { 'gd', vim.lsp.buf.definition, '[G]oto [D]efinition' },
      { 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences' },
      { 'gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation' },
      { 'gT', vim.lsp.buf.type_definition, 'Type [D]efinition' },
      { '<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols' },
      { '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols' },

      -- See `:help K` for why this keymap
      { 'K', vim.lsp.buf.hover, 'Hover Documentation' },
      { '<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation' },

      -- Lesser used LSP functionality
      { 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration' },
      { '<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder' },
      { '<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder' },
      {
        '<leader>wl',
        function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
        '[W]orkspace [L]ist Folders',
      },
    }
    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr
      -- set keybinds

      opts.desc = 'Show buffer diagnostics'
      keymap.set('n', '<leader>D', '<cmd>Telescope diagnostics bufnr=0<CR>', opts) -- show  diagnostics for file

      opts.desc = 'Show line diagnostics'
      keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = 'Go to previous diagnostic'
      keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = 'Go to next diagnostic'
      keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = 'Restart LSP'
      keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary

      for _, km in ipairs(keys) do
        keymap.set('n', km[1], km[2], { desc = km[3] })
      end
    end

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    -- setup lsp
    local lspconfig = require('lspconfig')

    -- configure typescript server with plugin
    lspconfig['tsserver'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    -- configure python server
    lspconfig['pyright'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure lua server (with special settings)
    lspconfig['lua_ls'].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.stdpath('config') .. '/lua'] = true,
            },
          },
        },
      },
    })
  end,
}
