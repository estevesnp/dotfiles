return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "go", "rust", "java", "javascript", "typescript", "html", "lua" },
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
