return {
  'nvim-neorg/neorg',
  lazy = false,
  version = '*',
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {},
        ['core.dirman'] = {
          config = {
            workspaces = {
              notes = '~/neorg/notes',
            },
            default_workspace = 'notes',
          },
        },
      },
    }
  end,
}
