return {
	"leoluz/nvim-dap-go",
	-- requires delve: go install github.com/go-delve/delve/cmd/dlv@latest
	dependencies = "mfussenegger/nvim-dap",
	ft = "go",
	config = function()
		require("dap-go").setup()

		vim.keymap.set("n", "<leader>bgt", function()
			require("dap-go").debug_test()
		end, { desc = "Debug Go test" })

		vim.keymap.set("n", "<leader>bgl", function()
			require("dap-go").debug_last_test()
		end, { desc = "Debug last Go test" })
	end,
}
