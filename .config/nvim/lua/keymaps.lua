vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>b', '', { noremap = true, silent = true, desc = '[B]uffer' })
vim.api.nvim_set_keymap('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true, desc = 'Delete currrent buffer' })

-- Bufferline
vim.api.nvim_set_keymap('n', 'H', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true, desc = 'Move focus to left buffer' })
vim.api.nvim_set_keymap('n', 'L', ':BufferLineCycleNext<CR>', { noremap = true, silent = true, desc = 'Move focus to right buffer' })
vim.api.nvim_set_keymap('n', '<A-l>', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })

-- Neogit
vim.keymap.set('n', '<leader>gn', ':Neogit<CR>', {})

-- Gitsigns
vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', {})
vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', {})

-- Navbuddy
vim.api.nvim_set_keymap('n', '<leader>nb', ':Navbuddy<CR>', { noremap = true, silent = true, desc = 'Open Navbuddy' })
