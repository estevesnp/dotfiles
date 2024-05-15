return {
	"mfussenegger/nvim-dap",
	config = function()
		vim.keymap.set("n", "<leader>bb", "<cmd> DapToggleBreakpoint<CR>", { desc = "Add Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>bc", "<cmd> DapContinue<CR>", { desc = "Continue" })
		vim.keymap.set("n", "<leader>br", "<cmd> DapRestart<CR>", { desc = "Restart" })
		vim.keymap.set("n", "<leader>bsi", "<cmd> DapStepInto<CR>", { desc = "Step Into" })
		vim.keymap.set("n", "<leader>bsv", "<cmd> DapStepOver<CR>", { desc = "Step Over" })
		vim.keymap.set("n", "<leader>bso", "<cmd> DapStepOut<CR>", { desc = "Step Out" })

		vim.keymap.set("n", "<leader>bus", function()
			local widgets = require("dap.ui.widgets")
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.open()
		end, { desc = "Open debugging sidebar" })
	end,
}
