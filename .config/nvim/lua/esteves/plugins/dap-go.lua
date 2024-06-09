return {
	"leoluz/nvim-dap-go",
	-- requires delve:
	-- go install github.com/go-delve/delve/cmd/dlv@latest
	dependencies = "mfussenegger/nvim-dap",
	build = function()
		-- Run the go install command
		local result = vim.fn.system("go install github.com/go-delve/delve/cmd/dlv@latest")
		if vim.v.shell_error ~= 0 then
			vim.notify("Failed to install delve: " .. result, vim.log.levels.ERROR)
		else
			vim.notify("Successfully installed delve")
		end
	end,
	ft = "go",
	config = function()
		require("dap-go").setup()
		local map = CreateNamedMap("DAP-Go")

		map("n", "<leader>bgt", function()
			require("dap-go").debug_test()
		end, "Debug Go test")

		map("n", "<leader>bgl", function()
			require("dap-go").debug_last_test()
		end, "Debug last Go test")
	end,
}
