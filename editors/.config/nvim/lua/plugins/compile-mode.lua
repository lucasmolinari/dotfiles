return {
  "ej-shafran/compile-mode.nvim",
  version = "latest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "m00qek/baleia.nvim", tag = "v1.3.0" },
  },
  config = function()
    ---@type CompileModeOpts
    vim.g.compile_mode = {
      input_word_completion = true,
      ansi_color = { kind = "render", baleia_options = {} },
      ansi_osc = { kind = "render", handlers = {} },
      bang_expansion = true,
      ask_about_save = true,
      focus_compilation_buffer = true,
      use_circular_error_navigation = true,
      default_command = {
        python = "python %",
        go = "go run",
        rust = "cargo r",
      },
      error_regexp_table = {
        rustc = {
          regex = "^\\s*--> \\([^:\n]\\+\\):\\([0-9]\\+\\):\\([0-9]\\+\\)$",
          filename = 1,
          row = 2,
          col = 3,
          priority = 2,
        },
      },
    }
  end,
}
