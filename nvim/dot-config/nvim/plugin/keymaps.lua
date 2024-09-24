-- Window Stuff
vim.keymap.set("n", "<left>", vim.cmd.tabp)
vim.keymap.set("n", "<right>", vim.cmd.tabn)

-- Copy and paste using external clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "yank to system clipboard", silent = true })
vim.keymap.set("v", "<leader>Y", '"+Y', { desc = "yank to system clipboard", silent = true })
vim.keymap.set(
  "n",
  "<leader>p",
  ':set paste<CR>"+p:set nopaste<CR>',
  { desc = "put after cursor from system clipboard", silent = true }
)
vim.keymap.set(
  "v",
  "<leader>p",
  'x:set paste<CR>"+p:set nopaste<CR>',
  { desc = "put after cursor from system clipboard", silent = true }
)
vim.keymap.set(
  "n",
  "<leader>P",
  ':set paste<CR>"+P:set nopaste<CR>',
  { desc = "put before cursor from system clipboard", silent = true }
)
vim.keymap.set(
  "v",
  "<leader>P",
  'x:set paste<CR>"+P:set nopaste<CR>',
  { desc = "put before cursor from system clipboard", silent = true }
)
