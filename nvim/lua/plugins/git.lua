return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
      vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', {})
      vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', {})
    end,
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',

      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('neogit').setup {}
      vim.keymap.set('n', '<leader>gn', ':Neogit<CR>', {})
    end,
  },
}
