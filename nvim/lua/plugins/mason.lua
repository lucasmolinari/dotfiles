return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  opts = {
    ensure_instaled = {
      "lua_ls",
      "rust_analyzer",
      "tsserver",
    },
  },
}
