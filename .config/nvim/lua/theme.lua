local scheme = 'darkmatter'

vim.cmd.colorscheme(scheme)
if string.sub(scheme, 1, #'base16-black-metal') == 'base16-black-metal' then
  vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#1e1e2e', fg = '#cdd6f4' })
  vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#313244', fg = '#556677' })
  vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#45475a' })
end
