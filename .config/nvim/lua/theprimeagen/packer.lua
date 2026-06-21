vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- colorscheme
	use({ "rose-pine/neovim", as = "rose-pine" })
	use({ "rebelot/kanagawa.nvim", as = "kanagawa" })
	use("blazkowolf/gruber-darker.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use({ "qaptoR-nvim/chocolatier.nvim" })
	use({ "nyoom-engineering/nyoom.nvim", as = "nyoom" })
	--
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-live-grep-args.nvim" } },
		config = function()
			local telescope = require("telescope")

			-- then load the extension
			telescope.load_extension("live_grep_args")
		end,
	})
	--status bar
	use("feline-nvim/feline.nvim")
	--
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	-- for lua code
	use("nvim-lua/plenary.nvim")
	-- LSP
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
	})
	use({"stevearc/conform.nvim"})
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
	-- terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup({
				size = 10,
				hide_numbers = true,
				autochdir = false,
				close_on_exit = true,
				auto_scroll = true,
			})
		end,
	})
	-- indentation
	use({"lukas-reineke/indent-blankline.nvim", tag = "v2.20.8"})
end)
