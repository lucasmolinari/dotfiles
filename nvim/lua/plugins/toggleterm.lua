return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = function(term)
        if term.direction == "vertical" then
          return 80
        else
          return 15
        end
      end,
      open_mapping = [[<A-1>]],
      direction = "float",
      start_in_insert = true,
      float_opts = {
        border = "double",
      },
    },
  },
}
