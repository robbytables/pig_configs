return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "bash",
          "lua",
          "vim",
          "javascript",
          "typescript",
          "python",
          "markdown",
          "yaml",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}

