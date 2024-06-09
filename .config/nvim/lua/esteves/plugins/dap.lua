return {
	"mfussenegger/nvim-dap",
	config = function()
		local map = CreateNamedMap("DAP")

		map("n", "<leader>bb", "<cmd> DapToggleBreakpoint<CR>", "Add Toggle Breakpoint")
		map("n", "<F5>", "<cmd> DapContinue<CR>", "Continue")
		map("n", "<F10>", "<cmd> DapStepOver<CR>", "Step Over")
		map("n", "<F11>", "<cmd> DapStepInto<CR>", "Step Into")
		map("n", "<F12>", "<cmd> DapStepOut<CR>", "Step Out")

		map("n", "<leader>bs", function()
			local widgets = require("dap.ui.widgets")
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.open()
		end, "Open debugging sidebar")
	end,
}
