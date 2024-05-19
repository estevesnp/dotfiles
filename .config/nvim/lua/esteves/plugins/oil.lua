return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			keymaps = {
				["<C-c>"] = false,
				["<C-l>"] = false,
				["<C-h>"] = false,
				["<M-l>"] = "actions.refresh",
				["<M-h>"] = "actions.select_split",
				["<M-v>"] = "actions.select_vsplit",
				["q"] = "actions.close",
			},
			view_options = {
				show_hidden = true,
			},
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Toggle oil float" })
	end,
}
