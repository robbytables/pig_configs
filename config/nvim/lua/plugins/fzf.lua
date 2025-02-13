return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local fzf = require('fzf-lua')
      fzf.setup({})
      
      -- Keybindings
      vim.keymap.set('n', '<leader>f', fzf.files, { desc = "Find files" })
      vim.keymap.set('n', '<leader>b', fzf.buffers, { desc = "Find buffers" })
      vim.keymap.set('n', '<leader>g', fzf.live_grep, { desc = "Live grep" })
      vim.keymap.set('n', '<leader>h', fzf.help_tags, { desc = "Help tags" })
    end
  }
}

