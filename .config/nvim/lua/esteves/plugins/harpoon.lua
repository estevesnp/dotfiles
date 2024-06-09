return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
		local map = CreateNamedMap("Harpoon")

		map("n", "<leader>a", function()
			harpoon:list():add()
		end, "Add to  H[A]rpoon")

		map("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, "Toggle [E]xplorer")

		map("n", "<C-A-p>", function()
			harpoon:list():prev()
		end, "Navigate to [P]revious")

		map("n", "<C-A-n>", function()
			harpoon:list():next()
		end, "Navigate to [N]ext")
	end,
}
