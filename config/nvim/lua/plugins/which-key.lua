return {
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup({
        window = {
          border = "single",
        },
        plugins = {
          marks = true,
          registers = true,
        },
      })
    end
  }
}
