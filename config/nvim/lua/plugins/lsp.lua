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
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      -- mason-lspconfig v2 calls vim.lsp.enable() for every installed server,
      -- picking up the vim.lsp.config() overrides set in nvim-lspconfig below
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "pyright", "jdtls", "eslint", "jsonls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "b0o/schemastore.nvim" },
    config = function()
      -- Configure diagnostics display
      vim.diagnostic.config({
        virtual_text = true,      -- Show diagnostics inline
        underline = true,         -- Underline problematic text
        update_in_insert = false, -- Don't update while typing
        severity_sort = true,     -- Sort by severity
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
        },
      })

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
          -- Add diagnostic navigation
          vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, opts)
          vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, opts)
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
        end,
      })

      -- Formatting on save is handled by conform.nvim (see prettier.lua)

      -- Configure LSP servers
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- TypeScript/JavaScript LSP
      vim.lsp.config('ts_ls', {
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

      -- Keep lspconfig's on_attach, which defines LspEslintFixAll
      local base_eslint_on_attach = vim.lsp.config.eslint.on_attach
      vim.lsp.config('eslint', {
        filetypes = {
          "javascript", "javascriptreact", "typescript", "typescriptreact"
        },
        settings = {
          workingDirectories = { mode = "auto" }
        },
        on_attach = function(client, bufnr)
          if base_eslint_on_attach then
            base_eslint_on_attach(client, bufnr)
          end
          -- Auto-fix on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "LspEslintFixAll",
          })
        end,
      })

      vim.lsp.config('jsonls', {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      })
    end
  }
}
