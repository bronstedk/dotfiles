vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Move to the window above" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Move to the window below" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Move to the window left" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Move to the window right" })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.wo.number = true
