return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        lazy = false,
        config = function()
            local mason_installer = require("mason-tool-installer")
            mason_installer.setup({
                ensure_installed = {
                    "ktlint",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        opts = function()
            local ret = {
                inlay_hints = { enabled = true },
                codelens = { enabled = true },
            }
            return ret
        end,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
            })
            lspconfig.ruff.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
                settings = {
                    python = {
                        pythonPath = "/Users/bronstedk/DevTools/sdks/python/myenv/bin/python",
                        venvPath = "/Users/bronstedk/DevTools/sdks/python/myenv/",
                        analysis = {
                            diagnosticMode = "workspace",
                            typeCheckingMode = "standard",
                        },
                    },
                },
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
            lspconfig.kotlin_language_server.setup({
                capabilities = capabilities,
            })
            lspconfig.jdtls.setup({
                capabilities = capabilities,
            })
            lspconfig.nushell.setup({
                capabilities = capabilities,
            })
            lspconfig.zls.setup({
                capabilities = capabilities,
                cmd = { "/opt/homebrew/bin/zls" },
            })
            -- lspconfig.dartls.setup({
            --   capabilities = capabilities,
            --})

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
            vim.keymap.set("n", "<leader>cg", vim.lsp.buf.definition, { desc = "Go to definition" })
            vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = "List references" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
        end,
    },
}
