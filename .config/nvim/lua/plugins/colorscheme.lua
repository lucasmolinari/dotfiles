local schemes = {
  {
    'rebelot/kanagawa.nvim',
    opts = {
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      terminalColors = true,
      background = {
        dark = 'dragon',
        light = 'lotus',
      },
    },
    name = 'kanagawa',
  },
  {
    'sho-87/kanagawa-paper.nvim',
    name = 'kanagawa-paper',
  },
  { 'sainnhe/gruvbox-material', name = 'gruvbox-material' },
  { 'ellisonleao/gruvbox.nvim', name = 'gruvbox' },
  { 'rose-pine/neovim', name = 'rose-pine' },
  { 'catppuccin/nvim', name = 'catppuccin' },
  {
    'metalelf0/base16-black-metal-scheme',
    name = 'base16-black-metal-immortal',
  },
}

local curr = 'base16-black-metal-immortal'
return {
  (function()
    for _, scheme in ipairs(schemes) do
      if scheme.name == curr then
        scheme.init = function()
          vim.cmd.colorscheme(scheme.name)
          if string.sub(curr, 1, #'base16-black-metal') == 'base16-black-metal' then
            vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#121212', fg = '#c1c1c1' })
            vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#222222', fg = '#556677' })
          end
        end
        scheme.priority = 1000
        return scheme
      end
    end
  end)(),
}
