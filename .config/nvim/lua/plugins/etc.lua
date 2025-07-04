return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'mhinz/vim-startify' },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'echasnovski/mini.nvim',
    config = function()
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- - ga  - Start [A]lign
      -- - gA  - Start [A]lign with preview
      -- - ga= - [A]lign with '=' as split
      -- - ga, - [A]lign with ',' as split
      require('mini.align').setup()

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
  {
    'SmiteshP/nvim-navic',
    dependencies = 'neovim/nvim-lspconfig',
    config = function()
      require('nvim-navic').setup {
        highlight = true,
        separator = ' > ',
        depth_limit = 5,
        icons = {
          Function = 'ƒ ',
          Method = 'm ',
        },
        click = true,
        format_text = function(text, _)
          if text == 'closure' then
            return '[closure]'
          end
          return text
        end,
      }
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    version = '*',
    config = function()
      require('nvim-ts-autotag').setup {}
    end,
  },
  {
    'brenoprata10/nvim-highlight-colors',
    version = '*',
    opts = {
      virtual_symbol = '■',
      virtual_symbol_position = 'eol',
    },
  },
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      require('nvim-tmux-navigation').setup {
        keybindings = {
          left = '<M-h>',
          down = '<M-j>',
          up = '<M-k>',
          right = '<M-l>',
          last_active = '<M-\\>',
          next = '<M-Space>',
        },
      }
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      icons = {
        mappings = true,
      },
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
      },
    },
  },
  {
    'barklan/capslock.nvim',
    lazy = true,
    keys = {
      { '<C-l>', '<Plug>CapsLockToggle', mode = { 'i', 'c' } },
      { '<leader>cc', '<Plug>CapsLockToggle', mode = { 'n' } },
    },
    config = true,
  },
}
