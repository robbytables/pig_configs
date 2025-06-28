return {
  {
  "b0o/schemastore.nvim",
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "pyright", "jdtls", "eslint", "jsonls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      
      -- Setup keybinds when an LSP attaches to a buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end,
      })

      -- Format on save
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.{js,jsx,ts,tsx,json}',
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })

      -- Configure LSP servers
      lspconfig.lua_ls.setup({
        filetypes = {
          "typescript", "typescriptreact", "javascript", "javascriptreact"
        },
        settings = {
          typescript = {
            preferences = {
              includePackageJsonAutoImports = "auto",
              importModuleSpecifier = "relative"
            }
          },
          javascript = {
            preferences = {
              includePackageJsonAutoImports = "auto"
            }
          }
        }
      })

      lspconfig.eslint.setup({
        filetypes = { 
          "javascript", "javascriptreact", "typescript", "typescriptreact" 
        },
        settings = {
          workingDirectories = { mode = "auto" }
        }
      })

      lspconfig.jsonls.setup({
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      })

      lspconfig.pyright.setup({})
      lspconfig.jdtls.setup({})
    end
  }
}
