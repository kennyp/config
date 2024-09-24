return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local parsers = require("nvim-treesitter.parsers")

      ---@class PerserInfo[]
      ---@field fsharp ParserInfo
      local parser_configs = parsers.get_parser_configs()
      parser_configs.fsharp = {
        install_info = {
          url = "https://github.com/ionide/tree-sitter-fsharp",
          branch = "main",
          files = { "src/scanner.c", "src/parser.c" },
          location = "fsharp",
        },
        requires_generate_from_grammar = false,
        filetype = "fsharp",
        maintainers = {},
      }

      local configs = require("nvim-treesitter.configs")
      ---@diagnostic disable-next-line: missing-fields
      configs.setup({
        ensure_installed = {
          "c",
          "c_sharp",
          "elixir",
          "fsharp",
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
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        textobjects = {
          select = {
            enable = true,
            looknhead = true,
            keymaps = {
              ["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
              ["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
            },
          },
        },
      })
    end,
  },
}
