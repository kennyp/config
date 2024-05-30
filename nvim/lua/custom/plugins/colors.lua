-- ... this file is filled with pain

return {
  {
    "tjdevries/colorbuddy.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("fluoromachine")
    end,
  },
  "rktjmp/lush.nvim",
  "tckmn/hotdog.vim",
  "dundargoc/fakedonalds.nvim",
  "craftzdog/solarized-osaka.nvim",
  { "rose-pine/neovim", name = "rose-pine" },
  "eldritch-theme/eldritch.nvim",
  "jesseleite/nvim-noirbuddy",
  "vim-scripts/MountainDew.vim",
  "miikanissi/modus-themes.nvim",
  "rebelot/kanagawa.nvim",
  "gremble0/yellowbeans.nvim",
  "rockyzhang24/arctic.nvim",
  "folke/tokyonight.nvim",
  "Shatur/neovim-ayu",
  "RRethy/base16-nvim",
  "xero/miasma.nvim",
  "cocopon/iceberg.vim",
  "kepano/flexoki-neovim",
  "ntk148v/komau.vim",
  { "catppuccin/nvim", name = "catppuccin" },
  "uloco/bluloco.nvim",
  "LuRsT/austere.vim",
  "ricardoraposo/gruvbox-minor.nvim",
  "NTBBloodbath/sweetie.nvim",
  {
    "maxmx03/fluoromachine.nvim",
    config = function()
      require("fluoromachine").setup({
        glow = false,
        brightness = 0.1,
        theme = "fluoromachine",
        transparent = false,
        colors = {},
        overrides = {},
      })
    end,
  },
}
