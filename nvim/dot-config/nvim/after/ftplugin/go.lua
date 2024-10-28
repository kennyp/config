vim.keymap.set("n", "<leader>t", function()
  local cmd = (":!go test ./%s/...<cr>").format(vim.fn.expand("%:h"))
  vim.cmd(cmd)
end, { desc = "run test for current package", buffer = true })

vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
