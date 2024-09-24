local data = assert(vim.fn.stdpath("data")) --[[@as string]]

vim.opt.undodir = vim.fs.joinpath(data, "undodir")
vim.opt.undofile = true
