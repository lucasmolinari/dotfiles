return {
  {
    "rebelot/kanagawa.nvim",
    opts = {
      commentStyle = { italic = true },
      keywordStyle = { italic = true },
      terminalColors = true,
      background = {
        dark = "dragon",
        light = "lotus",
      },
    },
  },
  {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
  },
  { "jacoborus/tender.vim" },
  { "sainnhe/gruvbox-material" },
  { "savq/melange-nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-paper",
    },
  },
}
