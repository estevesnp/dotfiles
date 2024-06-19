require("lazy").setup({

	----------------------------
	-- LSP / LINTER / FORMATTING

	-- nvim-treesitter/nvim-treesitter
	require("esteves/plugins/treesitter"),

	-- neovim/nvim-lspconfig
	require("esteves/plugins/lsp-config"),

	-- mfussenegger/nvim-lint
	require("esteves/plugins/lint"),

	-- hrsh7th/nvim-cmp
	require("esteves/plugins/cmp"),

	-- stevearc/conform.nvim
	require("esteves/plugins/conform"),

	-- crispgm/nvim-go
	require("esteves/plugins/nvim-go"),

	-- mfussenegger/nvim-jdtls
	require("esteves/plugins/nvim-jdtls"),

	-- mfussenegger/nvim-dap
	require("esteves/plugins/dap"),

	-------
	-- UTIL

	-- christoomey/vim-tmux-navigator
	require("esteves/plugins/tmux-navigator"),

	-- nvim-telescope/telescope.nvim
	require("esteves/plugins/telescope"),

	-- ThePrimeagen/harpoon
	require("esteves/plugins/harpoon"),

	-- jiaoshijie/undotree
	require("esteves/plugins/undotree"),

	-- github/copilot.vim
	require("esteves/plugins/copilot"),

	-- nvim-treesitter/nvim-treesitter-context
	require("esteves/plugins/treesitter-context"),

	-- lewis6991/gitsigns.nvim
	require("esteves/plugins/gitsigns"),

	-- tpope/vim-commentary
	require("esteves/plugins/commentary"),

	-- tpop/vim-surround
	require("esteves/plugins/surround"),

	-- windwp/nvim-autopairs
	require("esteves/plugins/autopairs"),

	-- stevearc/oil.nvim
	require("esteves/plugins/oil"),

	-- nvim-tree/nvim-tree.lua
	require("esteves/plugins/nvim-tree"),

	---------
	-- VISUAL

	-- nvim-lualine/lualine.nvim
	require("esteves/plugins/lualine"),

	-- lukas-reineke/indent-blankline.nvim
	require("esteves/plugins/indent"),

	-- rose-pine/neovim
	require("esteves/plugins/rose-pine"),
})
