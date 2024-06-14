return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			keymaps = {
				["<C-c>"] = false,
				["<C-l>"] = false,
				["<C-h>"] = false,
				["<M-l>"] = "actions.refresh",
				["<M-h>"] = "actions.select_split",
				["<M-v>"] = "actions.select_vsplit",
				["<C-s>"] = ":w<CR>",
				["q"] = "actions.close",
			},
		})
		local map = CreateNamedMap("Oil")

		map("n", "-", "<CMD>Oil<CR>", "Open parent directory")
		map("n", "<leader>-", require("oil").toggle_float, "Toggle oil float")
	end,
}
