return {
	"olexsmir/gopher.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("gopher").setup({})

		vim.keymap.set("n", "<leader>ife", "<cmd> GoIfErr<CR>", { desc = "Add if err check" })
		vim.keymap.set("n", "<leader>gtj", "<cmd> GoTagAdd json<CR>", { desc = "Add json struct tags" })
		vim.keymap.set("n", "<leader>gty", "<cmd> GoTagAdd yaml<CR>", { desc = "Add yaml struct tags" })
		vim.keymap.set("n", "<leader>grj", "<cmd> GoTagRm json<CR>", { desc = "Remove json struct tags" })
		vim.keymap.set("n", "<leader>gry", "<cmd> GoTagRm yaml<CR>", { desc = "Remove yaml struct tags" })
	end,
}
