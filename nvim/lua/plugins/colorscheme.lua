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
}

local curr = 'gruvbox'
return {
  (function()
    for _, scheme in ipairs(schemes) do
      if scheme.name == curr then
        scheme.init = function()
          vim.cmd.colorscheme(scheme.name)
          vim.cmd.hi 'Comment gui=none'
        end
        scheme.priority = 1000
        return scheme
      end
    end
  end)(),
}
