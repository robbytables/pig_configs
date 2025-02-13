return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'catppuccin'
        }
      })
    end
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true })
    end
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup({
        options = {
          diagnostics = "nvim_lsp",
          separator_style = "slant",
        }
      })
      -- Buffer navigation
      vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>')
      vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>')
      vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>')
      vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>')
    end
  }
}
