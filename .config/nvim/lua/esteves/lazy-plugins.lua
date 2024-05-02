require("lazy").setup({

	-------------------
	-- LSP / FORMATTING

	-- nvim-treesitter/nvim-treesitter
	require("esteves/plugins/treesitter"),

	-- neovim/nvim-lspconfig
	require("esteves/plugins/lsp-config"),

	-- hrsh7th/nvim-cmp
	require("esteves/plugins/cmp"),

	-- stevearc/conform.nvim
	require("esteves/plugins/conform"),

	-- olexsmir/gopher.nvim
	require("esteves/plugins/gopher"),

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

	-- tpope/vim-fugitive
	require("esteves/plugins/fugitive"),

	-- github/copilot.vim
	require("esteves/plugins/copilot"),

	-- nvim-treesitter/nvim-treesitter-context
	require("esteves/plugins/treesitter-context"),

	-- tpope/vim-commentary
	require("esteves/plugins/commentary"),

	-- windwp/nvim-autopairs
	require("esteves/plugins/autopairs"),

	---------
	-- VISUAL

	-- rose-pine/neovim
	require("esteves/plugins/rose-pine"),

	-- nvim-lualine/lualine.nvim
	require("esteves/plugins/lualine"),
})
