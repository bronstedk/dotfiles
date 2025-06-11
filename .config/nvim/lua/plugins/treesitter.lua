return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = { "nushell/tree-sitter-nu" },
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                auto_install = false,
                ensure_installed = {
                    "bash",
                    "nu",
                    "ruby",
                    "html",
                    "css",
                    "scss",
                    "javascript",
                    "typescript",
                    "json",
                    "lua",
                    "kotlin",
                    "java",
                },
                highlight = { enable = true },
                indent = { enable = false },
            })
        end,
    },
}
