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

	-- crispgm/nvim-go
	require("esteves/plugins/nvim-go"),

	-- mfussenegger/nvim-jdtls
	require("esteves/plugins/nvim-jdtls"),

	-- mfussenegger/nvim-dap
	require("esteves/plugins/dap"),

	-- leoluz/nvim-dap-go
	require("esteves/plugins/dap-go"),

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

	-- tpope/vim-fugitive
	require("esteves/plugins/fugitive"),

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

	-- rose-pine/neovim
	require("esteves/plugins/rose-pine"),

	-- nvim-lualine/lualine.nvim
	require("esteves/plugins/lualine"),

	-- prichrd/netrw.nvim
	require("esteves/plugins/netrw"),
})
