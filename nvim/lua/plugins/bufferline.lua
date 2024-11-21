return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          separator_style = 'slant',
          sort_by = 'directory',
          diagnostics = 'nvim_lsp',
          hover = {
            enabled = false,
          },
        },
      }
    end,
  },
}
