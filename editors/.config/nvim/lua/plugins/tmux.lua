return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    local nvim_tmux_nav = require("nvim-tmux-navigation")

    nvim_tmux_nav.setup({})

    local mappings = {
      ["<M-h>"] = {
        command = "NvimTmuxNavigateLeft",
        action = nvim_tmux_nav.NvimTmuxNavigateLeft,
        desc = "Go to Left Pane",
      },
      ["<M-j>"] = {
        command = "NvimTmuxNavigateDown",
        action = nvim_tmux_nav.NvimTmuxNavigateDown,
        desc = "Go to Lower Pane",
      },
      ["<M-k>"] = {
        command = "NvimTmuxNavigateUp",
        action = nvim_tmux_nav.NvimTmuxNavigateUp,
        desc = "Go to Upper Pane",
      },
      ["<M-l>"] = {
        command = "NvimTmuxNavigateRight",
        action = nvim_tmux_nav.NvimTmuxNavigateRight,
        desc = "Go to Right Pane",
      },
    }

    local function set_navigation_keymaps()
      for key, mapping in pairs(mappings) do
        vim.keymap.set("n", key, mapping.action, { desc = mapping.desc, silent = true })
        vim.keymap.set({ "i", "v" }, key, "<Esc><Cmd>" .. mapping.command .. "<CR>", {
          desc = mapping.desc,
          silent = true,
        })
        vim.keymap.set("t", key, "<C-\\><C-n><Cmd>" .. mapping.command .. "<CR>", {
          desc = mapping.desc,
          silent = true,
        })
      end

      vim.keymap.set("n", "<M-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive, {
        desc = "Go to Last Active Pane",
        silent = true,
      })
      vim.keymap.set("n", "<M-Space>", nvim_tmux_nav.NvimTmuxNavigateNext, {
        desc = "Go to Next Pane",
        silent = true,
      })
    end

    vim.schedule(set_navigation_keymaps)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimKeymaps",
      callback = function()
        vim.schedule(set_navigation_keymaps)
      end,
    })
  end,
}
