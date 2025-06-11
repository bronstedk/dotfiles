return {
    "vim-test/vim-test",
    dependencies = {
        "preservim/vimux",
    },
    config = function()
        vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { desc = "Run nearest test" })
        vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { desc = "Run all tests in file" })
        vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", { desc = "Run the entire test suite" })
        vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { desc = "Re-run last test" })
        vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", { desc = "Go to last test file" })
        vim.cmd("let test#strategy = 'vimux'")
    end,
}
