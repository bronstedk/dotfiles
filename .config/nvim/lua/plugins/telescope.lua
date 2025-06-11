return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-tree/nvim-web-devicons",
        opts = {},
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            local builtin = require("telescope.builtin")

            vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files with Telescope" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep with Telescope" })
            vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Show old files with Telescope" })

            telescope.load_extension("ui-select")
            telescope.load_extension("flutter")
        end,
    },
}
