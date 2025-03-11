vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- colorscheme
	use({ "rose-pine/neovim", as = "rose-pine" })
	use({ "rebelot/kanagawa.nvim", as = "kanagawa" })
	use("blazkowolf/gruber-darker.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use { "qaptoR-nvim/chocolatier.nvim" }
	--
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	--status bar
	use("feline-nvim/feline.nvim")
	--
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	-- for lua code
	use("nvim-lua/plenary.nvim")
	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "lvimuser/lsp-inlayhints.nvim" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			-- Snippets
			{ "L3MON4D3/LuaSnip" },
		},
	})
	-- formatter
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
	-- file tree
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
			"b0o/nvim-tree-preview.lua",
		},
	})
	-- auto clode bracets
	use("m4xshen/autoclose.nvim")
	-- nvim status bar
	use({
		"nvim-tree/nvim-web-devicons",
		"lewis6991/gitsigns.nvim",
		"romgrk/barbar.nvim",
	})
	-- auto commenting
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	-- theme menu
	use("zaldih/themery.nvim")
	-- nvim cmd line
	use({
		"VonHeikemen/fine-cmdline.nvim",
		requires = {
			{ "MunifTanjim/nui.nvim" },
		},
	})
	-- smooth scrolling
	use("karb94/neoscroll.nvim")
end)
