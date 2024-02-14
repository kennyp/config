return {
    'catppuccin/vim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        vim.cmd [[colorscheme catppuccin_macchiato]]
    end
}
