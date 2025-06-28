return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local fzf = require('fzf-lua')
      fzf.setup({
        files = {
          -- Use ripgrep with proper exclude patterns
          cmd = "rg --files --hidden --follow --no-messages " ..
                "--glob '!.yarn/' " ..
                "--glob '!node_modules/' " ..
                "--glob '!.git/' " ..
                "--glob '!dist/' " ..
                "--glob '!build/' " ..
                "--glob '!.next/' " ..
                "--glob '!.nuxt/' " ..
                "--glob '!.vscode/' " ..
                "--glob '!.idea/' " ..
                "--glob '!target/' " ..
                "--glob '!*.log'",
        },
        grep = {
          -- Live grep with same exclusions
          rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden --follow " ..
                    "--glob '!.yarn/' " ..
                    "--glob '!node_modules/' " ..
                    "--glob '!.git/' " ..
                    "--glob '!dist/' " ..
                    "--glob '!build/' " ..
                    "--glob '!.next/' " ..
                    "--glob '!.nuxt/' " ..
                    "--glob '!.vscode/' " ..
                    "--glob '!.idea/' " ..
                    "--glob '!target/' " ..
                    "--glob '!*.log'",
        }
      })
      
      -- Keybindings
      vim.keymap.set('n', '<leader>f', fzf.files, { desc = "Find files" })
      vim.keymap.set('n', '<leader>b', fzf.buffers, { desc = "Find buffers" })
      vim.keymap.set('n', '<leader>g', fzf.live_grep, { desc = "Live grep" })
      vim.keymap.set('n', '<leader>h', fzf.help_tags, { desc = "Help tags" })
    end
  }
}
