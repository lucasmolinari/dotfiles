return {
  "snacks.nvim",
  opts = {
    dashboard = {
      pane_gap = 4,
      sections = {
        {
          section = "terminal",
          cmd = "chafa ~/Images/ari.jpeg --format symbols --symbols vhalf --size 60x17 --stretch; sleep .1",
          height = 17,
          padding = 1,
        },
        {
          pane = 2,
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
