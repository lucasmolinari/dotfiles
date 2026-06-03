-- save without formatting
vim.keymap.set({ "n", "x" }, "<C-n><C-s>", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local autoformat = vim.b[bufnr].autoformat

  vim.b[bufnr].autoformat = false
  local ok, err = pcall(vim.cmd.write)
  vim.b[bufnr].autoformat = autoformat

  if not ok then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Save Without Formatting" })
