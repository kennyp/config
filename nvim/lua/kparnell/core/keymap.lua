vim.g.mapleader = ","

-- Window Stuff
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Netrw in file's directory" })
vim.keymap.set("n", "<left>", vim.cmd.tabp, { desc = "Previous Tab" })
vim.keymap.set("n", "<right>", vim.cmd.tabn, { desc = "Next Tab" })

-- Copy and paste using external clipboard
vim.keymap.set('n', '<leader>y', '"+y', {
    desc = "Copy to system clipboard",
    silent = true,
})
vim.keymap.set('v', '<leader>y', '"+Y', {
    desc = "Copy to system clipboard",
    silent = true,
})
vim.keymap.set('n', '<leader>p', ':set paste<CR>"+p:set nopaste<CR>', {
    desc = "Paste after from system clipboard",
    silent = true,
})
vim.keymap.set('v', '<leader>p', 'x:set paste<CR>"+p:set nopaste<CR>', {
    desc = "Paste after from system clipboard",
    silent = true,
})
vim.keymap.set('n', '<leader>P', ':set paste<CR>"+P:set nopaste<CR>', {
    desc = "Paste before from system clipboard",
    silent = true,
})
vim.keymap.set('v', '<leader>P', 'x:set paste<CR>"+P:set nopaste<CR>', {
    desc = "Paste before from system clipboard",
    silent = true,
})
