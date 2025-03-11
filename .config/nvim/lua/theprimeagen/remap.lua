vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>vs", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>hs", vim.cmd.split)
vim.keymap.set("n", "<leader>/", vim.cmd.nohlsearch)
vim.keymap.set("n", "<leader>t", vim.cmd.Themery)
vim.keymap.set("n", "<leader>so", vim.cmd.source)
vim.keymap.set("v", "<leader>f", ":Format<CR>", { noremap = true, silent = true, desc = "Format file" })

