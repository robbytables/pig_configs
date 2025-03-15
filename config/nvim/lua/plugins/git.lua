return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '│' },
          change = { text = '││' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        -- Enable line number highlighting in the sign column
        numhl = true,
        -- Update signs in insert mode
        update_debounce = 100,
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          
          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, {expr=true, desc = "Next git hunk"})

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, {expr=true}, "Prev git hunk")

          -- Actions
          map('n', '<leader>hs', gs.stage_hunk, {desc = "Stage hunk"})
          map('n', '<leader>hr', gs.reset_hunk, {desc = "Reset hunk"})
          map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "Stage selected hunk"})
          map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "Reset selected hunk"})
          map('n', '<leader>hS', gs.stage_buffer, {desc = "Stage buffer"})
          map('n', '<leader>hu', gs.undo_stage_hunk, {desc = "Undo stage hunk"})
          map('n', '<leader>hR', gs.reset_buffer, {desc = "Reset buffer"})
          map('n', '<leader>hp', gs.preview_hunk, {desc = "Preview hunk"})
          map('n', '<leader>hb', function() gs.blame_line{full=true} end, {desc = "Blame line"})
          map('n', '<leader>tb', gs.toggle_current_line_blame, {desc = "Toggle line blame"})
          map('n', '<leader>hd', gs.diffthis, {desc = "Diff this"})
          map('n', '<leader>hD', function() gs.diffthis('~') end, {desc = "Diff this ~"})
          map('n', '<leader>td', gs.toggle_deleted, {desc = "Toggle deleted"})
        end,
        -- show word diff in the gutter when you hover
        word_diff = false,
        -- Change how the diff is calculated, 'linematch' is better but more expensive
        diff_opts = {
          algorithm = 'patience',
          internal = true,
        },
      })
    end
  },
  {
    'tpope/vim-fugitive'
  }
}
