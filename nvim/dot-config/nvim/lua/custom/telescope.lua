local data = assert(vim.fn.stdpath("data")) --[[@as string]]

require("telescope").setup({
  extensions = {
    fzf = {},
    wrap_results = true,
    history = {
      path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
      limit = 100,
    },
  },
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "smart_history")

require("git-worktree").setup({})
pcall(require("telescope").load_extension, "git_worktree")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set(
  "n",
  "<leader>f/",
  builtin.current_buffer_fuzzy_find,
  { desc = "Current Buffer" }
)

vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep String" })

vim.keymap.set("n", "<leader>fc", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Neovim Config" })

vim.keymap.set("n", "<leader>fd", function()
  ---@diagnostic disable-next-line: param-type-mismatch
  builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
end, { desc = "Neovim Data" })

local worktree = require("telescope").extensions.git_worktree
vim.keymap.set(
  "n",
  "<leader>gw",
  worktree.git_worktree,
  { desc = "List Worktrees" }
)
vim.keymap.set(
  "n",
  "<leader>gc",
  worktree.create_git_worktree,
  { desc = "Create Worktree" }
)
