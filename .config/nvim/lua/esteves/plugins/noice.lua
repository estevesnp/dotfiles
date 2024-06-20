return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
		{
			"rcarriga/nvim-notify",
			opts = {
				stages = "static",
				timeout = 3000,
				max_height = function()
					return math.floor(vim.o.lines * 0.75)
				end,
				max_width = function()
					return math.floor(vim.o.columns * 0.75)
				end,
				on_open = function(win)
					vim.api.nvim_win_set_config(win, { zindex = 100 })
				end,
			},
		},
	},
	opts = {},
	config = function()
		vim.notify = require("notify")
		local noice = require("noice")

		noice.setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
		})

		local map = CreateNamedMap("Noice")

		map("c", "<C-r>", function()
			noice.redirect(vim.fn.getcmdline())
		end, "Redirect command-line to Noice")

		map("n", "<leader>nl", function()
			noice.cmd("last")
		end, "Open last notification")

		map("n", "<leader>nh", function()
			noice.cmd("history")
		end, "Open notification history")

		map("n", "<leader>nd", function()
			noice.dismiss({ silent = true, pending = true })
		end, "Dismiss all notifications")

		map("n", "<leader>ns", function()
			noice.cmd("pick")
		end, "Open notifications in Telescope")
	end,
}
