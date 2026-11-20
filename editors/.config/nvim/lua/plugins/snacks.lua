vim.api.nvim_clear_autocmds({
  group = "nvim.terminal",
  event = "TermClose",
})

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
    _   __                _
   / | / /__  ____ _   __(_)___ ___
  /  |/ / _ \/ __ \ | / / / __ `__ \
 / /|  /  __/ /_/ / |/ / / / / / / /
/_/ |_/\___/\____/|___/_/_/ /_/ /_/
        ]],
      },
      pane_gap = 4,
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            local cwd = vim.fn.getcwd()

            vim.fn.system({
              "git",
              "-C",
              cwd,
              "rev-parse",
              "--is-inside-work-tree",
            })

            return vim.v.shell_error == 0
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
  },
}
