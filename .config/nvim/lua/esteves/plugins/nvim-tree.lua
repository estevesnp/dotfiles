return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			hijack_netrw = false,
		})
		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
	end,
}
