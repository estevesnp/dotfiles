return {
	"mfussenegger/nvim-dap",
	config = function()
		vim.keymap.set("n", "<leader>bb", "<cmd> DapToggleBreakpoint<CR>", { desc = "Add Toggle Breakpoint" })
		vim.keymap.set("n", "<F5>", "<cmd> DapContinue<CR>", { desc = "Continue" })
		vim.keymap.set("n", "<F10>", "<cmd> DapStepOver<CR>", { desc = "Step Over" })
		vim.keymap.set("n", "<F11>", "<cmd> DapStepInto<CR>", { desc = "Step Into" })
		vim.keymap.set("n", "<F12>", "<cmd> DapStepOut<CR>", { desc = "Step Out" })

		vim.keymap.set("n", "<leader>bs", function()
			local widgets = require("dap.ui.widgets")
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.open()
		end, { desc = "Open debugging sidebar" })
	end,
}
