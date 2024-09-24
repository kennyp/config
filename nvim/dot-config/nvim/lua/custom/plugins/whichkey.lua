return {
  {
    "folke/which-key.nvim",
    dependencies = {
      "echasnovski/mini.icons",
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>d", group = "Debug", icon = { icon = "𖢥", color = "red" } },
        { "<leader>f", group = "Find", icon = { icon = "🔍", color = "green" } },
        { "<leader>fo", icon = { icon = "󰙅", color = "green" } },
        { "<leader>p", icon = { icon = "", color = "azure" } },
        { "<leader>P", icon = { icon = "", color = "azure" } },
        { "<leader>y", icon = { icon = "", color = "azure" } },
        { "<leader>g", group = "Git", icon = { cat = "filetype", name = "git" } },
        { "<leader>r", group = "Run", icon = { icon = "▷", color = "green" } },
        {
          "<leader>b",
          group = "buffers",
          expand = function()
            return require("which-key.extras").expand.buf()
          end,
        },
      })
    end,
    opts = {},
  },
}
