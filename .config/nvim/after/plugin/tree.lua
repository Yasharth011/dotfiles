-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.keymap.set("n", "T", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "F", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })

-- OR setup with some options
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = false,
	},
	on_attach = function(bufnr)
		local api = require("nvim-tree.api")

		api.config.mappings.default_on_attach(bufnr)

		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		local preview = require("nvim-tree-preview")
		vim.keymap.set("n", "P", preview.watch, opts("Preview (Watch)"))
		vim.keymap.set("n", "<Esc>", preview.unwatch, opts("Close Preview/Unwatch"))
		vim.keymap.set("n", "<C-f>", function()
			return preview.scroll(4)
		end, opts("Scroll Down"))
		vim.keymap.set("n", "<C-b>", function()
			return preview.scroll(-4)
		end, opts("Scroll Up"))
	end,
})
