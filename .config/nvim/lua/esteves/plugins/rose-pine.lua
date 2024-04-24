return {
	"rose-pine/neovim", as = "rose-pine",
	config = function()
		local configs = require("rose-pine").setup({
			styles = { italic = false }
		})
		vim.cmd("colorscheme rose-pine")

	end
}
