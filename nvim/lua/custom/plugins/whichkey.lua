return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      local wk = require("which-key")

      -- register top level names
      wk.register({
        d = { "Debug" },
        f = { "Find" },
        g = { "Git" },
        r = { "Run" },
      }, { prefix = "<leader>" })
    end,
    opts = {},
  },
}
