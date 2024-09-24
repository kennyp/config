local data = assert(vim.fn.stdpath("data")) --[[@as string]]

vim.opt.undodir = vim.fs.joinpath(data, "undodir")
vim.opt.undofile = true

local undogroup = vim.api.nvim_create_augroup("undogroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "/tmp/*",
  group = undogroup,
  command = "setlocal noundofile",
})
