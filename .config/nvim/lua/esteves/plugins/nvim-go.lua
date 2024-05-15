return {
	"crispgm/nvim-go",
	requires = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	build = ":GoInstallBinaries",
	config = function()
		require("go").setup({
			tags_options = {},
			-- already managed by conform
			auto_format = false,
			auto_lint = false,
		})

		vim.keymap.set("n", "<leader>ife", "<cmd> GoIfErr<CR>", { desc = "Add if err check" })
		vim.keymap.set("n", "<leader>gtj", "<cmd> GoAddTags json<CR>", { desc = "Add json struct tags" })
		vim.keymap.set("n", "<leader>grj", "<cmd> GoRemoveTags json<CR>", { desc = "Remove json struct tags" })
		vim.keymap.set("n", "<leader>gty", "<cmd> GoAddTags yaml<CR>", { desc = "Add yaml struct tags" })
		vim.keymap.set("n", "<leader>gry", "<cmd> GoRemoveTags yaml<CR>", { desc = "Remove yaml struct tags" })
		vim.keymap.set("n", "<leader>gtc", "<cmd> GoClearTags<CR>", { desc = "Clear struct tags" })
	end,
}
