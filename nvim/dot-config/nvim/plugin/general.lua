local config = assert(vim.fn.stdpath("config")) --[[@as string]]
local data = assert(vim.fn.stdpath("data")) --[[@as string]]

vim.o.number = true
vim.o.numberwidth = 4

vim.opt.undodir = vim.fs.joinpath(data, "undodir")
vim.opt.undofile = true

local undogroup = vim.api.nvim_create_augroup("undogroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = undogroup,
  pattern = "/tmp/*",
  command = "setlocal noundofile",
})

local ftgroup = vim.api.nvim_create_augroup("ftgroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead" }, {
  group = ftgroup,
  pattern = {
    vim.fs.joinpath(config, "..", "git") .. "/*",
    "*/dot-config/git/*",
  },
  command = "setlocal ft=gitconfig",
})
