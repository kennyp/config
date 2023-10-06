return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = function()
        local lsp = require("lsp-zero")
        local config = require('lspconfig')

        lsp.preset('recommended')

        lsp.on_attach(function(_, bufnr)
            lsp.default_keymaps({ buffer = bufnr })
        end)

        lsp.format_on_save({
            servers = {
                ['lua_ls'] = { 'lua' },
                ['rust_analyzer'] = { 'rust' },
                ['gopls'] = { 'go' },
            }
        })

        config.gopls.setup({
            settings = {
                analysis = {
                    unusedparams = true,
                },
                gopls = {
                    buildFlags = { '-tags', 'demo,testdb' },
                },
                staticcheck = true,
            }
        })

        config.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        })
    end,
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp",
    },
}
