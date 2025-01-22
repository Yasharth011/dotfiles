require("theprimeagen")

-- Enable line numbers
vim.opt.number = true

-- Enable relative line numbers (optional)
vim.opt.relativenumber = flase

-- Customize the color of line numbers
vim.cmd([[highlight LineNr guifg=#FFFFF]])

vim.opt.filetype = "on"

vim.opt.termguicolors = true

vim.api.nvim_set_option("clipboard", "unnamed")
