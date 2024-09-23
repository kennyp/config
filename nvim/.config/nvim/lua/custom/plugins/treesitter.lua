return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      ---@diagnostic disable-next-line: missing-fields
      configs.setup({
        ensure_installed = {
          "c",
          "elixir",
          "gleam",
          "go",
          "lua",
          "python",
          "query",
          "ruby",
          "rust",
          "vim",
          "vimdoc",
          "zig",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
      })
    end,
  },
}
