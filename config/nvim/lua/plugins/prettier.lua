return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    config = function()
      local prettier = { 'prettierd', 'prettier', stop_after_first = true }
      require('conform').setup({
        formatters_by_ft = {
          javascript = prettier,
          javascriptreact = prettier,
          typescript = prettier,
          typescriptreact = prettier,
          json = prettier,
        },
        -- Fall back to the LSP formatter when prettier isn't available
        format_on_save = {
          timeout_ms = 1000,
          lsp_format = 'fallback',
        },
      })
    end
  }
}
